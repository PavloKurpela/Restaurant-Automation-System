package com.mainacad.myproject.controler;


import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.Waiter;
import com.mainacad.myproject.services.OrderService;
import com.mainacad.myproject.services.WaiterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/waiter")
public class WaiterController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private WaiterService waiterService;

    Waiter waiter = null;

    @RequestMapping("")
    public String waiterPage() {
        return "waiters-page";
    }

    @RequestMapping("/orders")
    public String waiterAllOrders() {
        return "waiters-all-orders";
    }

    @RequestMapping(value = "/active-orders", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getActiveOrders() {

        if (waiter == null) {
            waiter = waiterService.getWaiterById(330);
        }

        List<Order> result = orderService.getActiveOrderForOneWaiter(waiter);
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/order/{id}", method = RequestMethod.PUT)
    public @ResponseBody
    Map<String, Object> completedOrderById(@PathVariable("id") long id){
        Order order = orderService.getOrderById(id);

        if (waiter == null) {
            waiter = waiterService.getWaiterById(330);
        }

        if (order == null) {
            return Ajax.errorResponse("Order with id = " + id + "does not exist");
        }
        order.setStatus("завершено");
        System.out.println(order.getWaiter().getCountActiveOrders());
        orderService.updateOrder(order);
        waiter.setCountActiveOrders(waiter.getCountActiveOrders()-1);
        waiterService.updateWaiter(waiter);
        return Ajax.emptyResponse();
    }
    @RequestMapping(value = "/pay-order/{id}", method = RequestMethod.PUT)
    public @ResponseBody
    Map<String, Object> paydOrderById(@PathVariable("id") long id){
        Order order = orderService.getOrderById(id);
        if (order == null) {
            return Ajax.errorResponse("Order with id = " + id + "does not exist");
        }
        order.setPaymentStatus(true);
        orderService.updateOrder(order);
        return Ajax.emptyResponse();
    }


    @RequestMapping(value = "/all-dish-for-date", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> menuAdd(@RequestParam("date") String date,
                                Model model) {


        LocalDate ordersDate;

        if (date == "") {
            ordersDate = LocalDate.now();
        } else {
            ordersDate = LocalDate.parse(date);
        }

//        LocalDateTime localDateTime = LocalDateTime.of(ordersDate, LocalTime.of(0,0));
//
        if (waiter == null) {
            waiter = waiterService.getWaiterById(330);
        }

//        System.out.println(localDateTime);
        List<Order> result = orderService.getOrderForOneWaiterforOneDay(waiter, ordersDate);
        return Ajax.successResponse(result);
    }

}
