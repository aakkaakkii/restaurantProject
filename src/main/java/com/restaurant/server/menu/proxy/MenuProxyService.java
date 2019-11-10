package com.restaurant.server.menu.proxy;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.menu.api.CategoryService;
import com.restaurant.server.menu.api.FoodService;
import com.restaurant.server.menu.api.FoodTypeService;
import com.restaurant.server.menu.model.*;
import com.restaurant.server.util.ImageUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class MenuProxyService {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private FoodService foodService;

    @Autowired
    private FoodTypeService foodTypeService;

    public PaginatedListWrapper<FoodMetaModel> loadFood(FilterModel filter){
        if("".equals(filter.getFilter()))
            filter.setFilter(null);

        PaginatedListWrapper<FoodMetaModel> listWrapper = new PaginatedListWrapper<>();
        listWrapper.setList(
                FoodMetaModelHelper.getModels(foodService.load(filter))
        );
        listWrapper.setTotalResults(foodService.count(filter));
        listWrapper.setStart(filter.getStart());
        listWrapper.setLimit(filter.getLimit());

        return listWrapper;
    }

    public PaginatedListWrapper<CategoryMetaModel> loadCategory(FilterModel filter){
        if("".equals(filter.getFilter()))
            filter.setFilter(null);

        PaginatedListWrapper<CategoryMetaModel> listWrapper = new PaginatedListWrapper<>();
        listWrapper.setList(
                CategoryMetaModelHelper.getModels(categoryService.load(filter))
        );
        listWrapper.setTotalResults(foodService.count(filter));
        listWrapper.setStart(filter.getStart());
        listWrapper.setLimit(filter.getLimit());

        return listWrapper;
    }

    public PaginatedListWrapper<FoodTypeMetaModel> loadFoodType(FilterModel filter){
        if("".equals(filter.getFilter()))
            filter.setFilter(null);

        PaginatedListWrapper<FoodTypeMetaModel> listWrapper = new PaginatedListWrapper<>();
        listWrapper.setList(
                FoodTypeMetaModelHelper.getModels(foodTypeService.load(filter))
        );
        listWrapper.setTotalResults(foodTypeService.count(filter));
        listWrapper.setStart(filter.getStart());
        listWrapper.setLimit(filter.getLimit());

        return listWrapper;
    }

    public FoodMetaModel getFood(Long id){
        return FoodMetaModelHelper.getModel(foodService.getById(id));
    }

    public CategoryMetaModel getCategory(Long id){
        return CategoryMetaModelHelper.getModel(categoryService.getById(id));
    }

    @Transactional
    public FoodMetaModel saveFood(FoodMetaModel food, MultipartFile file){

        food.setCategory(CategoryMetaModelHelper.getModel(categoryService.getById(food.getCategoryId())));
        food.setFoodType(FoodTypeMetaModelHelper.getModel(foodTypeService.getById(food.getFoodTypeId())));

        return FoodMetaModelHelper.getModel(
                foodService.save(
                        FoodMetaModelHelper.getEntity(food), file));
    }

    @Transactional
    public CategoryMetaModel saveCategory(CategoryMetaModel category, MultipartFile file){

        return CategoryMetaModelHelper.getModel(
                categoryService.save(
                        CategoryMetaModelHelper.getEntity(category), file));
    }

    @Transactional
    public void deleteFood(Long id){
        ImageUpload.deleteImage(foodService.getById(id).getImgName());
        foodService.delete(foodService.getById(id));
    }

    @Transactional
    public void deleteCategory(Long id){
        ImageUpload.deleteImage(categoryService.getById(id).getImgName());
        categoryService.delete(categoryService.getById(id));
    }

    public List<FoodMetaModel> getFoodByCategory(Long id) {
        return FoodMetaModelHelper.getModels(foodService.getByCategory(id));
    }

    public FoodTypeMetaModel getFoodType(Long id){
        return FoodTypeMetaModelHelper.getModel(foodTypeService.getById(id));
    }


    @Transactional
    public FoodTypeMetaModel saveFoodType(FoodTypeMetaModel foodType, MultipartFile file){

        return FoodTypeMetaModelHelper.getModel(
                foodTypeService.save(
                        FoodTypeMetaModelHelper.getEntity(foodType), file));
    }

    @Transactional
    public void deleteFoodType(Long id){
        ImageUpload.deleteImage(foodTypeService.getById(id).getImgName());
        foodTypeService.delete(foodTypeService.getById(id));
    }
}
