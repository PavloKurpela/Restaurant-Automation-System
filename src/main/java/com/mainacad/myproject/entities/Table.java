package com.mainacad.myproject.entities;

import javax.persistence.*;
import javax.xml.crypto.Data;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;


@Entity
@javax.persistence.Table(name = "tables")
public class Table implements Serializable {

    @Id
    @GeneratedValue
    private int id;


    private int maxCountPerson;
    //private List<HashMap<String, LocalDateTime>> busyTime;
    private int numberTable;

    public Table() {
    }

    public Table(int id, int maxCountPerson) {
        this.id = id;
        this.maxCountPerson = maxCountPerson;
    }

    public Table(int id, int maxCountPerson, int numberTable) {
        this.id = id;
        this.maxCountPerson = maxCountPerson;
        this.numberTable = numberTable;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMaxCountPerson() {
        return maxCountPerson;
    }

    public void setMaxCountPerson(int maxCountPerson) {
        this.maxCountPerson = maxCountPerson;
    }

//    public List<HashMap<String, LocalDateTime>> getBusyTime() {
//        return busyTime;
//    }
//
//    public void setBusyTime(List<HashMap<String, LocalDateTime>> busyTime) {
//        this.busyTime = busyTime;
//    }

    public int getNumberTable() {
        return numberTable;
    }

    public void setNumberTable(int numberTable) {
        this.numberTable = numberTable;
    }
}
