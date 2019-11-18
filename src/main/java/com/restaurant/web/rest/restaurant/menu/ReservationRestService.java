package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.CustomException;
import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.reservation.model.ReservationMetaModel;
import com.restaurant.server.reservation.proxy.ReservationProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/rest/reservation")
public class ReservationRestService {

    @Autowired
    private ReservationProxyService proxyService;

    @GetMapping
    public PaginatedListWrapper<ReservationMetaModel> load(){
        FilterModel filterModel = new FilterModel();
        return proxyService.loadReservations(filterModel);
    }

    @GetMapping("/tables/{id}")
    public List<ReservationMetaModel> getTablesByDate(@PathVariable Long id, @DateTimeFormat(pattern = "MM/dd/yyyy") @RequestParam Date date){
        return proxyService.getReservedTableByDate(id, date);
    }

    @PostMapping
    public ReservationMetaModel add(@RequestBody ReservationMetaModel reservation) throws CustomException {
        return proxyService.addReservation(reservation);
    }

    @PutMapping("{id}")
    @PreAuthorize("hasAuthority('"+ RoleNames.ADMIN+"')")
    public ReservationMetaModel update(@PathVariable Long id,
                                       @RequestBody ReservationMetaModel reservation) throws CustomException {
        return proxyService.updateReservation(reservation);
    }

    @DeleteMapping("{id}")
    @PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
    public void delete(@PathVariable Long id){
        proxyService.deleteReservation(id);
    }
}
