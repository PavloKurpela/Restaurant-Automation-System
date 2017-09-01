package com.mainacad.myproject.services;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.repository.DaoMenu;
import com.mainacad.myproject.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    User user = null;

    public User initUser() {
        if (user == null) {
           user = this.getUser(201);
        }
        return user ;
    }
    @Autowired
    private UserDao userDao;

    @Transactional
    public User getUser(long id) {
        return userDao.getUser(id);
    }
}
