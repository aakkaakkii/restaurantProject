package com.restaurant.server.services.proxy;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.services.api.ServiceService;
import com.restaurant.server.services.model.ServiceMetaModel;
import com.restaurant.server.services.model.ServiceMetaModelHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;

@Service
public class ServiceProxyService {

    @Autowired
    private ServiceService service;

    public PaginatedListWrapper<ServiceMetaModel> load(FilterModel filter){
        if("".equals(filter.getFilter()))
            filter.setFilter(null);

        PaginatedListWrapper<ServiceMetaModel> listWrapper = new PaginatedListWrapper<>();
        listWrapper.setList(
                ServiceMetaModelHelper.getModels(service.load(filter))
        );
        listWrapper.setTotalResults(service.count(filter));
        listWrapper.setStart(filter.getStart());
        listWrapper.setLimit(filter.getLimit());

        return listWrapper;
    }

    public ServiceMetaModel getService(Long id){
        return ServiceMetaModelHelper.getModel(service.getById(id));
    }


    @Transactional
    public ServiceMetaModel save(ServiceMetaModel food, MultipartFile file){

        return ServiceMetaModelHelper.getModel(
                service.save(
                        ServiceMetaModelHelper.getEntity(food), file));
    }

    @Transactional
    public void delete(Long id){
        service.delete(service.getById(id));
    }
}
