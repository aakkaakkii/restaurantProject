package com.restaurant.server.menu.api;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.entity.FoodType;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FoodTypeService {
    List<FoodType> load(FilterModel filter);
    FoodType getById(Long id);
    FoodType save(FoodType foodType, MultipartFile file);
    Integer count(FilterModel filter);
    void delete(FoodType foodType);
}
