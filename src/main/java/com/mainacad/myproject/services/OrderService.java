package com.mainacad.myproject.services;

import com.mainacad.myproject.entities.*;
import com.mainacad.myproject.repository.DaoOrder;
import com.mainacad.myproject.repository.DaoWaiter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.Temporal;
import java.time.temporal.TemporalAmount;
import java.time.temporal.TemporalUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class OrderService {

    @Autowired
    private DaoOrder daoOrder;

    @Autowired
    private MenuService menuService;

    @Autowired
    private DaoWaiter daoWaiter;

    @Autowired
    UserService userService;

    @Transactional
    public void addOrder(Order order) {

        order.setTimeShipmentOrder(LocalDateTime.now());
        order.setStatus("очікується");
        order.setCustomer(userService.getActiveUser());
        daoOrder.addOrder(order);
    }

    @Transactional
    public List<Order> orderList(User customer) {
        return daoOrder.listOrder(customer);
    }

    public static void changeSum(Order order) {
        BigDecimal result = new BigDecimal(0);
        for (OrderedDish orderedDish : order.getOrderedDishes()) {
            result = result.add(orderedDish.getDish().getPrice().multiply(BigDecimal.valueOf(orderedDish.getCount())));
        }
        order.setOrderSum(result.doubleValue());
    }

    @Transactional
    public Order getOrderById(long id) {
        return daoOrder.getOrder(id);
    }

    public void setDateForOrder (String startDate, String endDate) {

        User user = userService.getActiveUser();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        user.getMyOrder().setDateTimeFrom(LocalDateTime.parse(startDate, formatter));
        user.getMyOrder().setDateTimeBefore(LocalDateTime.parse(endDate, formatter));
    }

    @Transactional
    public void deleteOrderedDish(long dishId) {

        User user = userService.getActiveUser();
        Dish dish = menuService.getDish(dishId);

        OrderedDish ordDish = null;

        for(OrderedDish orderedDish : user.getMyOrder().getOrderedDishes()) {

            if (dish.equals(orderedDish.getDish())) {
                    System.out.println("Deleting ordered dish: " + orderedDish);
                    ordDish = orderedDish;
                    break;
            }
        }
        user.getMyOrder().getOrderedDishes().remove(ordDish);
        OrderService.changeSum(user.getMyOrder());
    }

    @Transactional
    public void changeCountOrderedDish(long dishId, int newCount) {

        User user = userService.getActiveUser();
        Dish dish = menuService.getDish(dishId);

        for(OrderedDish orderedDish : user.getMyOrder().getOrderedDishes()) {

            if (dish.equals(orderedDish.getDish())) {
                System.out.println("Deleting ordered dish: " + orderedDish);
                orderedDish.setCount(newCount);
                break;
            }
        }
    }


    @Transactional
    public void deleteOrder(long toDelete) {
        daoOrder.deleteOrder(toDelete);
    }

    public List<Order> getExpectedOrder(){
        List<Order> allExpectedOrders = new ArrayList<>(); //= daoOrder.allExpectedOrders();

        for (Order order : daoOrder.allExpectedOrders()) {
//            if(order.getDateTimeFrom().isBefore(LocalDateTime.now())) {
//                allExpectedOrders.add(order);
//            } else {
                Duration duration = Duration.between(LocalDateTime.now(), order.getDateTimeFrom());

                long timeInSec = 2 * 60 * 60;
                if (duration.getSeconds() <= timeInSec) {
                    allExpectedOrders.add(order);
                }
            }
//        }
        return allExpectedOrders;
    }

    @Transactional
    public void setWaiterForOrder(Order order) {
        List<Waiter> activeWaiter = daoWaiter.getAllActiveWaiter();
        System.out.println(activeWaiter);

        int minOrders = activeWaiter.get(0).getCountActiveOrders();
        List<Waiter> waitersWithMinOrder = new ArrayList<>();
        waitersWithMinOrder.add(activeWaiter.get(0));

        for (int i = 1; i < activeWaiter.size(); i++ ) {
            if (activeWaiter.get(i).getCountActiveOrders() < minOrders) {
                minOrders = activeWaiter.get(i).getCountActiveOrders();
                waitersWithMinOrder.clear();
                waitersWithMinOrder.add(activeWaiter.get(i));
            } else {
                if (minOrders == activeWaiter.get(i).getCountActiveOrders()) {
                    waitersWithMinOrder.add(activeWaiter.get(i));
                }
            }
        }
        Random random = new Random();
        Waiter randomWaiter = waitersWithMinOrder.get(random.nextInt(waitersWithMinOrder.size()));
        order.setWaiter(randomWaiter);
        randomWaiter.setCountActiveOrders(randomWaiter.getCountActiveOrders()+1);
        System.out.println(order);
    }

    @Transactional
    public void updateOrder(long idOrder) {
            Order order = this.getOrderById(idOrder);
            this.setWaiterForOrder(order);
            order.setStatus("виконується");
            daoOrder.updateOrder(order);
        System.out.println("Зроблено");
    }

    public List<Order> getActiveOrderForOneWaiter(Waiter waiter){
        List<Order> activeOrders = daoOrder.activeOrdersForOneWaiter(waiter);
        return activeOrders;
    }

    public List<Order> getOrderForOneWaiterforOneDay(Waiter waiter, LocalDate date){

        LocalDateTime dateTimeOrders = LocalDateTime.of(date, LocalTime.of(0,0));

        List<Order> activeOrders = daoOrder.ordersForOneWaiterforOneDay(waiter, dateTimeOrders);
        return activeOrders;
    }

    @Transactional
    public void updateOrder(Order order) {
        daoOrder.updateOrder(order);
    }
}
