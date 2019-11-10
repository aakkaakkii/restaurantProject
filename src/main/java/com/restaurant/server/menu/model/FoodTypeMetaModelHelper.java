package com.restaurant.server.menu.model;

import com.restaurant.server.menu.entity.FoodType;

import java.util.ArrayList;
import java.util.List;

public class FoodTypeMetaModelHelper {
    public static FoodTypeMetaModel getModel(FoodType entity){
        if(entity == null)
            return null;

        FoodTypeMetaModel model = new FoodTypeMetaModel();

        model.setId(entity.getId());
        model.setFoods(FoodMetaModelHelper.getModels(entity.getFoods()));
        model.setImgName(entity.getImgName());
        model.setNameEn(entity.getNameEn());
        model.setNameFi(entity.getNameFi());

        return model;
    }

    public static FoodTypeMetaModel getModelWithoutCategory(FoodType entity){
        if(entity == null)
            return null;

        FoodTypeMetaModel model = new FoodTypeMetaModel();

        model.setId(entity.getId());
        model.setImgName(entity.getImgName());
        model.setNameEn(entity.getNameEn());
        model.setNameFi(entity.getNameFi());

        return model;
    }

    public static List<FoodTypeMetaModel> getModels(List<FoodType> entities){
        List<FoodTypeMetaModel> models = new ArrayList<>();

        for (FoodType entity : entities){
            models.add(getModel(entity));
        }
        return models;
    }

    public static FoodType getEntity(FoodTypeMetaModel model){
        if (model == null)
            return null;

        FoodType entity = new FoodType();

        entity.setId(model.getId());
        entity.setImgName(model.getImgName());
        entity.setNameEn(model.getNameEn());
        entity.setNameFi(model.getNameFi());

        return entity;
    }
}
