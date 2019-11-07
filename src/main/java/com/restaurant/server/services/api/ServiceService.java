package com.restaurant.server.services.api;

import com.restaurant.common.FilterModel;
import com.restaurant.server.services.entity.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ServiceService {
    List<Service> load(FilterModel filter);
    Service getById(Long id);
    Service save(Service service, MultipartFile file);
    Integer count(FilterModel filter);
    void delete(Service service);
}
