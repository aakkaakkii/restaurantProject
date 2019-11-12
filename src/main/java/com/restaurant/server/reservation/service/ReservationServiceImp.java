package com.restaurant.server.reservation.service;

import com.restaurant.common.FilterModel;
import com.restaurant.server.reservation.api.ReservationService;
import com.restaurant.server.reservation.entity.Reservation;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Service
public class ReservationServiceImp implements ReservationService {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Reservation> load(FilterModel filter) {
        TypedQuery<Reservation> query;

        query = em.createQuery("select r from Reservation r order by r.id desc", Reservation.class);

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
    public Reservation save(Reservation reservation) {
        if (reservation.getId() == null) {
            em.persist(reservation);
        } else {
            return em.merge(reservation);
        }
        return reservation;
    }

    @Override
    public Integer count(FilterModel filter) {
        return Math.toIntExact(em.createQuery("select COUNT(r) from Reservation r", Long.class).getSingleResult());
    }

    @Override
    public void delete(Reservation reservation) {
        em.remove(reservation);
    }
}
