package com.restaurant.server.review.model;

import com.restaurant.server.review.entity.Review;

import java.util.ArrayList;
import java.util.List;

public class ReviewMetaModelHelper {

    public static ReviewMetaModel getModel(Review entity){
        if(entity == null)
            return null;

        ReviewMetaModel model = new ReviewMetaModel();

        model.setId(entity.getId());
        model.setName(entity.getName());
        model.setSubject(entity.getSubject());
        model.setMessage(entity.getMessage());
        model.setDate(entity.getDate());
        model.setVisible(entity.isVisible());

        return model;
    }

    public static List<ReviewMetaModel> getModels(List<Review> entities){
        List<ReviewMetaModel> models = new ArrayList<>();

        for(Review e: entities){
            models.add(getModel(e));
        }

        return models;
    }

    public static Review getEntity(ReviewMetaModel model){
        if(model == null)
            return null;

        Review entity = new Review();

        entity.setId(model.getId());
        entity.setName(model.getName());
        entity.setSubject(model.getSubject());
        entity.setMessage(model.getMessage());
        entity.setDate(model.getDate());
        entity.setVisible(model.isVisible());

        return entity;
    }
}
