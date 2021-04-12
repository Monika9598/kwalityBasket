package com.kwalitybasket.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.kwalitybasket.model.Address;
import com.kwalitybasket.model.User;

public interface AddressRepository extends CrudRepository<Address, Long> {

    List<Address> findByUser(User user);
}
