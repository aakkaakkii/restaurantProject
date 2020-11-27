package com.restaurant.server.menu.service;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.api.CategoryService;
import com.restaurant.server.menu.entity.Category;
import com.restaurant.server.util.ImageUpload;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

        if (filter.getFilter() != null) {
            query = em.createQuery("select c from Category c where c.nameEn like :searchValue or c.nameFi like :searchValue  order by c.id asc", Category.class)
                    .setParameter("searchValue", "%"+filter.getFilter()+"%");
        } else {
            query = em.createQuery("select c from Category c order by c.id asc", Category.class);
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
    public Category getById(Long id) {
        List<Category> queue =  em
                                        .createQuery("select c from Category c where c.id=:id", Category.class)
                                        .setParameter("id", id).getResultList();

        if(queue.isEmpty()){
            return null;
        }else {
            return queue.get(0);
        }
    }

    @Override
    public Category save(Category category, MultipartFile file) {
        if (category.getId() == null){
            category.setImgName(ImageUpload.saveImage(file));
            em.persist(category);
        }else {
            Category oldCategory = getById(category.getId());
            if(!ImageUpload.isFileValid(file)){
                category.setImgName(oldCategory.getImgName());
            }else {
                category.setImgName(ImageUpload.updateImage(file, oldCategory.getImgName()));
            }
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
