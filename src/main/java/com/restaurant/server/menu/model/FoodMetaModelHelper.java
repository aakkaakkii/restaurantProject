package com.restaurant.server.menu.model;


import com.restaurant.server.menu.entity.Food;

import java.util.ArrayList;
import java.util.List;

public class FoodMetaModelHelper {

    public static FoodMetaModel getModel(Food entity){
        if (entity == null)
            return null;

        FoodMetaModel model = new FoodMetaModel();

        model.setId(entity.getId());
        model.setImgName(entity.getImgName());
        model.setNameEn(entity.getNameEn());
        model.setNameFi(entity.getNameFi());
        model.setDescriptionEn(entity.getDescriptionEn());
        model.setDescriptionFi(entity.getDescriptionFi());
        model.setPrice(entity.getPrice());
        model.setCategoryId(entity.getCategory()!=null?entity.getCategory().getId():null);
        model.setCategory(CategoryMetaModelHelper.getModelWithoutCategory(entity.getCategory()));
        model.setFoodTypeId(entity.getFoodType()!=null?entity.getFoodType().getId():null);
        model.setFoodType(FoodTypeMetaModelHelper.getModelWithoutCategory(entity.getFoodType()));

        return model;
    }

    public static List<FoodMetaModel> getModels(List<Food> entities){
        List<FoodMetaModel> models = new ArrayList<>();

        if (entities != null){
            for (Food entity : entities){
                models.add(getModel(entity));
            }
        }

        return models;
    }

    public static Food getEntity(FoodMetaModel model){
        if (model == null)
            return null;

        Food entity = new Food();

        entity.setId(model.getId());
        entity.setImgName(model.getImgName());
        entity.setNameEn(model.getNameEn());
        entity.setNameFi(model.getNameFi());
        entity.setDescriptionEn(model.getDescriptionEn());
        entity.setDescriptionFi(model.getDescriptionFi());
        entity.setPrice(model.getPrice());
        entity.setCategory(CategoryMetaModelHelper.getEntity(model.getCategory()));
        entity.setFoodType(FoodTypeMetaModelHelper.getEntity(model.getFoodType()));

        return entity;
    }
}
