package com.restaurant.server.reservation.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class ReservationMetaModel {
    private Long id;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss.sss")
    private Date isReservedFrom;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss.sss")
    private Date isReservedTo;
    private String name;
    private String phoneNumber;
    private TableMetaModel table;
    private Long tableId;

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

    public TableMetaModel getTable() {
        return table;
    }

    public void setTable(TableMetaModel table) {
        this.table = table;
    }

    public Long getTableId() {
        return tableId;
    }

    public void setTableId(Long tableId) {
        this.tableId = tableId;
    }
}
