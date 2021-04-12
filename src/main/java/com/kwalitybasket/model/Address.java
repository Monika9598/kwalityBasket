package com.kwalitybasket.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@Entity
@ToString
@Table(name = "ADDRESS", schema = "kwalitybasket")
public class Address extends PersistedObject {

    private String name;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "USER_ID", nullable = false)
    @JsonIgnore
    private User user;

    @Column(name = "PHONE_NUMBER", nullable = false)
    private String phoneNo;

    private String email;

    private String address;

    @Column(name = "LAND_MARK", nullable = false)
    private String landMark;

    private String city;

    private String state;

    @Column(name = "PIN_CODE", nullable = false)
    private long pinCode;

    private String status;
}
