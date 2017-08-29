package com.mainacad.myproject.services;

import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.repository.DaoOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderService {

    @Autowired
    private DaoOrder daoOrder;

    @Transactional
    public void addOrder(Order order) {
        daoOrder.addOrder(order);
    }



}
