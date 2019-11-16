package com.restaurant.server.reservation.api;

import com.restaurant.common.CustomException;
import com.restaurant.common.FilterModel;
import com.restaurant.server.reservation.entity.Reservation;

import java.util.Date;
import java.util.List;

public interface ReservationService {

    List<Reservation> load(FilterModel filter);
    Reservation getById(Long id);
    Reservation add(Reservation reservation ) throws CustomException;
    Reservation update(Reservation reservation ) throws CustomException;
    Integer count(FilterModel filter);
    void delete(Reservation reservation );
    List<Reservation> getReservedTime(Long tableId, Date date);

}
