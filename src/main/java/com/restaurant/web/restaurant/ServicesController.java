package com.restaurant.web.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/services")
public class ServicesController {
    @GetMapping
    public String services(Model model) {
        return "services";
    }
}
