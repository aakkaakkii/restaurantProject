package com.restaurant.web.view.adminPanel;

import com.restaurant.common.FilterModel;
import com.restaurant.security.entity.Role;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.security.proxy.UserProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.security.RolesAllowed;

@Controller
@RequestMapping("/admin/users")
@PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
public class UserManagerController {
    @Autowired
    private UserProxyService userProxyService;

    @GetMapping
    public  String users(@RequestParam(required = false, defaultValue = "") String filter,
                         @RequestParam(required = false, defaultValue = "0") int start,
                         @RequestParam(required = false, defaultValue = "25") int limit,
                         Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "users");
        model.addAttribute("users", userProxyService.loadUsers(filterModel));

        return "admin/users";
    }

}
