package com.kwalitybasket.service;

import com.kwalitybasket.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class DBAuthenticationService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<com.kwalitybasket.model.User> userOptional = userRepository.findByUserName(username);

        if (!userOptional.isPresent()) {
            throw new UsernameNotFoundException("User " + username + " was not found");
        }
        com.kwalitybasket.model.User user = userOptional.get();
        String role = user.getRole().getRoleName();
        List<GrantedAuthority> grantList = new ArrayList<>();
        GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role);
        grantList.add(authority);
        UserDetails userDetails = new User(user.getUserName(), user.getPassword(), grantList);
        return userDetails;
    }
}