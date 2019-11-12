package com.restaurant.server.reservation.model;

import com.restaurant.server.reservation.entity.Reservation;

import java.util.ArrayList;
import java.util.List;

public class ReservationMetaModelHelper {
    public static ReservationMetaModel getModel(Reservation entity){
        if (entity == null)
            return null;

        ReservationMetaModel model = new ReservationMetaModel();

        model.setId(entity.getId());
        model.setIsReservedFrom(entity.getIsReservedFrom());
        model.setIsReservedTo(entity.getIsReservedTo());
        model.setName(entity.getName());
        model.setPhoneNumber(entity.getPhoneNumber());
        model.setTable(entity.getTable());

        return model;
    }

    public static List<ReservationMetaModel> getModels(List<Reservation> entities){
        List<ReservationMetaModel> models = new ArrayList<>();

        for (Reservation e: entities){
            models.add(getModel(e));
        }

        return models;
    }

    public static Reservation getEntity(ReservationMetaModel model){
        if(model == null)
            return null;

        Reservation entity = new Reservation();

        entity.setId(model.getId());
        entity.setIsReservedFrom(model.getIsReservedFrom());
        entity.setIsReservedTo(model.getIsReservedTo());
        entity.setName(model.getName());
        entity.setPhoneNumber(model.getPhoneNumber());
        entity.setTable(model.getTable());

        return entity;
    }
}
