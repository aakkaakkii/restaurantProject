package com.restaurant.web.view.restaurant;

import com.restaurant.common.FilterModel;
import com.restaurant.server.services.proxy.ServiceProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
    @Autowired
    private ServiceProxyService proxyService;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("reservation", proxyService.load(new FilterModel()));
        return "reservation";
    }
}
