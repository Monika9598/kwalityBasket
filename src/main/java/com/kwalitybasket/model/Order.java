package com.kwalitybasket.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Setter
@Getter
@Entity
@ToString
@Table(name = "ORDERS", schema = "kwalitybasket")
public class Order extends PersistedObject {

    @Column(name = "TOTAL_AMOUNT", nullable = false)
    private double totalAmount;

    @Column(name = "SERVICE_CHARGE")
    private double serviceCharge;

    @Column(name = "GST_AMOUNT")
    private double gstAmount;

    @Column(name = "DISCOUNT_AMOUNT")
    private double discountAmount;

    @Column(name = "DISCOUNT_CODE")
    private String discountAppliedFor;

    private String status;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "ADDRESS_ID", nullable = false)
    private Address address;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "order")
    @Fetch(FetchMode.SUBSELECT)
    private List<com.kwalitybasket.model.OrderDetail> orderDetails;

    @Column(name = "PAYMENT_REFERENCE")
    private String paymentReference;

    @Column(name = "REFERENCE_NUMBER", nullable = false)
    private String orderReference;

    private String remarks;

    public void setOrderReference() {
        this.orderReference = "ORDER#" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
    }
}
