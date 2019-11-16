package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.review.model.ReviewMetaModel;
import com.restaurant.server.review.proxy.ReviewProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rest/review")
public class ReviewRestService {

    @Autowired
    private ReviewProxyService reviewService;

    @GetMapping
    @PreAuthorize("hasAuthority('"+ RoleNames.ADMIN+"')")
    public PaginatedListWrapper<ReviewMetaModel> load(){
        FilterModel filterModel = new FilterModel();
        return reviewService.load(filterModel);
    }

    @GetMapping("{id}")
    @PreAuthorize("hasAuthority('"+ RoleNames.ADMIN+"')")
    public ReviewMetaModel getService(@PathVariable Long id){
        return reviewService.getReview(id);
    }

    @PostMapping
    public ReviewMetaModel add(@RequestBody ReviewMetaModel review){
        return reviewService.add(review);
    }

    @PutMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public ReviewMetaModel updateReview(@PathVariable Long id,
                                       @RequestBody ReviewMetaModel review){
        return reviewService.update(review);
    }

    @DeleteMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public void deleteReview(@PathVariable Long id){
        reviewService.delete(id);
    }
}
