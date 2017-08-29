package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;
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
    public Dish getDish (long id) {
        Dish dish =  entityManager.find(Dish.class, id);
        return dish;
    }
}
