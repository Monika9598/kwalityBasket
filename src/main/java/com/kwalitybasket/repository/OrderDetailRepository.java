package com.kwalitybasket.repository;

import com.kwalitybasket.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface OrderDetailRepository extends CrudRepository<com.kwalitybasket.model.OrderDetail, Long> {

    List<com.kwalitybasket.model.OrderDetail> findByUser(User user);

    List<com.kwalitybasket.model.OrderDetail> findByUserAndStatus(User user, String status);

    Optional<com.kwalitybasket.model.OrderDetail> findByUserAndProductAndStatus(User user, com.kwalitybasket.model.Product product, String status);
}
