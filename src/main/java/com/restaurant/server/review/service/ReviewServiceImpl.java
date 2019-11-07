package com.restaurant.server.review.service;

import com.restaurant.common.FilterModel;
import com.restaurant.server.review.api.ReviewService;
import com.restaurant.server.review.entity.Review;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Review> load(FilterModel filter) {
        TypedQuery<Review> query;

        if (filter.getFilter() != null) {
            query = em.createQuery("select s from Review s where s.name like :searchValue or s.subject like :searchValue order by s.id desc", Review.class)
                    .setParameter("searchValue", "%"+filter.getFilter()+"%");
        } else {
            query = em.createQuery("select s from Review s order by s.id desc", Review.class);
        }

        if (filter.getStart() > 0) {
            query.setFirstResult(filter.getStart());
        }
        if (filter.getLimit() > 0) {
            query.setMaxResults(filter.getLimit());
        }

        return query.getResultList();
    }

    @Override
    public Review getById(Long id) {
        List<Review> queue =  em
                .createQuery("select s from Review s where s.id=:id", Review.class)
                .setParameter("id", id).getResultList();

        if(queue.isEmpty()){
            return null;
        }else {
            return queue.get(0);
        }
    }

    @Override
    public Review save(Review review) {
        if (review.getId() == null){
            em.persist(review);
        }else {
            return em.merge(review);
        }

        return review;
    }

    @Override
    public Integer count(FilterModel filter) {
        return Math.toIntExact(em.createQuery("select COUNT(s) from Review s", Long.class).getSingleResult());
    }

    @Override
    public void delete(Review review) {
        em.remove(review);
    }

    @Override
    public List<Review> loadIsVisibleReviews() {
        return em.createQuery("select r from Review r where r.isVisible=true order by r.id desc", Review.class)
                .getResultList();
    }
}
