package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.entities.Waiter;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class DaoWaiterImpl implements DaoWaiter {

    @PersistenceContext
    private EntityManager entityManager;

//    @Override
//    public List<Dish> listName(String typeDish) {
//
//        String stringQuery = "SELECT c FROM Dish c WHERE c.type = :typeDish";
//
//        Query query = entityManager.createQuery(stringQuery, Dish.class);
//        query.setParameter("typeDish", typeDish);
//        return (List<Dish>)query.getResultList();
//    }

    @Override
    public List<Waiter> getAllWaiter() {

        String stringQuery = "SELECT w FROM Waiter w";

        Query query = entityManager.createQuery(stringQuery, Waiter.class);
        return (List<Waiter>)query.getResultList();
    }

    @Override
    public List<Waiter> getAllActiveWaiter() {

        String stringQuery = "SELECT w FROM Waiter w WHERE w.active = :active";
        Query query = entityManager.createQuery(stringQuery, Waiter.class);
        query.setParameter("active", true);
        return (List<Waiter>)query.getResultList();
    }

    @Override
    public Waiter getWaiter (long id) {
        Waiter waiter =  entityManager.find(Waiter.class, id);
        return waiter;
    }

    @Override
    public void addWaiter(Waiter waiter) {
        entityManager.persist(waiter);
    }
    @Override
    public void removeWaiter(Waiter waiter) {
        entityManager.remove(waiter);
    }
    @Override
    public void changeDish(Dish dish) {
        entityManager.merge(dish);
    }

    @Override
    public void updateWaiter(Waiter waiter) {
        entityManager.merge(waiter);
    }

    @Override
    public Waiter getWaiterByLoginName(String login) {
        String stringQuery = "SELECT w FROM Waiter w WHERE w.loginName = :loginName";

        Query query = entityManager.createQuery(stringQuery, Waiter.class);
        query.setParameter("loginName", login);

        List<Waiter> waiters = (List<Waiter>)query.getResultList();

        if (waiters.size() > 0) {
            return waiters.get(0);
        } else {
            return null;
        }
    }
}
