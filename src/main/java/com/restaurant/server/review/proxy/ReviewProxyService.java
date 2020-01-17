package com.restaurant.server.review.proxy;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.review.api.ReviewService;
import com.restaurant.server.review.model.ReviewMetaModel;
import com.restaurant.server.review.model.ReviewMetaModelHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

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

    public List<ReviewMetaModel> loadIsVisibleReviews(){
        return ReviewMetaModelHelper.getModels(service.loadIsVisibleReviews());
    }

    public ReviewMetaModel getReview(Long id){
        return ReviewMetaModelHelper.getModel(service.getById(id));
    }


    @Transactional
    public ReviewMetaModel add(ReviewMetaModel review){

        return ReviewMetaModelHelper.getModel(
                service.add(
                        ReviewMetaModelHelper.getEntity(review)));
    }

    @Transactional
    public ReviewMetaModel update(ReviewMetaModel review){

        return ReviewMetaModelHelper.getModel(
                service.update(
                        ReviewMetaModelHelper.getEntity(review)));
    }

    @Transactional
    public void delete(Long id){
        service.delete(service.getById(id));
    }
}
