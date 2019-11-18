package com.restaurant.server.services.service;

import com.restaurant.common.FilterModel;
import com.restaurant.server.services.api.ServiceService;
import com.restaurant.server.services.entity.Service;
import com.restaurant.server.util.ImageUpload;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService {
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Service> load(FilterModel filter) {
        TypedQuery<Service> query;

        if (filter.getFilter() != null) {
            query = em.createQuery("select s from Service s where s.titleEn like :searchValue or s.titleFi like :searchValue  order by s.id desc", Service.class)
                    .setParameter("searchValue", "%"+filter.getFilter()+"%");
        } else {
            query = em.createQuery("select s from Service s order by s.id desc", Service.class);
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
    public Service getById(Long id) {
        List<Service> queue =  em
                .createQuery("select s from Service s where s.id=:id", Service.class)
                .setParameter("id", id).getResultList();

        if(queue.isEmpty()){
            return null;
        }else {
            return queue.get(0);
        }
    }

    @Override
    public Service save(Service service, MultipartFile file) {
        if (service.getId() == null){
            service.setImgName(ImageUpload.saveImage(file));
            em.persist(service);
        }else {
            Service oldService = getById(service.getId());
            if(!ImageUpload.isFileValid(file)){
                service.setImgName(oldService.getImgName());
            }else {
                service.setImgName(ImageUpload.updateImage(file, oldService.getImgName()));
            }
            return em.merge(service);
        }

        return service;
    }

    @Override
    public Integer count(FilterModel filter) {
        return Math.toIntExact(em.createQuery("select COUNT(s) from Service s", Long.class).getSingleResult());
    }

    @Override
    public void delete(Service service) {
        em.remove(service);
    }
}
