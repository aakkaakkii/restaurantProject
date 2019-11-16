package com.restaurant.web.view.restaurant;

import com.restaurant.common.FilterModel;
import com.restaurant.server.reservation.api.ReservationService;
import com.restaurant.server.reservation.entity.Reservation;
import com.restaurant.server.reservation.proxy.ReservationProxyService;
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
    private ReservationProxyService proxyService;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("tables", proxyService.loadTables(new FilterModel()));
        return "reservation";
    }
}
