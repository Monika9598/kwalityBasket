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
@Table(name = "ROLE", schema = "kwalitybasket")
public class Role extends PersistedObject {

    @Column(name = "ROLE_NAME")
    private String roleName;
}
