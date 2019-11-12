package com.restaurant.server.reservation.proxy;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.server.reservation.api.ReservationService;
import com.restaurant.server.reservation.api.TableService;
import com.restaurant.server.reservation.model.ReservationMetaModel;
import com.restaurant.server.reservation.model.ReservationMetaModelHelper;
import com.restaurant.server.reservation.model.TableMetaModel;
import com.restaurant.server.reservation.model.TableMetaModelHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class ReservationProxyService {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private TableService tableService;

    public PaginatedListWrapper<ReservationMetaModel> loadReservations(FilterModel filter){
        if("".equals(filter.getFilter()))
            filter.setFilter(null);

        PaginatedListWrapper<ReservationMetaModel> listWrapper = new PaginatedListWrapper<>();
        listWrapper.setList(
                ReservationMetaModelHelper.getModels(reservationService.load(filter))
        );
        listWrapper.setTotalResults(reservationService.count(filter));
        listWrapper.setStart(filter.getStart());
        listWrapper.setLimit(filter.getLimit());

        return listWrapper;
    }

    public PaginatedListWrapper<TableMetaModel> loadTables(FilterModel filter){
        if("".equals(filter.getFilter()))
            filter.setFilter(null);

        PaginatedListWrapper<TableMetaModel> listWrapper = new PaginatedListWrapper<>();
        listWrapper.setList(
                TableMetaModelHelper.getModels(tableService.load(filter))
        );
        listWrapper.setTotalResults(tableService.count(filter));
        listWrapper.setStart(filter.getStart());
        listWrapper.setLimit(filter.getLimit());

        return listWrapper;
    }

    @Transactional
    public ReservationMetaModel saveReservation(ReservationMetaModel reservation){
        return ReservationMetaModelHelper.getModel(
                reservationService.save(
                        ReservationMetaModelHelper.getEntity(reservation)
                )
        );
    }

    @Transactional
    public TableMetaModel saveTable(TableMetaModel table){
        return TableMetaModelHelper.getModel(
                tableService.save(
                        TableMetaModelHelper.getEntity(table)
                )
        );
    }

    @Transactional
    public void deleteReservation(Long id){
        reservationService.delete(reservationService.getById(id));
    }

    @Transactional
    public void deleteTable(Long id){
        tableService.delete(tableService.getById(id));
    }

}
