package com.mainacad.myproject.repository;

import com.mainacad.myproject.entities.Table;

import java.util.List;

public interface DaoTables {

    List<Table> tableList();
    public Table getTable(int id);

}
