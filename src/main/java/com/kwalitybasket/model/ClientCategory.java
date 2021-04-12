package com.kwalitybasket.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Setter
@Getter
@Entity
@ToString
@Table(name = "CLIENT_CATEGORY", schema = "kwalitybasket")
public class ClientCategory extends PersistedObject {

    @Column(name = "CATEGORY_NAME", nullable = false)
    private String categoryName;

    private String description;
}
