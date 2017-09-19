package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.User;

import java.util.List;

public interface DaoOrder {

    public void addOrder(Order order);

    public List<Order> listOrder(User customer);

    public Order getOrder (long id);

    public void deleteOrder (long toDelete);

}
