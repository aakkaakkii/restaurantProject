package com.restaurant.server.menu.service;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.api.FoodService;
import com.restaurant.server.menu.entity.Food;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Service
public class FoodServiceImp implements FoodService {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Food> load(FilterModel filter) {
        TypedQuery<Food> query;

       /* if (filter.getFilter() != null) {
            query = em.createQuery("select f from Food f where f.username like :searchValue or f.mail like :searchValue order by f.id desc", Food.class)
                    .setParameter("searchValue", "%"+filter.getFilter()+"%");
        } else {
        }*/

        query = em.createQuery("select f from Food f order by f.id desc", Food.class);


        if (filter.getStart() > 0) {
            query.setFirstResult(filter.getStart());
        }
        if (filter.getLimit() > 0) {
            query.setMaxResults(filter.getLimit());
        }

        return query.getResultList();
    }

    @Override
    public Food getById(Long id) {
        return  em
                .createQuery("select f from Food f where f.id=:id", Food.class)
                .setParameter("id", id)
                .getSingleResult();
    }

    @Override
    public Food save(Food food) {

        if (food.getId() == null){
            em.persist(food);
        }else {
            return em.merge(food);
        }

        return food;
    }

    @Override
    public Integer count(FilterModel filter) {
        return Math.toIntExact(em.createQuery("select COUNT(f) from Food f", Long.class).getSingleResult());
    }

    @Override
    public void delete(Food food) {
        em.remove(food);
    }
}
