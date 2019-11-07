package com.restaurant.server.menu.api;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.entity.Food;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FoodService {
    List<Food> load(FilterModel filter);
    Food getById(Long id);
    Food save(Food food,  MultipartFile file);
    Integer count(FilterModel filter);
    void delete(Food food);
    List<Food> getByCategory(Long id);
}
