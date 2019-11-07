package com.restaurant.server.review.proxy;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.review.api.ReviewService;
import com.restaurant.server.review.model.ReviewMetaModel;
import com.restaurant.server.review.model.ReviewMetaModelHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;

@Service
public class ReviewProxyService {

    @Autowired
    private ReviewService service;

    public PaginatedListWrapper<ReviewMetaModel> load(FilterModel filter){
        if("".equals(filter.getFilter()))
            filter.setFilter(null);

        PaginatedListWrapper<ReviewMetaModel> listWrapper = new PaginatedListWrapper<>();
        listWrapper.setList(
                ReviewMetaModelHelper.getModels(service.load(filter))
        );
        listWrapper.setTotalResults(service.count(filter));
        listWrapper.setStart(filter.getStart());
        listWrapper.setLimit(filter.getLimit());

        return listWrapper;
    }

    public ReviewMetaModel getReview(Long id){
        return ReviewMetaModelHelper.getModel(service.getById(id));
    }


    @Transactional
    public ReviewMetaModel save(ReviewMetaModel review){

        if (review.getDate() == null)
            review.setDate(new Date());

        return ReviewMetaModelHelper.getModel(
                service.save(
                        ReviewMetaModelHelper.getEntity(review)));
    }

    @Transactional
    public void delete(Long id){
        service.delete(service.getById(id));
    }
}
