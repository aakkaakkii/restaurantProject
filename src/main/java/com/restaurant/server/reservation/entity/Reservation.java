package com.restaurant.server.reservation.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Date isReservedFrom;
    private Date isReservedTo;
    private String name;
    private String phoneNumber;
    @ManyToOne(fetch = FetchType.EAGER)
    private Table table;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getIsReservedFrom() {
        return isReservedFrom;
    }

    public void setIsReservedFrom(Date isReservedFrom) {
        this.isReservedFrom = isReservedFrom;
    }

    public Date getIsReservedTo() {
        return isReservedTo;
    }

    public void setIsReservedTo(Date isReservedTo) {
        this.isReservedTo = isReservedTo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }
}
