package com.mainacad.myproject.controler;


import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.services.MenuService;
import com.mainacad.myproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String menu(Model model) {
        return "menu";
    }

    @RequestMapping(value = "/first_dish", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getFirstDish() {
        List<Dish> result =  menuService.listDishes("перше");

        System.out.println(menuService.listDishes("перше"));
        return Ajax.successResponse(result);
    }


    @RequestMapping(value = "/second_dish", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getSecondDish() {
        List<Dish> result =  menuService.listDishes("друге");


        System.out.println(menuService.listDishes("друге"));
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/hot_snack", method = RequestMethod.GET)
    public ResponseEntity getHotSnack() {
        List<Dish> result =  menuService.listDishes("гаряча закуска");

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("myheader", "Привіт!!!");
        System.out.println(menuService.listDishes("гаряча закуска"));
        return new ResponseEntity<>(Ajax.successResponse(result), httpHeaders, HttpStatus.OK);
    }

    @RequestMapping(value = "/cold_snack", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getColdSnack() {
        List<Dish> result =  menuService.listDishes("холодна закуска");

        System.out.println(menuService.listDishes("холодна закуска"));
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/garnish", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getGarnish() {
        List<Dish> result =  menuService.listDishes("гарнір");

        System.out.println(menuService.listDishes("гарнір"));
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/dessert", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getDessert() {
        List<Dish> result =  menuService.listDishes("десерт");

        System.out.println(menuService.listDishes("десерт"));
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/add-dish-to-order", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> menuAdd(@RequestParam("dishId") long dishId,
                                @RequestParam("countDish") int countDish,
                                Model model) {
        if (dishId == 0) {
            return Ajax.emptyResponse();
        }
        System.out.println("dishId = " + dishId + "  count: " + countDish);
        System.out.println(menuService.getDish(dishId));


        User user = userService.getActiveUser();
        if (user == null) {
            return Ajax.errorResponse("Ви не авторизовані");
        }
        if (user.getMyOrder() == null) {
            user.setMyOrder(new Order());
        }

        System.out.println(user.getMyOrder());

        System.out.println(user.getMyOrders());


        menuService.addDish(dishId, countDish, user.getMyOrder());
        System.out.println(user.getMyOrder());
        return Ajax.emptyResponse();

    }

}
