package com.mainacad.myproject.controler;

import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.entities.Dish;
import com.mainacad.myproject.repository.UserDao;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.*;

@Controller
@Repository
@RequestMapping("/")
public class MainController {

    @Autowired
    private UserService userService;

    //User user = userService.getUser((long)1);

    User user = new User();

    @Autowired
    private MenuService menuService;

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private TablesService tablesService;

    @Autowired
    private OrderService orderService;

    String filePath = "E:\\java\\JavaEE\\Example\\correspondence\\my_uploads";


    @RequestMapping("/mypage")
    public ResponseEntity<?> mypage() {
        //model.addAttribute("employees", referenceService.listOfEmployees());
        HttpHeaders headers = new HttpHeaders();
        headers.set("doc", "ddd");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

//    @RequestMapping("/first_dish")
//    public String first_dishes(Model model) {
//        model.addAttribute("first_dishes", menuService.listDishes("FirstDish"));
//        System.out.println(menuService.listDishes("FirstDish"));
//        return "first_dish";
//    }

    @RequestMapping("/tables")
    public String tables(Model model) {
        model.addAttribute("table", tablesService.listTable());
        System.out.println(tablesService.listTable());
        return "tables";
    }


    @RequestMapping(value = "/menu/add-table", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> tableAdd(@RequestParam("tableId") int tableId) {
        if (tableId == 0) {
            return Ajax.emptyResponse();
        }
        //dataService.persist(data);
        System.out.println("tableId = " + tableId);
        System.out.println(tablesService.getTable(tableId));


        System.out.println(user.getMyOrder());

        if (user.getMyOrder() == null) {
            user.setMyOrder(new Order());
        }

        System.out.println(user.getMyOrder());

        tablesService.addTable(tableId, user.getMyOrder());

        System.out.println(user.getMyOrder());
        return Ajax.emptyResponse();

    }

    @RequestMapping("/menu")
    public String menu(Model model) {
        //model.addAttribute("employees", referenceService.listOfEmployees());
        return "menu";
    }

    @RequestMapping(value = "/first_dish", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getFirstDish() {
            List<Dish> result =  menuService.listDishes("перше");

            System.out.println(menuService.listDishes("перше"));
            return Ajax.successResponse(result);
    }

//    @RequestMapping(value = "/first_dish", method = RequestMethod.GET)
//    public ResponseEntity<List<Dish>> getFirstDish() {
//        List<Dish> response =  menuService.listDishes("FirstDish");
//
//        System.out.println(menuService.listDishes("FirstDish"));
//        return new ResponseEntity<List<Dish>>(response, HttpStatus.OK);
//    }

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

        List<String> nameResult = new ArrayList<>();


//            for (FirstDish r : result) {
//                nameResult.add(r.getName());
//            }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("myheader", "Привіт!!!");
        System.out.println(menuService.listDishes("гаряча закуска"));
        return new ResponseEntity<>(Ajax.successResponse(result), httpHeaders, HttpStatus.OK);
    }

    @RequestMapping(value = "/cold_snack", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getColdSnack() {
        List<Dish> result =  menuService.listDishes("холодна закуска");

        List<String> nameResult = new ArrayList<>();


//            for (FirstDish r : result) {
//                nameResult.add(r.getName());
//            }

        System.out.println(menuService.listDishes("холодна закуска"));
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/garnish", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getGarnish() {
        List<Dish> result =  menuService.listDishes("гарнір");

        List<String> nameResult = new ArrayList<>();


//            for (FirstDish r : result) {
//                nameResult.add(r.getName());
//            }

        System.out.println(menuService.listDishes("гарнір"));
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/dessert", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> getDessert() {
        List<Dish> result =  menuService.listDishes("десерт");

        List<String> nameResult = new ArrayList<>();


//            for (FirstDish r : result) {
//                nameResult.add(r.getName());
//            }

        System.out.println(menuService.listDishes("десерт"));
        return Ajax.successResponse(result);
    }

    @RequestMapping(value = "/menu/add-dish-to-order", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> menuAdd(@RequestParam("dishId") long dishId,
                                @RequestParam("countDish") int countDish,
                                Model model) {
            if (dishId == 0) {
                return Ajax.emptyResponse();
            }
            //dataService.persist(data);
            System.out.println("dishId = " + dishId + "  count: " + countDish);
            System.out.println(menuService.getDish(dishId));


        System.out.println(user.getMyOrder());

        if (user.getMyOrder() == null) {
            user.setMyOrder(new Order());
        }

        System.out.println(user.getMyOrder());

        menuService.addDish(dishId, countDish, user.getMyOrder());
        //orderService.addOrder(user.getMyOrder());
        System.out.println(user.getMyOrder());
        return Ajax.emptyResponse();

    }

    @RequestMapping(value = "/menu/add-order", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> orderAdd(Model model) {

            if (user.getMyOrder() == null || user.getMyOrder().getOrderedDishes().size() == 0) {
                return Ajax.errorResponse("dishNull");
            }

            if(user.getMyOrder().getTableOrdered() == null) {
                return Ajax.errorResponse("tableNull");
            }


            orderService.addOrder(user.getMyOrder());

            user.setMyOrder(null);

            return Ajax.emptyResponse();
    }


    @RequestMapping("/orders")
    public String orders(Model model) {
        //model.addAttribute("employees", referenceService.listOfEmployees());
        return null;
    }

}
