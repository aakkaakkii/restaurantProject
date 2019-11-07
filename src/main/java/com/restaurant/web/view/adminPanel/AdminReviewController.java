package com.restaurant.web.view.adminPanel;

import com.restaurant.common.FilterModel;
import com.restaurant.server.review.model.ReviewMetaModel;
import com.restaurant.server.review.proxy.ReviewProxyService;
import org.springframework.beans.factory.annotation.Autowired;
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
                               @RequestParam String date,
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
        try {
            if (date != null && !date.isEmpty())
                review.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(date));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        review.setVisible(false);
        for (String key : form.keySet()) {
            if ("visible".equals(key)) {
                review.setVisible(true);
            }
        }


        reviewProxyService.save(review);

        model.addAttribute("filter", filter);
        model.addAttribute("location", "review");
        model.addAttribute("reviews", reviewProxyService.load(filterModel));

        return "redirect:review";
    }

}
