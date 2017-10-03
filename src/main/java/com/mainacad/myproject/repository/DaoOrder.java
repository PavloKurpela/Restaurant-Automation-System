package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.entities.Waiter;

import java.time.LocalDateTime;
import java.util.List;

public interface DaoOrder {

    public void addOrder(Order order);

    public List<Order> listOrder(User customer);

    public Order getOrder (long id);

    public void deleteOrder (long toDelete);

    public List<Order> allExpectedOrders();

    public void updateOrder(Order order);

    public List<Order> activeOrdersForOneWaiter(Waiter waiter);

    public List<Order> ordersForOneWaiterforOneDay(Waiter waiter, LocalDateTime dateTime);
}
