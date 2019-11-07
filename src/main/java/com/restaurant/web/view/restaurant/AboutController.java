package com.restaurant.web.view.restaurant;

import com.restaurant.server.review.proxy.ReviewProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/about")
public class AboutController {
    @Autowired
    private ReviewProxyService reviewProxyService;

    @GetMapping
    public String about(Model model) {

        model.addAttribute("reviews", reviewProxyService.loadIsVisibleReviews());
        return "about";
    }
}
