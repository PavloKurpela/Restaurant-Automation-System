package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.OrderedDish;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class DaoOrderImpl implements DaoOrder {

    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public void addOrder(Order order) {


//        for(OrderedDish orderedDish : order.getOrderedDishes()) {
//            entityManager.merge(orderedDish);
//        }
        entityManager.merge(order);
    }
}
