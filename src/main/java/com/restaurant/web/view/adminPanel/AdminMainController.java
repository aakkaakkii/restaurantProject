package com.restaurant.web.view.adminPanel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin")
public class AdminMainController {

    @GetMapping
    public String main(Model model){
        model.addAttribute("location", "users");
        return "admin/main";
    }

    @PostMapping
    public String add(@RequestParam("file") MultipartFile file, Model model){
        return "admin/main";
    }

}
