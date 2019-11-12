package com.restaurant.server.reservation.api;

import com.restaurant.common.FilterModel;
import com.restaurant.server.reservation.entity.Reservation;

import java.util.List;

public interface ReservationService {

    List<Reservation> load(FilterModel filter);
    Reservation getById(Long id);
    Reservation save(Reservation reservation );
    Integer count(FilterModel filter);
    void delete(Reservation reservation );

}
