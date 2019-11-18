package com.restaurant.web.view.adminPanel;

import com.restaurant.common.FilterModel;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.services.model.ServiceMetaModel;
import com.restaurant.server.services.proxy.ServiceProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/news")
@PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
public class AdminServiceController {

    @Autowired
    private ServiceProxyService serviceProxyService;

    @GetMapping
    public String service(@RequestParam(required = false, defaultValue = "") String filter,
                          @RequestParam(required = false, defaultValue = "0") int start,
                          @RequestParam(required = false, defaultValue = "25") int limit,
                          Model model){

        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "service");
        model.addAttribute("services", serviceProxyService.load(filterModel));

        return "admin/service";
    }

    @PostMapping
    public String saveCategory(@RequestParam(required = false, defaultValue = "") String filter,
                               @RequestParam(required = false, defaultValue = "0") int start,
                               @RequestParam(required = false, defaultValue = "12") int limit,
                               @RequestParam Long id,
                               @RequestParam String titleEn,
                               @RequestParam String titleFi,
                               @RequestParam String descriptionEn,
                               @RequestParam String descriptionFi,
                               @RequestParam("file") MultipartFile file,
                               Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        ServiceMetaModel service = new ServiceMetaModel();
        service.setId(id);
        service.setTitleEn(titleEn);
        service.setTitleFi(titleFi);
        service.setDescriptionEn(descriptionEn);
        service.setDescriptionFi(descriptionFi);


        serviceProxyService.save(service, file);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "service");
        model.addAttribute("services", serviceProxyService.load(filterModel));

        return "redirect:news";
    }
}
