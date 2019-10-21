package com.restaurant.web.restaurant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/gallery")
public class GalleryController {
    @GetMapping
    public String gallery(Model model) {
        model.addAttribute("text", "balboa" );
        return "gallery";
    }
}

