package com.restaurant.web.view.adminPanel;

import com.restaurant.common.FilterModel;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.review.model.ReviewMetaModel;
import com.restaurant.server.review.proxy.ReviewProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;


@Controller
@RequestMapping("/admin/review")
@PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
public class AdminReviewController {
    @Autowired
    private ReviewProxyService reviewProxyService;

    @GetMapping
    public String service(@RequestParam(required = false, defaultValue = "") String filter,
                          @RequestParam(required = false, defaultValue = "0") int start,
                          @RequestParam(required = false, defaultValue = "12") int limit,
                          Model model){

        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "review");
        model.addAttribute("reviews", reviewProxyService.load(filterModel));

        return "admin/review";
    }

    @PostMapping
    public String saveCategory(@RequestParam(required = false, defaultValue = "") String filter,
                               @RequestParam(required = false, defaultValue = "0") int start,
                               @RequestParam(required = false, defaultValue = "12") int limit,
                               @RequestParam Long id,
                               @RequestParam String name,
                               @RequestParam String subject,
                               @RequestParam String message,
                               @RequestParam Map<String, String> form,
                               Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);

        ReviewMetaModel review = new ReviewMetaModel();
        review.setId(id);
        review.setName(name);
        review.setSubject(subject);
        review.setMessage(message);

        review.setVisible(false);
        for (String key : form.keySet()) {
            if ("visible".equals(key)) {
                review.setVisible(true);
            }
        }

        if (review.getId() == null){
            reviewProxyService.add(review);
        }else {
            reviewProxyService.update(review);
        }

        model.addAttribute("filter", filter);
        model.addAttribute("location", "review");
        model.addAttribute("reviews", reviewProxyService.load(filterModel));

        return "redirect:review";
    }

}
