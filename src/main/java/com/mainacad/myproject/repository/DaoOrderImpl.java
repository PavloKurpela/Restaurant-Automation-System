package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.*;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.time.LocalDateTime;
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
    public List<Order> activeOrdersForOneWaiter(Waiter waiter) {

        String stringQuery = "SELECT o FROM Order o WHERE o.status = :status AND o.waiter = :waiter";

        Query query = entityManager.createQuery(stringQuery, Order.class);
        query.setParameter("status", "виконується");
        query.setParameter("waiter", waiter);
        return (List<Order>)query.getResultList();
    }

    @Override
    public List<Order> ordersForOneWaiterforOneDay(Waiter waiter, LocalDateTime dateTime) {

        String stringQuery = "SELECT o FROM Order o WHERE o.waiter = :waiter AND o.dateTimeFrom > :startDate AND o.dateTimeFrom < :endDate";
        Query query = entityManager.createQuery(stringQuery, Order.class);
        query.setParameter("waiter", waiter);
        query.setParameter("startDate", dateTime);
        query.setParameter("endDate", dateTime.plusDays(1));
        return (List<Order>)query.getResultList();
    }

    @Override
    public void updateOrder(Order order) {
        System.out.println("Записую");
        entityManager.merge(order);
        System.out.println("Записано");
    }
}
