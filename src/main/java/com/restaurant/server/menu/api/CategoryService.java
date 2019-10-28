package com.restaurant.server.menu.api;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.entity.Category;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CategoryService {
    List<Category> load(FilterModel filter);
    Category getById(Long id);
    Category save(Category category, MultipartFile file);
    Integer count(FilterModel filter);
    void delete(Category category);
}
