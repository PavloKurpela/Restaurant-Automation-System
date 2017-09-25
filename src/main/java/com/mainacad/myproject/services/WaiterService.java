package com.mainacad.myproject.services;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Waiter;
import com.mainacad.myproject.repository.DaoWaiter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class WaiterService {

    @Autowired
    DaoWaiter daoWaiter;

    public List<Waiter> activeWaiter = new ArrayList<>();

    public void addActiveWaiter(Waiter waiter) {
        activeWaiter.add(waiter);
    }

    public void removeActiveWaiter(Waiter waiter) {
        activeWaiter.remove(waiter);
    }

    @Transactional
    public List<Waiter> listAllWaiter() {
        return daoWaiter.getAllWaiter();
    }

    @Transactional
    public void addNewWaiter(Waiter waiter) {
        daoWaiter.addWaiter(waiter);
    }

    @Transactional
    public Waiter getWaiterById(long idWaiter) {
        return daoWaiter.getWaiter(idWaiter);
    }


    @Transactional
    public void deleteWaiter(long id) {
        Waiter waiter = this.getWaiterById(id);
        daoWaiter.removeWaiter(waiter);
    }
}
