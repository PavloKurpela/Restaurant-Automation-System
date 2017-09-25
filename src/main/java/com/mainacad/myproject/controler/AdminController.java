package com.mainacad.myproject.controler;


import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.Waiter;
import com.mainacad.myproject.services.MenuService;
import com.mainacad.myproject.services.OrderService;
import com.mainacad.myproject.services.WaiterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private WaiterService waiterService;

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/dish", method = RequestMethod.GET)
    public ModelAndView adminDish(Model model) {

        Map<String, Dish> resultModel = new HashMap<>();

        resultModel.put("dish", new Dish());

        return new ModelAndView("admin-dish", resultModel);
    }

    @RequestMapping(value = "/waiter", method = RequestMethod.GET)
    public ModelAndView adminWaiter(Model model) {

        Map<String, Waiter> resultModel = new HashMap<>();

        resultModel.put("waiter", new Waiter());

        return new ModelAndView("admin-waiter", resultModel);
    }

    @RequestMapping("/order")
    public String adminOrder(Model model) {
        return "admin-order";
    }

    @RequestMapping(value = "/changeDish", method = RequestMethod.POST)
    public String changeDish(@Valid @ModelAttribute("dish")Dish dish,
                             BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "error";
        }
        System.out.println(dish);

        menuService.changeDish(dish);

        return "redirect:/admin/dish";
    }

    @RequestMapping(value = "/addDish", method = RequestMethod.POST)
    public String submit(@Valid @ModelAttribute("dish")Dish dish,
                         BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "error";
        }
        System.out.println(dish);
        menuService.addNewDish(dish);

        return "redirect:/admin/dish";
    }

    @RequestMapping(value = "/addWaiter", method = RequestMethod.POST)
    public String submit(@Valid @ModelAttribute("waiter")Waiter waiter,
                         BindingResult result, ModelMap model) {
        if (result.hasErrors()) {
            return "error";
        }
        System.out.println(waiter);

        waiterService.addNewWaiter(waiter);
        return "redirect:/admin/waiter";
    }

    @RequestMapping(value = "/one-dish/{id}", method = RequestMethod.GET)
    public ModelAndView oneDish(@PathVariable("id") long id, Model model) {


        Dish dish1 = menuService.getDish(id);

        Map<String, Dish> resultModel = new HashMap<>();

        resultModel.put("dish", dish1);


        return new ModelAndView("one-dish", resultModel);

    }

    @RequestMapping(value = "/one-dish/{id}", method = RequestMethod.DELETE)
    public @ResponseBody
    Map<String, Object> deleteDishById(@PathVariable("id") long id){

        Dish dish = menuService.getDish(id);
        if (dish == null) {
            return Ajax.errorResponse("Dish with id = " + id + "does not exist");
        }
        menuService.deleteDish(id);
        return Ajax.emptyResponse();
    }

    @RequestMapping(value = "/one-waiter/{id}", method = RequestMethod.DELETE)
    public @ResponseBody
    Map<String, Object> deleteWaiterById(@PathVariable("id") long id){

        Waiter waiter = waiterService.getWaiterById(id);
        if (waiter == null) {
            return Ajax.errorResponse("Waiter with id = " + id + "does not exist");
        }
        System.out.println(waiter);
        waiterService.deleteWaiter(id);
        return Ajax.emptyResponse();
    }

    @RequestMapping(value = "/all_dish", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getAllDish() {
        List<Dish> result =  menuService.listAllDishes();
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/all_waiter", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getAllWaiter() {
        List<Waiter> result = waiterService.listAllWaiter();
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/expected-orders", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getExpectedOrders() {
        List<Order> result = orderService.getExpectedOrder();
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/start-service/{idOr}", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> startService(@PathVariable("idOr") long id){
        orderService.updateOrder(id);
        return Ajax.emptyResponse();
    }

}
