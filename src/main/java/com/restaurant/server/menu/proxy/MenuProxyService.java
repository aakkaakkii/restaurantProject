package com.restaurant.server.menu.proxy;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.menu.api.CategoryService;
import com.restaurant.server.menu.api.FoodService;
import com.restaurant.server.menu.model.CategoryMetaModel;
import com.restaurant.server.menu.model.CategoryMetaModelHelper;
import com.restaurant.server.menu.model.FoodMetaModel;
import com.restaurant.server.menu.model.FoodMetaModelHelper;
import com.restaurant.server.util.ImageUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;

@Service
public class MenuProxyService {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private FoodService foodService;

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

    public FoodMetaModel getFood(Long id){
        return FoodMetaModelHelper.getModel(foodService.getById(id));
    }

    public CategoryMetaModel getCategory(Long id){
        return CategoryMetaModelHelper.getModel(categoryService.getById(id));
    }

    @Transactional
    public FoodMetaModel saveFood(FoodMetaModel food, MultipartFile file){
        food.setImgName(ImageUpload.saveImage(file));

        food.setCategory(CategoryMetaModelHelper.getModel(categoryService.getById(food.getCategoryId())));

        return FoodMetaModelHelper.getModel(
                foodService.save(
                        FoodMetaModelHelper.getEntity(food)));
    }

    @Transactional
    public CategoryMetaModel saveCategory(CategoryMetaModel category, MultipartFile file){

        return CategoryMetaModelHelper.getModel(
                categoryService.save(
                        CategoryMetaModelHelper.getEntity(category), file));
    }

    @Transactional
    public void deleteFood(Long id){
        foodService.delete(foodService.getById(id));
    }

    @Transactional
    public void deleteCategory(Long id){

        ImageUpload.deleteImage(categoryService.getById(id).getImgName());

        categoryService.delete(categoryService.getById(id));
    }

}
