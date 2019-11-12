package com.restaurant.web.view.adminPanel;

import com.restaurant.common.FilterModel;
import com.restaurant.server.reservation.proxy.ReservationProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/table")
public class AdminTableController {

    @Autowired
    private ReservationProxyService proxyService;

    @GetMapping
    public String category(@RequestParam(required = false, defaultValue = "") String filter,
                           @RequestParam(required = false, defaultValue = "0") int start,
                           @RequestParam(required = false, defaultValue = "12") int limit,
                           Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "table");
        model.addAttribute("tables", proxyService.loadTables(filterModel));

        return "admin/table";
    }

    @PostMapping
    public String saveCategory(@RequestParam(required = false, defaultValue = "") String filter,
                               @RequestParam(required = false, defaultValue = "0") int start,
                               @RequestParam(required = false, defaultValue = "12") int limit,
                               Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "table");
        model.addAttribute("tables", proxyService.loadTables(filterModel));

        return "redirect:table";
    }
}
