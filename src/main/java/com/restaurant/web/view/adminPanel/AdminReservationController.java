package com.restaurant.web.view.adminPanel;

import com.restaurant.common.CustomException;
import com.restaurant.common.FilterModel;
import com.restaurant.security.entity.RoleNames;
import com.restaurant.server.reservation.model.ReservationMetaModel;
import com.restaurant.server.reservation.proxy.ReservationProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.security.RolesAllowed;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/admin/reservation")
@PreAuthorize("hasAuthority('"+RoleNames.ADMIN+"')")
public class AdminReservationController {

    @Autowired
    private ReservationProxyService proxyService;

    @GetMapping
    public String category(@RequestParam(required = false, defaultValue = "") String filter,
                           @RequestParam(required = false, defaultValue = "0") int start,
                           @RequestParam(required = false, defaultValue = "12") int limit,
                           Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);


        model.addAttribute("filter", filter);
        model.addAttribute("location", "reservation");
        model.addAttribute("tables", proxyService.loadTables(new FilterModel()));
        model.addAttribute("reservations", proxyService.loadReservations(filterModel));

        return "admin/reservation";
    }

    @PostMapping
    public String saveCategory(@RequestParam(required = false, defaultValue = "") String filter,
                               @RequestParam(required = false, defaultValue = "0") int start,
                               @RequestParam(required = false, defaultValue = "12") int limit,
                               @RequestParam Long id,
                               @RequestParam String isReservedFrom,
                               @RequestParam String isReservedTo,
                               @RequestParam String name,
                               @RequestParam String phoneNumber,
                               @RequestParam Long tableId,
                               Model model){
        FilterModel filterModel = new FilterModel();
        filterModel.setStart(start);
        filterModel.setLimit(limit);
        filterModel.setFilter(filter);




        ReservationMetaModel reservation = new ReservationMetaModel();
        reservation.setId(id);

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        try {
            if (isReservedFrom != null && !isReservedFrom.isEmpty())
                reservation.setIsReservedFrom(df.parse(isReservedFrom));
            if (isReservedTo != null && !isReservedTo.isEmpty())
                reservation.setIsReservedTo(df.parse(isReservedTo));
        } catch (ParseException e) {
            e.printStackTrace();
        }


        reservation.setName(name);
        reservation.setPhoneNumber(phoneNumber);
        reservation.setTableId(tableId);

        try {
            proxyService.addReservation(reservation);
        } catch (CustomException e) {
            e.printStackTrace();
        }

        model.addAttribute("filter", filter);
        model.addAttribute("location", "reservation");
        model.addAttribute("tables", proxyService.loadTables(new FilterModel()));
        model.addAttribute("reservations", proxyService.loadReservations(filterModel));

        return "redirect:reservation";
    }
}
