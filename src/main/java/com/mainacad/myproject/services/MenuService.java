package com.mainacad.myproject.services;

import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.OrderedDish;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.repository.DaoMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MenuService {

    @Autowired
    private DaoMenu daoMenu;

    @Transactional
    public List<Dish> listDishes(String typeDish) {
        return daoMenu.listName(typeDish);
    }
    @Transactional
    public List<Dish> listAllDishes() {
        return daoMenu.getAllDish();
    }

    @Transactional
    public void addNewDish(Dish dish) {
        daoMenu.addDish(dish);
    }

    public Dish getDish(long id) {
        return daoMenu.getDish(id);
    }

    public void addDish(long dishId, int count, Order order) {

        OrderedDish orderedDish = new OrderedDish();
        orderedDish.setDish(daoMenu.getDish(dishId));
        orderedDish.setCount(count);
        //orderedDish.setOrder(order);

        order.addOrderedDishes(orderedDish);
    }

    @Transactional
    public void deleteDish(long dishId) {
        Dish dish = this.getDish(dishId);
        daoMenu.removeDish(dish);
    }

    @Transactional
    public void changeDish(Dish dish) {
        daoMenu.changeDish(dish);
    }
}
