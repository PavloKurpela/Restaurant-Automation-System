package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class DaoMenuImpl implements DaoMenu {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Dish> listName(String typeDish) {

        String stringQuery = "SELECT c FROM Dish c WHERE c.type = :typeDish";

        Query query = entityManager.createQuery(stringQuery, Dish.class);
        query.setParameter("typeDish", typeDish);
        return (List<Dish>)query.getResultList();
    }

    @Override
    public List<Dish> getAllDish() {

        String stringQuery = "SELECT c FROM Dish c";

        Query query = entityManager.createQuery(stringQuery, Dish.class);
        return (List<Dish>)query.getResultList();
    }

    @Override
    public Dish getDish (long id) {
        Dish dish =  entityManager.find(Dish.class, id);
        return dish;
    }

    @Override
    public void addDish(Dish dish) {
        entityManager.persist(dish);
    }
    @Override
    public void removeDish(Dish dish) {
        entityManager.remove(dish);
    }
    @Override
    public void changeDish(Dish dish) {
        entityManager.merge(dish);
    }
}
