package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;

import java.util.List;

public interface DaoMenu {

    List<Dish> listName(String nameTable);

    public Dish getDish (long id);

    public List getAllDish();

    public void addDish(Dish dish);

    public void removeDish(Dish dish);

    public void changeDish(Dish dish);

}
