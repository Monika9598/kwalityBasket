package com.kwalitybasket.repository;

import com.kwalitybasket.model.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.Optional;

public interface UserRepository extends CrudRepository<User, Long> {

    Optional<User> findByEmailOrUserName(String email, String userName);

    @Modifying(clearAutomatically = true)
    @Transactional
    @Query("Update User t SET t.password=:password WHERE t.userName=:userName")
    int forgotuserequals(@Param("userName") String userName, @Param("password") String password);

    Optional<User> findByUserName(String username);
}

