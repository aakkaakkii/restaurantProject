package com.restaurant.security.proxy;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.api.UserService;
import com.restaurant.security.entity.Role;
import com.restaurant.security.entity.User;
import com.restaurant.security.model.UserMetaModel;
import com.restaurant.security.model.UserMetaModelHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserProxyService {

    @Autowired
    private UserService userService;

    public PaginatedListWrapper<UserMetaModel> loadUsers(FilterModel filter){

        if ("".equals(filter.getFilter()))
            filter.setFilter(null);


        PaginatedListWrapper<UserMetaModel> listWrapper = new PaginatedListWrapper<>();
        listWrapper.setList(
                UserMetaModelHelper.getModels(userService.loadUsers(filter)));
        listWrapper.setTotalResults(userService.count());

        return listWrapper;
    }

    public UserMetaModel getUserById(Long id){
        return  UserMetaModelHelper.getModel(userService.getUserById(id));
    }
    @Transactional
    public UserMetaModel saveUser(UserMetaModel user){

        UserMetaModel model;
        User entity =  UserMetaModelHelper.getEntity(user);

        if(entity.getId() == null){
            Set<Role> roles = new HashSet<>();
            roles.add(Role.USER);
            roles.add(Role.ADMIN);
            entity.setRoles(roles);

            model = UserMetaModelHelper.getModel(
                    userService.addUser(entity));

        }else {
            model = UserMetaModelHelper.getModel(
                    userService.updateUser(entity));
        }

        return model;
    }
    @Transactional
    public UserMetaModel updateUser(UserMetaModel user){
        return UserMetaModelHelper.getModel(
                userService.updateUser(
                        UserMetaModelHelper.getEntity(user)));
    }
    @Transactional
    public void deleteUser(Long id){
        userService.delete(userService.getUserById(id));
    }
}
