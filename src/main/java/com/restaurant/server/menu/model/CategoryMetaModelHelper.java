package com.restaurant.server.menu.model;

import com.restaurant.server.menu.entity.Category;

import java.util.ArrayList;
import java.util.List;

public class CategoryMetaModelHelper {

    public static CategoryMetaModel getModel(Category entity){
        if(entity == null)
            return null;

        CategoryMetaModel model = new CategoryMetaModel();

        model.setId(entity.getId());
        model.setFoods(FoodMetaModelHelper.getModels(entity.getFoods()));
        model.setImgName(entity.getImgName());
        model.setNameEn(entity.getNameEn());
        model.setNameFi(entity.getNameFi());

        return model;
    }

    public static CategoryMetaModel getModelWithoutCategory(Category entity){
        if(entity == null)
            return null;

        CategoryMetaModel model = new CategoryMetaModel();

        model.setId(entity.getId());
        model.setImgName(entity.getImgName());
        model.setNameEn(entity.getNameEn());
        model.setNameFi(entity.getNameFi());

        return model;
    }

    public static List<CategoryMetaModel> getModels(List<Category> entities){
        List<CategoryMetaModel> models = new ArrayList<>();

        for (Category entity : entities){
            models.add(getModel(entity));
        }
        return models;
    }

    public static Category getEntity(CategoryMetaModel model){
        if (model == null)
            return null;

        Category entity = new Category();

        entity.setId(model.getId());
        entity.setImgName(model.getImgName());
        entity.setNameEn(model.getNameEn());
        entity.setNameFi(model.getNameFi());

        return entity;
    }
}
