package com.restaurant.server.reservation.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class Table {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Integer tableSize;
    private Integer tableCount;
    @OneToMany(mappedBy = "table", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Reservation> reservation;

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

    public List<Reservation> getReservation() {
        return reservation;
    }

    public void setReservation(List<Reservation> reservation) {
        this.reservation = reservation;
    }
}
