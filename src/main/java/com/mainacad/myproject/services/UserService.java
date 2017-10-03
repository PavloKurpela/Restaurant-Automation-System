package com.mainacad.myproject.services;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.repository.DaoMenu;
import com.mainacad.myproject.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserService {

    User user = null;

    private HashMap<String, User> activeUsers = new HashMap<String, User>();

    private HashMap<String, Integer> countActiveUsers = new HashMap<String, Integer>();


    @Autowired
    private SecurityService securityService;


    public void addActiveUser(String loginName) {
        User activeUser = this.getUser(loginName);
        activeUsers.put(loginName, activeUser);
    }

    public void deleteActiveUser(String loginName) {
        activeUsers.remove(loginName);
    }

    public HashMap<String, User> getAllActiveUsers() {
        return activeUsers;
    }

    public User getActiveUser() {
        return activeUsers.get(securityService.findLoggedInUsername());
    }

    public void plusActiveUser(String lName) {
        if (countActiveUsers.containsKey(lName)) {
            countActiveUsers.replace(lName, countActiveUsers.get(lName) + 1);
        } else {
            countActiveUsers.put(lName, 1);
        }
    }

    public void minusActiveUser(String lName) {
        if (countActiveUsers.get(lName).equals(1)) {
            countActiveUsers.remove(lName);
        } else {
            countActiveUsers.replace(lName, countActiveUsers.get(lName) - 1);
        }
    }

    public HashMap<String, Integer> getCountActiveUsers() {
        return countActiveUsers;
    }

    public Integer getCountActiveForName(String lName) {
        return countActiveUsers.get(lName);
    }

//    public User initUser() {
////        if (user == null) {
////           user = this.getUser(201);
////        }
//
//            if (securityService.findLoggedInUsername() != null) {
//                if (securityService.findLoggedInUsername().equals("vasyl")) {
//                    user = this.getUser(201);
//                } else if (securityService.findLoggedInUsername().equals("pavlo")) {
//                    user = this.getUser(193);
//                }
//            }
//
//        return user ;
//    }
    @Autowired
    private UserDao userDao;

    @Transactional
    public User getUser(long id) {
        return userDao.getUser(id);
    }

//    public User getUser(String login) {
//        User user = new User();
//        user.setLoginName(login);
//        user.setPassword("vasyl1995");
//
//        return user;
//    }

    @Transactional
    public User getUser(String login) {
        User user = userDao.getUserByLoginName(login);
        System.out.println(user);
        return user;
    }
}
