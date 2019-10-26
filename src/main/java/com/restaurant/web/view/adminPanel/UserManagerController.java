package com.restaurant.web.view.adminPanel;

import com.restaurant.common.FilterModel;
import com.restaurant.security.proxy.UserProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/users")
public class UserManagerController {
    @Autowired
    private UserProxyService userProxyService;

    @GetMapping
    public  String users(@RequestParam(required = false, defaultValue = "") String filter, Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setFilter(filter);

        model.addAttribute("users", userProxyService.loadUsers(filterModel));

        return "admin/users";
    }

}
