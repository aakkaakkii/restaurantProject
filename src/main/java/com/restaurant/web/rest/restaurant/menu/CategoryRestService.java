package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.menu.model.CategoryMetaModel;
import com.restaurant.server.menu.proxy.MenuProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public CategoryMetaModel saveCategory(@RequestBody CategoryMetaModel category,
                                          @RequestParam("file")MultipartFile file){
        return proxyService.saveCategory(category, file);
    }

    @PutMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public CategoryMetaModel saveCategory(@PathVariable Long id,
                                          @RequestBody CategoryMetaModel category,
                                          @RequestParam("file")MultipartFile file){
        return proxyService.saveCategory(category, file);
    }

    @DeleteMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public void deleteCategory(@PathVariable Long id){
        proxyService.deleteCategory(id);
    }
}
