package com.restaurant.security.api;

import com.restaurant.common.FilterModel;
import com.restaurant.security.entity.Role;
import com.restaurant.security.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    List<User> loadUsers(FilterModel filter);
    User getUserByUsername(String username);
    User getUserById(Long id);
    User addUser(User user) throws SecurityException;
    User updateUser(User user);
    Integer count();
    void delete(User user);
    List<Role> loadRoles();
}
