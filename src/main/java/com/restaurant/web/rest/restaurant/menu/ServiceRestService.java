package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.services.model.ServiceMetaModel;
import com.restaurant.server.services.proxy.ServiceProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/rest/service")
public class ServiceRestService {

    @Autowired
    private ServiceProxyService serviceProxyService;

    @GetMapping
    public PaginatedListWrapper<ServiceMetaModel> load(){
        FilterModel filterModel = new FilterModel();
        return serviceProxyService.load(filterModel);
    }

    @GetMapping("{id}")
    public ServiceMetaModel getService(@PathVariable Long id){
        return serviceProxyService.getService(id);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('"+ RoleNames.ADMIN+"')")
    public ServiceMetaModel add(@RequestBody ServiceMetaModel service,
                                @RequestParam("file") MultipartFile file){
        return serviceProxyService.save(service, file);
    }

    @PutMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public ServiceMetaModel updateService(@PathVariable Long id,
                                    @RequestBody ServiceMetaModel service,
                                    @RequestParam("file")MultipartFile file){
        return serviceProxyService.save(service, file);
    }

    @DeleteMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public void deleteService(@PathVariable Long id){
        serviceProxyService.delete(id);
    }
}
