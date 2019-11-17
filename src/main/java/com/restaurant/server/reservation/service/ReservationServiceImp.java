package com.restaurant.server.reservation.service;

import com.restaurant.common.CustomException;
import com.restaurant.common.FilterModel;
import com.restaurant.security.api.UserService;
import com.restaurant.security.entity.User;
import com.restaurant.server.mailService.MailSender;
import com.restaurant.server.reservation.api.ReservationService;
import com.restaurant.server.reservation.entity.Reservation;
import com.restaurant.server.reservation.entity.Table;
import com.restaurant.server.util.MyDateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.Date;
import java.util.List;

@Service
public class ReservationServiceImp implements ReservationService {
    @PersistenceContext
    private EntityManager em;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private UserService userService;

    @Override
    public List<Reservation> load(FilterModel filter) {
        TypedQuery<Reservation> query;

        query = em.createQuery("select r from Reservation r order by r.isReservedFrom desc", Reservation.class);

        if (filter.getStart() > 0) {
            query.setFirstResult(filter.getStart());
        }
        if (filter.getLimit() > 0) {
            query.setMaxResults(filter.getLimit());
        }

        return query.getResultList();
    }

    @Override
    public Reservation getById(Long id) {
        List<Reservation> queue = em
                .createQuery("select r from Reservation r where r.id=:id", Reservation.class)
                .setParameter("id", id).getResultList();

        if (queue.isEmpty()) {
            return null;
        } else {
            return queue.get(0);
        }
    }

    @Override
    public Reservation add(Reservation reservation) throws CustomException {
        checkIsReserved(reservation.getIsReservedFrom(), reservation.getIsReservedTo(), reservation.getTable());
        em.persist(reservation);

        sendMails(reservation);

        return reservation;
    }

    @Override
    public Reservation update(Reservation reservation) throws CustomException {
        checkIsReserved(reservation.getIsReservedFrom(), reservation.getIsReservedTo(), reservation.getTable());
        return em.merge(reservation);
    }

    @Override
    public Integer count(FilterModel filter) {
        return Math.toIntExact(em.createQuery("select COUNT(r) from Reservation r", Long.class).getSingleResult());
    }

    @Override
    public void delete(Reservation reservation) {
        em.remove(reservation);
    }

    @Override
    public List<Reservation> getReservedTime(Long tableId, Date date) {

        Date selectedDate = MyDateUtil.getDate(date);
        Date nextDayDate = MyDateUtil.getNextDay(selectedDate);

        return em.createQuery("select d from Reservation d where d.table.id=:tableId and :date<d.isReservedFrom and :nextDay>d.isReservedTo", Reservation.class)
                .setParameter("tableId", tableId)
                .setParameter("date", selectedDate)
                .setParameter("nextDay", nextDayDate)
                .getResultList();
    }

    private void checkIsReserved(Date from, Date to, Table table) throws CustomException {
        List<Reservation> reservationList = em
                .createQuery("select d from Reservation d where d.table.id=:tableId and (" +
                                "(:fromDate>=d.isReservedFrom and :fromDate<=d.isReservedTo) " +
                                "or (:toDate>=d.isReservedFrom and :toDate<=d.isReservedTo)" +
                                "or (d.isReservedFrom>=:fromDate and d.isReservedFrom<=:toDate) " +
                                "or (d.isReservedTo>=:fromDate and d.isReservedTo<=:toDate)" +
                                ")"
                        , Reservation.class)
                .setParameter("tableId", table.getId())
                .setParameter("fromDate", from)
                .setParameter("toDate", to)
                .getResultList();

        if (reservationList.size() == table.getTableCount()) {
            throw new CustomException(CustomException.Type.TABLE_IS_RESERVED, HttpStatus.NOT_ACCEPTABLE.value());
        }
    }

    private void sendMails(Reservation reservation){
        List<User> users = userService.loadUsers(new FilterModel());

        String subject = "Reservation";
        String message = reservation.getName() + " reserved " + reservation.getTable().getTableSize()+ " person table "
                +MyDateUtil.formatDateNormal(reservation.getIsReservedFrom())
                + " from: " +MyDateUtil.getHouerMinute(reservation.getIsReservedFrom())
                + " to: " +MyDateUtil.getHouerMinute(reservation.getIsReservedTo())
                + "\n" + "phone: "+ reservation.getPhoneNumber();

        for (User u : users){
            if (u.getMail() != null && !u.getMail().isEmpty()){
                mailSender.send(u.getMail(), subject, message);
            }
        }
    }
}
