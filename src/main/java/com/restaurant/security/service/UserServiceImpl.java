package com.restaurant.security.service;

import com.restaurant.common.CustomException;
import com.restaurant.common.FilterModel;
import com.restaurant.security.api.UserService;
import com.restaurant.security.entity.Role;
import com.restaurant.security.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.Arrays;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @PersistenceContext
    private EntityManager em;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public List<User> loadUsers(FilterModel filter) {
        TypedQuery<User> query;

        if (filter.getFilter() != null) {
            query = em.createQuery("select u from User u where u.username like :searchValue or u.mail like :searchValue order by u.id desc", User.class)
                    .setParameter("searchValue", "%"+filter.getFilter()+"%");
        } else {
            query = em.createQuery("select u from User u order by u.id desc", User.class);
        }


        if (filter.getStart() > 0) {
            query.setFirstResult(filter.getStart());
        }
        if (filter.getLimit() > 0) {
            query.setMaxResults(filter.getLimit());
        }

        return query.getResultList();
    }

    @Override
    public User getUserByUsername(String username) {
        List<User> user = em
                .createQuery("select u from User u where u.username=:username", User.class)
                .setParameter("username", username).getResultList();

        if (user.isEmpty()) {
            return null;
        } else {
            return user.get(0);
        }
    }

    @Override
    public User getUserById(Long id) {
        return em
                .createQuery("select u from User u where u.id=:id", User.class)
                .setParameter("id", id)
                .getSingleResult();
    }


    @Override
    public User addUser(User user) throws CustomException{
        User userFromDb = getUserByUsername(user.getUsername());

        if (userFromDb != null) {
            throw new CustomException(CustomException.Type.USER_EXISTS, HttpStatus.BAD_REQUEST.value());
        }

        if (user.getPassword() == null) {
            throw new CustomException(CustomException.Type.PASSWORD_IS_EMPTY, HttpStatus.BAD_REQUEST.value());
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setActive(true);
        em.persist(user);

        return user;
    }

    @Override
    public User updateUser(User user) throws CustomException {
        User oldUser = getUserById(user.getId());

        if(getUserByUsername(user.getUsername())!=null && !getUserByUsername(user.getUsername()).getId().equals(oldUser.getId())){
            throw new CustomException(CustomException.Type.USER_EXISTS, HttpStatus.BAD_REQUEST.value());
        }

        if(user.getPassword() == null || "".equals(user.getPassword())){
            user.setPassword(oldUser.getPassword());
        } else {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }

        user.setRoles(oldUser.getRoles());
        user.setActive(oldUser.isActive());

        return em.merge(user);
    }

    @Override
    public Integer count(FilterModel filter) {
        if (filter != null && filter.getFilter() != null && !"".equals(filter.getFilter())){
            return Math.toIntExact(
                    em.createQuery("select COUNT(u) from User u where u.username like :searchValue or u.mail like :searchValue", Long.class)
                    .setParameter("searchValue", "%"+filter.getFilter()+"%").getSingleResult());
        }
        return Math.toIntExact(em.createQuery("select COUNT(u) from User u", Long.class).getSingleResult());
    }

    @Override
    public void delete(User user) {
        em.remove(user);
    }

    @Override
    public List<Role> loadRoles() {
        return Arrays.asList(Role.values());
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return getUserByUsername(username);
    }
}
