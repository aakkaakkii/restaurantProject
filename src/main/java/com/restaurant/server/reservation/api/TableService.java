package com.restaurant.server.reservation.api;

import com.restaurant.common.CustomException;
import com.restaurant.common.FilterModel;
import com.restaurant.server.reservation.entity.Table;

import java.util.List;

public interface TableService {
    List<Table> load(FilterModel filter);
    Table getById(Long id);
    Table save(Table table) throws CustomException;
    Integer count(FilterModel filter);
    void delete(Table table);
}
