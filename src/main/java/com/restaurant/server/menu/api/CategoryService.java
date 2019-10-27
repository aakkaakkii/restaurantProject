package com.restaurant.server.menu.api;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> load(FilterModel filter);
    Category getById(Long id);
    Category save(Category category);
    Integer count(FilterModel filter);
    void delete(Category category);
}
