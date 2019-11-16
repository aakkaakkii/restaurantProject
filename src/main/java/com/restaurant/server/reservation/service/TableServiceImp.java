package com.restaurant.server.reservation.service;

import com.restaurant.common.CustomException;
import com.restaurant.common.FilterModel;
import com.restaurant.server.reservation.api.TableService;
import com.restaurant.server.reservation.entity.Table;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Service
public class TableServiceImp implements TableService {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Table> load(FilterModel filter) {
        TypedQuery<Table> query;

        query = em.createQuery("select t from Table t order by t.id desc", Table.class);

        if (filter.getStart() > 0) {
            query.setFirstResult(filter.getStart());
        }
        if (filter.getLimit() > 0) {
            query.setMaxResults(filter.getLimit());
        }

        return query.getResultList();
    }

    @Override
    public Table getById(Long id) {
        List<Table> queue = em
                .createQuery("select t from Table t where t.id=:id", Table.class)
                .setParameter("id", id).getResultList();

        if (queue.isEmpty()) {
            return null;
        } else {
            return queue.get(0);
        }
    }

    @Override
    public Table save(Table table) throws CustomException {
        if (table.getId() == null) {
            List<Table> t = em.createQuery("select t from Table t where t.tableSize=:tableSize", Table.class)
                    .setParameter("tableSize", table.getTableSize()).getResultList();

            if (!t.isEmpty()){
                throw new CustomException(CustomException.Type.TABLE_EXISTS, HttpStatus.BAD_REQUEST.value());
            }
            em.persist(table);
        } else {
            return em.merge(table);
        }
        return table;
    }

    @Override
    public Integer count(FilterModel filter) {
        return Math.toIntExact(em.createQuery("select COUNT(t) from Table t", Long.class).getSingleResult());
    }

    @Override
    public void delete(Table table) {
        em.remove(table);
    }
}
