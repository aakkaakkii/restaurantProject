package com.restaurant.security.api;

import com.restaurant.security.entity.Role;
import com.restaurant.security.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    List<User> loadUsers();
    User getUser(String username);
    User addUser(User user) throws SecurityException;
    User updateUser(User user);
    List<Role> loadRoles();
}
