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
}
