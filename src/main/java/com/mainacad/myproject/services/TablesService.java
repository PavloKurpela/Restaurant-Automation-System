package com.mainacad.myproject.services;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.OrderedDish;
import com.mainacad.myproject.entities.Table;
import com.mainacad.myproject.repository.DaoTables;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TablesService {

    @Autowired
    private DaoTables daoTables;

    @Transactional
    public List<Table> listTable() {
        return daoTables.tableList();
    }

    @Transactional
    public Table getTable(int id) {
        return daoTables.getTable(id);
    }

    @Transactional
    public void addTable(int tableId, Order order) {

        OrderedDish orderedDish = new OrderedDish();

        order.setTableOrdered(daoTables.getTable(tableId));
    }

}

