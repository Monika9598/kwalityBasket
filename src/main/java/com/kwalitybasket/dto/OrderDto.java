package com.kwalitybasket.dto;

import java.util.Set;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class OrderDto {

    private Long addressId;
    private Set<Long> orderIds;
}
