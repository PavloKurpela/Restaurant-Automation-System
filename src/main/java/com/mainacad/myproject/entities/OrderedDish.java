package com.mainacad.myproject.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.persistence.Table;
import java.io.Serializable;


@Entity
@Table(name = "ordered_dishes")
public class OrderedDish implements Serializable {


    @Id
    @GeneratedValue
    private long id;

    @ManyToOne
    @JoinColumn(name = "dish_id")
    private Dish dish;

    @ManyToOne
    @JoinColumn(name = "order_id")
    @JsonIgnore
    private Order order;

    private int count;

    private String comment;

    public OrderedDish() {
    }

    public OrderedDish(Dish dish, int count, String comment) {
        this.dish = dish;
        this.count = count;
        this.comment = comment;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "OrderedDish{" +
                "id=" + id +
                ", dish=" + dish +
                ", count=" + count +
                '}';
    }
}
