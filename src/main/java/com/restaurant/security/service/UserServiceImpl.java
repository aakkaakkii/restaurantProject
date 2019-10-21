package com.restaurant.security.service;

import com.restaurant.security.api.UserService;
import com.restaurant.security.entity.Role;
import com.restaurant.security.entity.User;
import com.restaurant.security.repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepo userRepo;

    @Override
    public List<User> loadUsers() {
        return userRepo.findAll();
    }

    @Override
    public User getUser(String username) {
        return userRepo.findByUsername(username);
    }

    @Override
    public User addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if(userFromDb != null){
            throw new SecurityException("user exists");
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        return userRepo.save(user);
    }

    @Override
    public User updateUser(User user) {
        return userRepo.save(user);
    }

    @Override
    public List<Role> loadRoles() {
        return Arrays.asList(Role.values());
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }
}
