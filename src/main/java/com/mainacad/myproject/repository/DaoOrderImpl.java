package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.OrderedDish;
import com.mainacad.myproject.entities.User;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class DaoOrderImpl implements DaoOrder {

    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public void addOrder(Order order) {


        if ((entityManager.find(User.class, order.getCustomer().getId()) == null)) {
            entityManager.persist(order.getCustomer());
        }
        entityManager.merge(order);
    }

    @Override
    public List<Order> listOrder(User customer) {

        String stringQuery = "SELECT o FROM Order o WHERE o.customer = :customer";

        Query query = entityManager.createQuery(stringQuery, Order.class);
        query.setParameter("customer", customer);
        return (List<Order>)query.getResultList();
    }

    @Override
    public Order getOrder (long id) {
        Order order =  entityManager.find(Order.class, id);
        return order;
    }

    @Override
    public void deleteOrder (long toDelete)
    {
        Order order = entityManager.find(Order.class, toDelete);

        System.out.println(order);

        if (order != null) {
            entityManager.remove(order);
        }
    }

    @Override
    public List<Order> allExpectedOrders() {

        String stringQuery = "SELECT o FROM Order o WHERE o.status = :status";

        Query query = entityManager.createQuery(stringQuery, Order.class);
        query.setParameter("status", "очікується");
        return (List<Order>)query.getResultList();
    }

    @Override
    public void updateOrder(Order order) {
        System.out.println("Записую");
        entityManager.merge(order);
        System.out.println("Записано");


    }
}
