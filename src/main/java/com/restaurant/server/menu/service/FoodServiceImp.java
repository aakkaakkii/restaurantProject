package com.restaurant.server.menu.service;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.api.FoodService;
import com.restaurant.server.menu.entity.Food;
import com.restaurant.server.util.ImageUpload;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

        if (filter.getFilter() != null) {
            query = em.createQuery("select f from Food f where f.nameEn like :searchValue or f.category.nameEn like :searchValue order by f.id desc", Food.class)
                    .setParameter("searchValue", "%"+filter.getFilter()+"%");
        } else {
            query = em.createQuery("select f from Food f order by f.id desc", Food.class);
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
    public Food getById(Long id) {
        return  em
                .createQuery("select f from Food f where f.id=:id", Food.class)
                .setParameter("id", id)
                .getSingleResult();
    }

    @Override
    public Food save(Food food,  MultipartFile file) {

        if (food.getId() == null){
            food.setImgName(ImageUpload.saveImage(file));
            em.persist(food);
        }else {
            Food oldCategory = getById(food.getId());
            if(!ImageUpload.isFileValid(file)){
                food.setImgName(oldCategory.getImgName());
            }else {
                food.setImgName(ImageUpload.updateImage(file, oldCategory.getImgName()));
            }
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

    @Override
    public List<Food> getByCategory(Long id){
        return em.createQuery("select f from Food f where f.category.id=:id order by f.id desc", Food.class)
                .setParameter("id", id).getResultList();
    }
}
