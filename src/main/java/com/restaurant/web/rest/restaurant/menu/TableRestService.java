package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.CustomException;
import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.reservation.model.TableMetaModel;
import com.restaurant.server.reservation.proxy.ReservationProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rest/table")
public class TableRestService {

    @Autowired
    private ReservationProxyService proxyService;

    @GetMapping
    public PaginatedListWrapper<TableMetaModel> load(){
        FilterModel filterModel = new FilterModel();
        return proxyService.loadTables(filterModel);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('"+ RoleNames.ADMIN+"')")
    public TableMetaModel save(@RequestBody TableMetaModel table) throws CustomException {
        return proxyService.saveTable(table);
    }

    @PutMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public TableMetaModel save(@PathVariable Long id,
                               @RequestBody TableMetaModel table) throws CustomException {
        return proxyService.saveTable(table);
    }

    @DeleteMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public void delete(@PathVariable Long id){
        proxyService.deleteTable(id);
    }
}
