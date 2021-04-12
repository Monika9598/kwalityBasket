package com.kwalitybasket.service;

import com.kwalitybasket.model.Address;
import com.kwalitybasket.model.User;
import com.kwalitybasket.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InvalidObjectException;
import java.util.List;

@Service
@Transactional
public class AddressService {

    @Autowired
    private AddressRepository repo;

    public void save(Address address) {
        repo.save(address);
    }

    public List<Address> listUserAddress(User user) {
        return repo.findByUser(user);
    }

    public Address fetchAddress(Long addressId) throws InvalidObjectException {
        return repo.findById(addressId).orElseThrow(() -> new InvalidObjectException("Invalid Address"));
    }

    public void delete(Long addressId) throws InvalidObjectException {
        repo.delete(repo.findById(addressId)
                .orElseThrow(() -> new InvalidObjectException("Invalid Address")));
    }
}
