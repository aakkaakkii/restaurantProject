package com.restaurant.security.model;

import com.restaurant.security.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserMetaModelHelper {
    public static UserMetaModel getModel(User entity){
        UserMetaModel model = new UserMetaModel();
        model.setId(entity.getId());
        model.setActive(entity.isEnabled());
        model.setPassword(entity.getPassword());
        model.setMail(entity.getMail());
        model.setRoles(entity.getRoles());
        model.setUsername(entity.getUsername());
        return model;
    }

    public static List<UserMetaModel> getModels(List<User> entities){
        List<UserMetaModel> models = new ArrayList<>();
        for (User e:entities){
            models.add(getModel(e));
        }
        return models;
    }

    public static User getEntity(UserMetaModel model){
        User entity = new User();
        entity.setId(model.getId());
        entity.setActive(model.isActive());
        entity.setPassword(model.getPassword());
        entity.setMail(model.getMail());
        entity.setRoles(model.getRoles());
        entity.setUsername(model.getUsername());
        return entity;
    }
}
