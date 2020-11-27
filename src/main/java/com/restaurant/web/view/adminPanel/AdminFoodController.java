package com.restaurant.web.view.adminPanel;

import com.restaurant.common.FilterModel;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.menu.model.FoodMetaModel;
import com.restaurant.server.menu.proxy.MenuProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/food")
@PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
public class AdminFoodController {

    @Autowired
    private MenuProxyService proxyService;

    @GetMapping
    public String category(@RequestParam(required = false, defaultValue = "") String filter,
                           @RequestParam(required = false, defaultValue = "0") int start,
                           @RequestParam(required = false, defaultValue = "25") int limit,
                           Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "food");
        model.addAttribute("categories",  proxyService.loadCategory(new FilterModel()));
        model.addAttribute("foodTypes",  proxyService.loadFoodType(new FilterModel()));
        model.addAttribute("foods", proxyService.loadFood(filterModel));

        return "admin/food";
    }

    @PostMapping
    public String saveCategory(@RequestParam(required = false, defaultValue = "") String filter,
                               @RequestParam(required = false, defaultValue = "0") int start,
                               @RequestParam(required = false, defaultValue = "12") int limit,
                               @RequestParam Long id,
                               @RequestParam String nameFi,
                               @RequestParam String nameEn,
                               @RequestParam String descriptionEn,
                               @RequestParam String descriptionFi,
                               @RequestParam Long categoryId,
                               @RequestParam(required = false, defaultValue = "-1") Long foodTypeId,
                               @RequestParam(required = false, defaultValue = "0") String price,
                               @RequestParam("file") MultipartFile file,
                               Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        FoodMetaModel food = new FoodMetaModel();
        food.setId(id);
        food.setNameFi(nameFi);
        food.setNameEn(nameEn);
        food.setDescriptionEn(descriptionEn);
        food.setDescriptionFi(descriptionFi);
        food.setPrice(price);
        food.setCategoryId(categoryId);
        food.setFoodTypeId(foodTypeId < 0? null:foodTypeId);

        proxyService.saveFood(food, file);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "food");
        model.addAttribute("categories",  proxyService.loadCategory(new FilterModel()));
        model.addAttribute("foods", proxyService.loadFood(filterModel));

        return "redirect:food";
    }
}
