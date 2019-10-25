package com.restaurant.web.view.adminPanel;

import com.restaurant.security.api.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/users")
public class UserManagerController {
    @Autowired
    private UserService userService;

    @GetMapping
    public  String users(Model model){
        model.addAttribute("users", userService.loadUsers());

        return "admin/users";
    }

}
