package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.menu.model.FoodMetaModel;
import com.restaurant.server.menu.proxy.MenuProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/rest/food")
public class FoodRestService {

    @Autowired
    private MenuProxyService proxyService;

    @GetMapping
    public PaginatedListWrapper<FoodMetaModel> loadFood(){
        FilterModel filterModel = new FilterModel();
        return proxyService.loadFood(filterModel);
    }

    @GetMapping("{id}")
    public FoodMetaModel getFood(@PathVariable Long id){
        return proxyService.getFood(id);
    }

    @GetMapping("/category/{id}")
    public List<FoodMetaModel> getFoodByCategory(@PathVariable Long id){
        return proxyService.getFoodByCategory(id);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('"+ RoleNames.ADMIN+"')")
    public FoodMetaModel addFood(@RequestBody FoodMetaModel food,
                                 @RequestParam("file") MultipartFile file){
        return proxyService.saveFood(food, file);
    }

    @PutMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public FoodMetaModel updateUser(@PathVariable Long id,
                                    @RequestBody FoodMetaModel food,
                                    @RequestParam("file")MultipartFile file){
        return proxyService.saveFood(food, file);
    }

    @DeleteMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public void updateUser(@PathVariable Long id){
        proxyService.deleteFood(id);
    }
}
