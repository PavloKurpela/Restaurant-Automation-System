package com.mainacad.myproject.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "waiters")
public class Waiter {

    @Id
    @GeneratedValue
    private long id;

    private String firstName;

    private String lastName;

    @Column(unique = true)
    private String loginName;

    private String password;

    private boolean active;

    private int countActiveOrders;

    @Transient
    private List<Order> activeOrders;

    public Waiter() {
    }

    public Waiter(String firstName, String lastName, String loginName, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.loginName = loginName;
        this.password = password;
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

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public int getCountActiveOrders() {
        return countActiveOrders;
    }

    public void setCountActiveOrders(int countActiveOrders) {
        this.countActiveOrders = countActiveOrders;
    }

    @Override
    public String toString() {
        return "Waiter{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", loginName='" + loginName + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Waiter)) return false;

        Waiter waiter = (Waiter) o;

        if (id != waiter.id) return false;
        if (firstName != null ? !firstName.equals(waiter.firstName) : waiter.firstName != null) return false;
        if (lastName != null ? !lastName.equals(waiter.lastName) : waiter.lastName != null) return false;
        return loginName != null ? loginName.equals(waiter.loginName) : waiter.loginName == null;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
        result = 31 * result + (loginName != null ? loginName.hashCode() : 0);
        return result;
    }
}
