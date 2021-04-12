package com.kwalitybasket.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Setter
@Getter
@Entity
@Table(name = "ORDER_DETAIL")
public class OrderDetail extends com.kwalitybasket.model.PersistedObject {

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "USER_ID", nullable = false)
    @Fetch(FetchMode.JOIN)
    private User user;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "PRODUCT_ID", nullable = false)
    @Fetch(FetchMode.JOIN)
    private com.kwalitybasket.model.Product product;

    private int quantity;

    private double amount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ORDER_ID")
    @JsonIgnore
    private Order order;

    private String status;

    public void setAmount(double price) {
        this.amount = quantity * price;
    }
}
