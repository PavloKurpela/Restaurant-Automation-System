package com.mainacad.myproject.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue
    private long id;

    private String firstName;

    private String lastName;

    private String loginName;

    private String password;

    @JsonIgnore
    @OneToMany(
            fetch = FetchType.EAGER,
            mappedBy = "customer",
            //cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    List<Order> myOrders = new ArrayList<>();

    @Transient
    private Order myOrder;


    public User() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Order getMyOrder() {
        return myOrder;
    }

    public void setMyOrder(Order myOrder) {
        this.myOrder = myOrder;
    }

    public List<Order> getMyOrders() {
        return myOrders;
    }

    public void addOrder(Order myOrder) {
        this.myOrders.add(myOrder);
    }
}
