package com.restaurant.security.service;

import com.restaurant.common.FilterModel;
import com.restaurant.security.api.UserService;
import com.restaurant.security.entity.Role;
import com.restaurant.security.entity.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
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

    @Override
    public List<User> loadUsers(FilterModel filter) {
        TypedQuery<User> query;

        if (filter.getFilter() != null) {
            query = em.createQuery("select u from User u where u.username like :searchValue or u.mail like :searchValue", User.class)
                    .setParameter("searchValue", "%"+filter.getFilter()+"%");
        } else {
            query = em.createQuery("select u from User u", User.class);
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
    public User addUser(User user) {
        User userFromDb = getUserByUsername(user.getUsername());

        if (userFromDb != null) {
            throw new SecurityException("user exists");
        }

        user.setActive(true);
        em.persist(user);

        return user;
    }

    @Override
    public User updateUser(User user) {
        return em.merge(user);
    }

    @Override
    public Integer count() {
        return em.createQuery("select count(u) from User u").getFirstResult();
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
