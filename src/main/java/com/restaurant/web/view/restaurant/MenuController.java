package com.restaurant.web.view.restaurant;

import com.restaurant.common.FilterModel;
import com.restaurant.server.menu.proxy.MenuProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuProxyService menuProxyService;

    @GetMapping
    public String menu(Model model) {

        model.addAttribute("categories", menuProxyService.loadCategory(new FilterModel()));
        return "menu";
    }
}
