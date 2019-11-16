package com.restaurant.web.view.adminPanel;

import com.restaurant.common.FilterModel;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.menu.model.CategoryMetaModel;
import com.restaurant.server.menu.proxy.MenuProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/category")
@PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
public class AdminCategoryController {

    @Autowired
    private MenuProxyService proxyService;

    @GetMapping
    public String category(@RequestParam(required = false, defaultValue = "") String filter,
                           @RequestParam(required = false, defaultValue = "0") int start,
                           @RequestParam(required = false, defaultValue = "12") int limit,
                           Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "category");
        model.addAttribute("categories", proxyService.loadCategory(filterModel));

        return "admin/category";
    }

    @PostMapping
    public String saveCategory(@RequestParam(required = false, defaultValue = "") String filter,
                               @RequestParam(required = false, defaultValue = "0") int start,
                               @RequestParam(required = false, defaultValue = "12") int limit,
                               @RequestParam Long id,
                               @RequestParam String nameFi,
                               @RequestParam String nameEn,
                               @RequestParam("file") MultipartFile file,
                               Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        CategoryMetaModel category = new CategoryMetaModel();
        category.setId(id);
        category.setNameFi(nameFi);
        category.setNameEn(nameEn);

        proxyService.saveCategory(category, file);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "category");
        model.addAttribute("categories", proxyService.loadCategory(filterModel));

        return "redirect:category";
    }


}
