package com.kwalitybasket.constant;

import java.util.HashMap;
import java.util.Map;

public enum Size {
    SMALL("SMALL"),
    MEDIUM("MEDIUM"),
    LARGE("LARGE"),
    EXTRA_LARGE("EXTRA_LARGE");

    private String code;

    Size(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    private static final Map<String, Size> lookup = new HashMap<>();

    static {
        for (Size status : Size.values()) {
            lookup.put(status.getCode(), status);
        }
    }

    public static Size get(String code) {
        return lookup.get(code);
    }
}
