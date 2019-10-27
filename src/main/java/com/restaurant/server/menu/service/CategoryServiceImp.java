package com.restaurant.server.menu.service;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.api.CategoryService;
import com.restaurant.server.menu.entity.Category;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Service
public class CategoryServiceImp implements CategoryService {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Category> load(FilterModel filter) {
        TypedQuery<Category> query;

        query = em.createQuery("select c from Category c order by c.id desc", Category.class);

        if (filter.getStart() > 0) {
            query.setFirstResult(filter.getStart());
        }
        if (filter.getLimit() > 0) {
            query.setMaxResults(filter.getLimit());
        }

        return query.getResultList();
    }

    @Override
    public Category getById(Long id) {
        return  em
                .createQuery("select c from Category c where c.id=:id", Category.class)
                .setParameter("id", id)
                .getSingleResult();
    }

    @Override
    public Category save(Category category) {
        if (category.getId() == null){
            em.persist(category);
        }else {
            return em.merge(category);
        }

        return category;
    }

    @Override
    public Integer count(FilterModel filter) {
        return Math.toIntExact(em.createQuery("select COUNT(c) from Category c", Long.class).getSingleResult());
    }

    @Override
    public void delete(Category category) {
        em.remove(category);
    }
}
