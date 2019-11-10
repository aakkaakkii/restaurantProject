package com.restaurant.server.menu.service;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.api.FoodTypeService;
import com.restaurant.server.menu.entity.FoodType;
import com.restaurant.server.util.ImageUpload;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Service
public class FoodTypeServiceImp implements FoodTypeService {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<FoodType> load(FilterModel filter) {
        TypedQuery<FoodType> query;

        if (filter.getFilter() != null) {
            query = em.createQuery("select c from FoodType c where c.nameEn like :searchValue order by c.id desc", FoodType.class)
                    .setParameter("searchValue", "%"+filter.getFilter()+"%");
        } else {
            query = em.createQuery("select c from FoodType c order by c.id desc", FoodType.class);
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
    public FoodType getById(Long id) {
        List<FoodType> queue =  em
                .createQuery("select c from FoodType c where c.id=:id", FoodType.class)
                .setParameter("id", id).getResultList();

        if(queue.isEmpty()){
            return null;
        }else {
            return queue.get(0);
        }
    }

    @Override
    public FoodType save(FoodType foodType, MultipartFile file) {
        if (foodType.getId() == null){
            foodType.setImgName(ImageUpload.saveImage(file));
            em.persist(foodType);
        }else {
            FoodType oldCategory = getById(foodType.getId());
            if(!ImageUpload.isFileValid(file)){
                foodType.setImgName(oldCategory.getImgName());
            }else {
                foodType.setImgName(ImageUpload.updateImage(file, oldCategory.getImgName()));
            }
            return em.merge(foodType);
        }

        return foodType;
    }

    @Override
    public Integer count(FilterModel filter) {
        return Math.toIntExact(em.createQuery("select COUNT(c) from FoodType c", Long.class).getSingleResult());
    }

    @Override
    public void delete(FoodType foodType) {
        foodType.getFoods().forEach((f)->f.setFoodType(null));
        foodType.setFoods(null);
        em.remove(foodType);
    }
}
