package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.menu.model.FoodTypeMetaModel;
import com.restaurant.server.menu.proxy.MenuProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/rest/foodType")
public class FoodTypeRestService {

    @Autowired
    private MenuProxyService proxyService;

    @GetMapping
    public PaginatedListWrapper<FoodTypeMetaModel> loadCategories(){
        FilterModel filterModel = new FilterModel();
        return proxyService.loadFoodType(filterModel);
    }

    @GetMapping("{id}")
    public FoodTypeMetaModel getCategory(@PathVariable Long id){
        return proxyService.getFoodType(id);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('"+ RoleNames.ADMIN+"')")
    public FoodTypeMetaModel saveCategory(@RequestBody FoodTypeMetaModel foodType,
                                          @RequestParam("file") MultipartFile file){
        return proxyService.saveFoodType(foodType, file);
    }

    @PutMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public FoodTypeMetaModel saveCategory(@PathVariable Long id,
                                          @RequestBody FoodTypeMetaModel foodType,
                                          @RequestParam("file")MultipartFile file){
        return proxyService.saveFoodType(foodType, file);
    }

    @DeleteMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public void deleteCategory(@PathVariable Long id){
        proxyService.deleteFoodType(id);
    }
}
