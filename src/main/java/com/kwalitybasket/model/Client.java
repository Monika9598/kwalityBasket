package com.kwalitybasket.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Setter
@Getter
@Entity
@ToString
@Table(name = "CLIENT", schema = "kwalitybasket")
public class Client extends PersistedObject {

    private String name;
    private String street1;
    private String street2;
    private String street3;
    private String city;
    private String state;
    @Column(name = "PIN_CODE", nullable = false)
    private long pinCode;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CATEGORY_ID", nullable = false)
    private ClientCategory clientCategory;
    private String status;
}
