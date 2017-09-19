package com.mainacad.myproject.entities;


import com.mainacad.myproject.entities.Order;

import javax.persistence.*;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "dishes")
public class Dish implements Serializable {

    @Id
    @GeneratedValue
    private long id;

    private String name;
    private BigDecimal price;
    private double weigth;
    private int cookingTime; //час готування в хвилиниах
    private String type;

    public double getWeigth() {
        return weigth;
    }

    public void setWeigth(double weigth) {
        this.weigth = weigth;
    }

    public int getCookingTime() {
        return cookingTime;
    }

    public void setCookingTime(int cookingTime) {
        this.cookingTime = cookingTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Dish(String name, BigDecimal price) {
        this.name = name;
        this.price = price;
    }

    public Dish(String name) {
        this.name = name;
    }

    public Dish() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Dish{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", weigth=" + weigth +
                ", cookingTime=" + cookingTime +
                ", type='" + type + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Dish)) return false;

        Dish dish = (Dish) o;

        if (id != dish.id) return false;
        if (Double.compare(dish.weigth, weigth) != 0) return false;
        if (name != null ? !name.equals(dish.name) : dish.name != null) return false;
        return price != null ? price.equals(dish.price) : dish.price == null;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        temp = Double.doubleToLongBits(weigth);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
