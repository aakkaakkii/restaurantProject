package com.restaurant.server.reservation.model;

public class TableMetaModel {
    private Long id;
    private Integer tableSize;
    private Integer tableCount;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getTableSize() {
        return tableSize;
    }

    public void setTableSize(Integer tableSize) {
        this.tableSize = tableSize;
    }

    public Integer getTableCount() {
        return tableCount;
    }

    public void setTableCount(Integer tableCount) {
        this.tableCount = tableCount;
    }
}
