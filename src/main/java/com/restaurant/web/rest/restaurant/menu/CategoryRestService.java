package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.menu.model.CategoryMetaModel;
import com.restaurant.server.menu.proxy.MenuProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/rest/category")
public class CategoryRestService {

    @Autowired
    private MenuProxyService proxyService;

    @GetMapping
    public PaginatedListWrapper<CategoryMetaModel> loadCategories(){
        FilterModel filterModel = new FilterModel();
        return proxyService.loadCategory(filterModel);
    }

    @GetMapping("{id}")
    public CategoryMetaModel getCategory(@PathVariable Long id){
        return proxyService.getCategory(id);
    }

    @PostMapping
    public CategoryMetaModel saveCategory(@RequestBody CategoryMetaModel category,
                                          @RequestParam("file")MultipartFile file){
        //return proxyService.saveCategory(category, file);
        String str ="asd";
        CategoryMetaModel c = new CategoryMetaModel();
        c.setNameFi(str);
        return c;
    }

    @PutMapping("{id}")
    public CategoryMetaModel saveCategory(@PathVariable Long id,
                                          @RequestBody CategoryMetaModel category,
                                          @RequestParam("file")MultipartFile file){
        return proxyService.saveCategory(category, file);
    }

    @DeleteMapping("{id}")
    public void deleteCategory(@PathVariable Long id){
        proxyService.deleteCategory(id);
    }
}
