package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Waiter;

import java.util.List;

public interface DaoWaiter {



    public List getAllWaiter();

    public List<Waiter> getAllActiveWaiter();

    public void addWaiter(Waiter waiter);

    public void removeWaiter(Waiter waiter);

    public void changeDish(Dish dish);

    public Waiter getWaiter (long id);

    public void updateWaiter(Waiter waiter);

    public Waiter getWaiterByLoginName(String login);

}
