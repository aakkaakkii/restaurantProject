package com.restaurant.web.rest.admin;

import com.restaurant.common.FilterModel;
import com.restaurant.common.PaginatedListWrapper;
import com.restaurant.security.model.UserMetaModel;
import com.restaurant.security.proxy.UserProxyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("rest/users")
public class UserRest {

    @Autowired
    private UserProxyService userProxy;

    @GetMapping
    public PaginatedListWrapper<UserMetaModel> loadUsers(){
        FilterModel filterModel = new FilterModel();
        return userProxy.loadUsers(filterModel);
    }

    @GetMapping("{id}")
    public UserMetaModel getUser(@PathVariable Long id){
        return userProxy.getUserById(id);
    }

    @PostMapping
    public UserMetaModel addUser(@RequestBody UserMetaModel user){
        return userProxy.saveUser(user);
    }

    @PutMapping("{id}")
    public UserMetaModel updateUser(@PathVariable Long id, @RequestBody UserMetaModel user){
        return userProxy.updateUser(user);
    }

    @DeleteMapping("{id}")
    public void deleteUser(@PathVariable Long id){
        userProxy.deleteUser(id);
    }
}
