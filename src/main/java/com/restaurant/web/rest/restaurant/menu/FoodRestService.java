package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.menu.model.FoodMetaModel;
import com.restaurant.server.menu.proxy.MenuProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    @PostMapping
    public FoodMetaModel addFood(@RequestBody FoodMetaModel food,
                                 @RequestParam("file") MultipartFile file){
        return proxyService.saveFood(food, file);
    }

    @PutMapping("{id}")
    public FoodMetaModel updateUser(@PathVariable Long id,
                                    @RequestBody FoodMetaModel food,
                                    @RequestParam("file")MultipartFile file){
        return proxyService.saveFood(food, file);
    }

    @DeleteMapping("{id}")
    public void updateUser(@PathVariable Long id){
        proxyService.deleteFood(id);
    }
}
