package com.kwalitybasket.constant;

import java.util.HashMap;
import java.util.Map;

public enum Status {

    ACTIVE("ACTIVE"),
    INACTIVE("INACTIVE"),
    PENDING_CHECKOUT("PENDING_CHECKOUT"),
    PENDING_PAYMENT("PENDING_PAYMENT"),
    PENDING_DELIVERY("PENDING_DELIVERY"),
    ORDER_DELIVERED("ORDER_DELIVERED");

    private String code;

    private static final Map<String, Status> lookup = new HashMap<>();

    Status(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    static {
        for (Status status : Status.values()) {
            lookup.put(status.getCode(), status);
        }
    }

    public static Status get(String code) {
        return lookup.get(code);
    }
}
