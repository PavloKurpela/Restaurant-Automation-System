package com.mainacad.myproject.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.mainacad.myproject.config.CustomLocalDateTimeSerializer;
import com.mainacad.myproject.config.JsonDateDeserializer;
import com.mainacad.myproject.services.OrderService;

import javax.persistence.*;
import javax.persistence.Table;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue
    private long id;

    @OneToMany(
            fetch = FetchType.EAGER,
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    @JoinColumn(name = "order_id")
    private List<OrderedDish> orderedDishes = new ArrayList();

    @ManyToOne(fetch = FetchType.EAGER,
                cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    @JoinColumn(name = "table_id")
    private com.mainacad.myproject.entities.Table tableOrdered;


    @JsonSerialize(using = CustomLocalDateTimeSerializer.class)
    @JsonDeserialize(using = JsonDateDeserializer.class)
    private LocalDateTime timeShipmentOrder;
    @JsonSerialize(using = CustomLocalDateTimeSerializer.class)
    @JsonDeserialize(using = JsonDateDeserializer.class)
    private LocalDateTime dateTimeFrom;
    @JsonSerialize(using = CustomLocalDateTimeSerializer.class)
    @JsonDeserialize(using = JsonDateDeserializer.class)
    private LocalDateTime dateTimeBefore;

    private boolean paymentStatus;

    private String status = "формується";

    private int countPerson;

    private double orderSum;

//    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "customer_id")
    private User customer;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "waiter_id")
    private Waiter waiter;

    public int getCountPerson() {
        return countPerson;
    }

    public void setCountPerson(int countPerson) {
        this.countPerson = countPerson;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public LocalDateTime getDateTimeFrom() {
        return dateTimeFrom;
    }

    public void setDateTimeFrom(LocalDateTime dateTimeFrom) {
        this.dateTimeFrom = dateTimeFrom;
    }

    public LocalDateTime getDateTimeBefore() {
        return dateTimeBefore;
    }

    public void setDateTimeBefore(LocalDateTime dateTimeBefore) {
        this.dateTimeBefore = dateTimeBefore;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<OrderedDish> getOrderedDishes() {
        return orderedDishes;
    }

    public void addOrderedDishes(OrderedDish orderedDish) {
        this.orderedDishes.add(orderedDish);
        OrderService.changeSum(this);
    }

    public com.mainacad.myproject.entities.Table getTableOrdered() {
        return tableOrdered;
    }

    public void setTableOrdered(com.mainacad.myproject.entities.Table tableOrdered) {
        this.tableOrdered = tableOrdered;
    }

    public double getOrderSum() {
        return orderSum;
    }

    public void setOrderSum(double orderSum) {
        this.orderSum = orderSum;
    }

    public LocalDateTime getTimeShipmentOrder() {
        return timeShipmentOrder;
    }

    public boolean isPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(boolean paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public void setTimeShipmentOrder(LocalDateTime timeShipmentOrder) {
        this.timeShipmentOrder = timeShipmentOrder;
    }

    public Waiter getWaiter() {
        return waiter;
    }

    public void setWaiter(Waiter waiter) {
        this.waiter = waiter;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", orderedDishes=" + orderedDishes +
                ", tableOrdered=" + tableOrdered +
                ", dateTimeFrom=" + dateTimeFrom +
                ", dateTimeBefore=" + dateTimeBefore +
                ", status='" + status + '\'' +
                ", countPerson=" + countPerson +
                ", customer=" + customer +
                ", waiter=" + waiter +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Order)) return false;

        Order order = (Order) o;

        if (id != order.id) return false;
        if (countPerson != order.countPerson) return false;
        if (Double.compare(order.orderSum, orderSum) != 0) return false;
        return customer != null ? customer.equals(order.customer) : order.customer == null;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = (int) (id ^ (id >>> 32));
        result = 31 * result + countPerson;
        temp = Double.doubleToLongBits(orderSum);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (customer != null ? customer.hashCode() : 0);
        return result;
    }
}
