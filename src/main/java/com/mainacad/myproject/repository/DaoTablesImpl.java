package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Table;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class DaoTablesImpl implements DaoTables  {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Table> tableList() {
        Query query = entityManager.createQuery("SELECT c FROM Table c", Table.class);
        return (List<Table>)query.getResultList();
    }

    @Override
    public Table getTable(int id) {
        Table table =  entityManager.find(Table.class, id);
        return table;
    }
}
