package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.review.model.ReviewMetaModel;
import com.restaurant.server.review.proxy.ReviewProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rest/review")
public class ReviewRestService {

    @Autowired
    private ReviewProxyService reviewService;

    @GetMapping
    public PaginatedListWrapper<ReviewMetaModel> load(){
        FilterModel filterModel = new FilterModel();
        return reviewService.load(filterModel);
    }

    @GetMapping("{id}")
    public ReviewMetaModel getService(@PathVariable Long id){
        return reviewService.getReview(id);
    }

    @PostMapping
    public ReviewMetaModel add(@RequestBody ReviewMetaModel review){
        return reviewService.save(review);
    }

    @PutMapping("{id}")
    public ReviewMetaModel updateReview(@PathVariable Long id,
                                       @RequestBody ReviewMetaModel review){
        return reviewService.save(review);
    }

    @DeleteMapping("{id}")
    public void deleteReview(@PathVariable Long id){
        reviewService.delete(id);
    }
}
