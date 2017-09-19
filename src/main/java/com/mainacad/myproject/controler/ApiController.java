package com.mainacad.myproject.controler;

import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.services.MenuService;
import com.mainacad.myproject.services.OrderService;
import com.mainacad.myproject.services.TablesService;
import com.mainacad.myproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api")

public class ApiController {

    @Autowired
    private UserService userService;

    //User user = userService.getUser((long)201);

    User user = null;

    @Autowired
    private MenuService menuService;

    @Autowired
    private TablesService tablesService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public ResponseEntity<?> orders2(Model model, UriComponentsBuilder ucBuilder) {

        if (user == null) {
            user = userService.initUser();
        }
        List<Order> res = orderService.orderList(user);

        for (Order order : res) {
            OrderService.changeSum(order);
        }
        //res.add(user.getMyOrder());
        System.out.println(res);

        return new ResponseEntity<>(Ajax.successResponse(res), HttpStatus.OK);
    }

    @RequestMapping(value = "/new-order", method = RequestMethod.GET)
    public @ResponseBody
        Map<String, Object> getOrder() {

        if (user == null) {
            user = userService.initUser();
        }

        if(user.getMyOrder() == null) {
            return Ajax.errorResponse("немає");
        }
        return Ajax.successResponse(user.getMyOrder());
    }

    @RequestMapping(value = "/add-new-order", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> orderNewAdd(Model model) {

        if (user == null) {
            user = userService.initUser();

        }

        user.setMyOrder(new Order());
        user.getMyOrder().setCustomer(user);

        return Ajax.emptyResponse();
    }

    @RequestMapping(value = "/set-count-person", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> setCoutPerson(@RequestParam("countPerson") int countPerson,
                                Model model) {

        //int c = Integer.getInteger(countPerson);
        user.getMyOrder().setCountPerson(countPerson);

        return Ajax.emptyResponse();
    }

    @RequestMapping(value = "/set-order-date", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> setOrderDate(@RequestParam("startDate") String startDate,
                                      @RequestParam("endDate") String endDate,
                                      Model model) {

        orderService.setDateForOrder(startDate, endDate);

        System.out.println(user.getMyOrder().getDateTimeFrom());
        System.out.println(user.getMyOrder().getDateTimeBefore());

        return Ajax.emptyResponse();
    }

    @RequestMapping(value = "/new-order/{id-dish}", method = RequestMethod.DELETE)
    public ResponseEntity<?> deletePatientById(@PathVariable("id-dish") long dishId){

        orderService.deleteOrderedDish(dishId);

        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @RequestMapping(value = "/new-order/{id-dish}", method = RequestMethod.PUT, consumes = MediaType.ALL_VALUE)
    public ResponseEntity<?> updatePatient(@RequestParam("newCount") int newCount, @PathVariable("id-dish") long dishId){


        orderService.changeCountOrderedDish(dishId, newCount);

        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @RequestMapping(value = "/order/{idOr}", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getPatientById(@PathVariable("idOr") long id){
        Order order = orderService.getOrderById(id);
        if(order == null) {
            System.out.println("Нема!!!");
            return Ajax.errorResponse("Нема");
        }
        return Ajax.successResponse(order);
    }

    @RequestMapping(value = "/order/{id}", method = RequestMethod.DELETE)
    public @ResponseBody
    Map<String, Object> deleteOrderById(@PathVariable("id") long id){
        Order order = orderService.getOrderById(id);
        if (order == null) {
            return Ajax.errorResponse("Order with id = " + id + "does not exist");
        }
        orderService.deleteOrder(id);
        return Ajax.emptyResponse();
    }

    @RequestMapping(value = "/all_dish", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getAllDish() {
        List<Dish> result =  menuService.listAllDishes();
        return Ajax.successResponse(result);
    }

}
