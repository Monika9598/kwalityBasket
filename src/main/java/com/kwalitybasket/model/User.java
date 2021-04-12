package com.kwalitybasket.model;

import com.kwalitybasket.utils.PasswordUtil;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Setter
@Getter
@Entity
@ToString
@Table(name = "USER", schema = "kwalitybasket")
public class User extends PersistedObject {

    @NonNull
    @Column(name = "FULL_NAME", nullable = false)
    private String fullName;

    @NonNull
    @Column(unique = true)
    private String email;

    @NonNull
    private String mobile;

    @NonNull
    @Column(name = "USER_NAME", nullable = false, unique = true)
    private String userName;

    @NonNull
    private String password;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "ROLE_ID", nullable = false)
    private Role role;

    @NonNull
    private String status;

    @Transient
    private String confirmPassword;

    public void setPassword(String password) {
        this.password = PasswordUtil.encrypt(password);
    }

    public String getPassword() {
        return PasswordUtil.decrypt(password);
    }

}
