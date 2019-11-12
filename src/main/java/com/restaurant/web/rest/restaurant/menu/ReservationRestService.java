package com.restaurant.web.rest.restaurant.menu;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.reservation.model.ReservationMetaModel;
import com.restaurant.server.reservation.proxy.ReservationProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping
    public ReservationMetaModel save(@RequestBody ReservationMetaModel reservation){
        return proxyService.saveReservation(reservation);
    }

    @PutMapping("{id}")
    public ReservationMetaModel save(@PathVariable Long id,
                                     @RequestBody ReservationMetaModel reservation){
        return proxyService.saveReservation(reservation);
    }

    @DeleteMapping("{id}")
    public void delete(@PathVariable Long id){
        proxyService.deleteReservation(id);
    }
}
