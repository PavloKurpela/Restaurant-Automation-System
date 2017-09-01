package com.mainacad.myproject.services;

import com.mainacad.myproject.entities.*;
import com.mainacad.myproject.repository.DaoOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    private DaoOrder daoOrder;

    @Transactional
    public void addOrder(Order order) {

        order.setStatus("очікується");
        daoOrder.addOrder(order);

    }

    @Transactional
    public List<Order> orderList(User customer) {
        return daoOrder.listOrder(customer);
    }

    public static void changeSum(Order order) {
        BigDecimal result = new BigDecimal(0);
        for (OrderedDish orderedDish : order.getOrderedDishes()) {
            result = result.add(orderedDish.getDish().getPrice().multiply(BigDecimal.valueOf(orderedDish.getCount())));
        }
        order.setOrderSum(result.doubleValue());
    }

    @Transactional
    public Order getOrderById(long id) {
        return daoOrder.getOrder(id);
    }

}
