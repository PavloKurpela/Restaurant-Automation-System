package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.User;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public User getUser(long id) {
        return entityManager.find(User.class, id);
    }

    @Override
    public User getUserByLoginName(String login) {
        String stringQuery = "SELECT u FROM User u WHERE u.loginName = :loginName";

        Query query = entityManager.createQuery(stringQuery, User.class);
        query.setParameter("loginName", login);

        List<User> users = (List<User>)query.getResultList();

        if (users.size() > 0) {
            return users.get(0);
        } else {
            return null;
        }
    }
}
