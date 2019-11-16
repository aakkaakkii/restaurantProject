package com.restaurant.web.view.adminPanel;

import com.restaurant.common.CustomException;
import com.restaurant.common.FilterModel;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.reservation.model.TableMetaModel;
import com.restaurant.server.reservation.proxy.ReservationProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/table")
@PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
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

        model.addAttribute("exception", null);
        model.addAttribute("filter", filter);
        model.addAttribute("location", "table");
        model.addAttribute("tables", proxyService.loadTables(filterModel));

        return "admin/table";
    }

    @PostMapping
    public String saveCategory(@RequestParam(required = false, defaultValue = "") String filter,
                               @RequestParam(required = false, defaultValue = "0") int start,
                               @RequestParam(required = false, defaultValue = "12") int limit,
                               @RequestParam Long id,
                               @RequestParam Integer tableSize,
                               @RequestParam Integer tableCount,
                               Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        TableMetaModel table = new TableMetaModel();
        table.setId(id);
        table.setTableSize(tableSize);
        table.setTableCount(tableCount);

        try {
            proxyService.saveTable(table);
        } catch (CustomException e) {
            e.printStackTrace();
        }

        model.addAttribute("filter", filter);
        model.addAttribute("location", "table");
        model.addAttribute("tables", proxyService.loadTables(filterModel));

        return "redirect:table";
    }
}
