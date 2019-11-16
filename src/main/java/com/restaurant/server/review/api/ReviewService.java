package com.restaurant.server.review.api;

import com.restaurant.common.FilterModel;
import com.restaurant.server.review.entity.Review;

import java.util.List;

public interface ReviewService {
    List<Review> load(FilterModel filter);
    Review getById(Long id);
    Review add(Review review);
    Review update(Review review);
    Integer count(FilterModel filter);
    void delete(Review review);
    List<Review> loadIsVisibleReviews();
}
