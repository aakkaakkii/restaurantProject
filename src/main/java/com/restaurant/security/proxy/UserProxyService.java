package com.restaurant.security.proxy;

import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.api.UserService;
import com.restaurant.security.entity.Role;
import com.restaurant.security.model.UserMetaModel;
import com.restaurant.security.model.UserMetaModelHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserProxyService {

    @Autowired
    private UserService userService;

    public PaginatedListWrapper<UserMetaModel> loadUsers(){

        PaginatedListWrapper<UserMetaModel> listWrapper = new PaginatedListWrapper<>();
        listWrapper.setList(
                UserMetaModelHelper.getModels(userService.loadUsers()));
        listWrapper.setTotalResults(userService.count());

        return listWrapper;
    }

    public UserMetaModel getUserById(Long id){
        return  UserMetaModelHelper.getModel(userService.getUserById(id));
    }

    public UserMetaModel addUser(UserMetaModel user){
        Set<Role> roles = new HashSet<>();
        roles.add(Role.USER);
        roles.add(Role.ADMIN);

        user.setRoles(roles);

        return UserMetaModelHelper.getModel(
                userService.addUser(
                        UserMetaModelHelper.getEntity(user)));
    }

    public UserMetaModel updateUser(UserMetaModel user){
        return UserMetaModelHelper.getModel(
                userService.updateUser(
                        UserMetaModelHelper.getEntity(user)));
    }

    public void deleteUser(Long id){
        userService.delete(userService.getUserById(id));
    }
}
