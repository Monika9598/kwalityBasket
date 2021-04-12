package com.kwalitybasket.service;

import com.kwalitybasket.constant.Status;
import com.kwalitybasket.model.Role;
import com.kwalitybasket.model.User;
import com.kwalitybasket.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InvalidObjectException;
import java.util.List;
import java.util.Objects;
import java.util.Optional;


@Service
@Transactional
public class UserService {


    @Autowired
    private UserRepository userRepository;

    public void signUp(User user) throws Exception {
        String userName = user.getUserName();
        String email = user.getEmail();
        Optional<User> optionalUser = userRepository.findByEmailOrUserName(email, userName)
                .stream()
                .findFirst();
        if (optionalUser.isPresent()) {
            throw new Exception("UserName/Email already exists");
        }

        if (!Objects.equals(user.getConfirmPassword(), user.getPassword())) {
            throw new Exception("Password and confirm password are not matching");
        }

        Role role = new Role();
        role.setId(2l);
        user.setRole(role);
        user.setStatus(Status.ACTIVE.getCode());
        userRepository.save(user);
    }

    @Cacheable(value = "user", key = "#userName")
    public User fetchUser(String userName) throws InvalidObjectException {
        return userRepository.findByUserName(userName).orElseThrow(() -> new InvalidObjectException("Invalid UserName"));
    }

    public int forgotuserequals(String userName, String password) {
        return userRepository.forgotuserequals(userName, password);
    }

    public List<User> listAll() {
        return (List<User>) userRepository.findAll();
    }


    public User get(Long id) {
        return userRepository.findById(id).get();
    }
}
