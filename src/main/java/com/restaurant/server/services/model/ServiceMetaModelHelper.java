package com.restaurant.server.services.model;

import com.restaurant.server.services.entity.Service;

import java.util.ArrayList;
import java.util.List;

public class ServiceMetaModelHelper {

    public static ServiceMetaModel getModel(Service entity){
        if(entity == null)
            return null;

        ServiceMetaModel model = new ServiceMetaModel();

        model.setId(entity.getId());
        model.setTitleEn(entity.getTitleEn());
        model.setTitleFi(entity.getTitleFi());
        model.setDescriptionEn(entity.getDescriptionEn());
        model.setDescriptionFi(entity.getDescriptionFi());
        model.setImgName(entity.getImgName());

        return model;
    }

    public static List<ServiceMetaModel> getModels(List<Service> entities){
        List<ServiceMetaModel> models = new ArrayList<>();

        for(Service e: entities){
            models.add(getModel(e));
        }

        return models;
    }

    public static Service getEntity(ServiceMetaModel model){
        if(model == null)
            return null;

        Service entity = new Service();

        entity.setId(model.getId());
        entity.setTitleEn(model.getTitleEn());
        entity.setTitleFi(model.getTitleFi());
        entity.setDescriptionEn(model.getDescriptionEn());
        entity.setDescriptionFi(model.getDescriptionFi());
        entity.setImgName(model.getImgName());

        return entity;
    }
}
