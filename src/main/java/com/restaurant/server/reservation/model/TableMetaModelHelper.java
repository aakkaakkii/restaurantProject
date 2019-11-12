package com.restaurant.server.reservation.model;

import com.restaurant.server.reservation.entity.Table;

import java.util.ArrayList;
import java.util.List;

public class TableMetaModelHelper {
    public static TableMetaModel getModel(Table entity) {
        if (entity == null)
            return null;

        TableMetaModel model = new TableMetaModel();

        model.setId(entity.getId());
        model.setTableSize(entity.getTableSize());
        model.setTableCount(entity.getTableCount());

        return model;
    }

    public static List<TableMetaModel> getModels(List<Table> entities){
        List<TableMetaModel> models = new ArrayList<>();

        for (Table e:entities){
            models.add(getModel(e));
        }

        return models;
    }

    public static Table getEntity(TableMetaModel model){
        if (model == null)
            return null;

        Table entity = new Table();

        entity.setId(model.getId());
        entity.setTableSize(model.getTableSize());
        entity.setTableCount(model.getTableCount());

        return entity;
    }
}
