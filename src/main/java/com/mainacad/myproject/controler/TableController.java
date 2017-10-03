package com.mainacad.myproject.controler;

import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.services.SecurityService;
import com.mainacad.myproject.services.TablesService;
import com.mainacad.myproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/tables")
public class TableController {

    @Autowired
    private TablesService tablesService;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;


    @RequestMapping("")
    public String tables(Model model) {
        model.addAttribute("table", tablesService.listTable());
        System.out.println(tablesService.listTable());

        System.out.println("Я: " + userService.getActiveUser());
        System.out.println("Усі активні користувачі: " + userService.getAllActiveUsers());
        System.out.println("Кількість активних: " + userService.getCountActiveUsers());

//        System.out.println(securityService.findLoggedInUsername());
//        System.out.println(userService.initUser());
//       UserDetails userDetails =  (UserDetails) SecurityContextHolder.getContext().
//                getAuthentication().getPrincipal();
//        System.out.println(userDetails);
////        System.out.println(userDetails.getPassword());
////        System.out.println(userDetails.getUsername());
////        System.out.println(userDetails.getAuthorities().toString());

        return "tables";
    }


    @RequestMapping(value = "/add-table", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> tableAdd(@RequestParam("tableId") int tableId) {
        if (tableId == 0) {
            return Ajax.emptyResponse();
        }
        //dataService.persist(data);
        System.out.println("tableId = " + tableId);
        System.out.println(tablesService.getTable(tableId));


        //System.out.println(user.getMyOrder());


        User user = userService.getActiveUser();

        if (user == null) {
            return Ajax.emptyResponse();
        }
        if (user.getMyOrder() == null) {
            user.setMyOrder(new Order());
            //user.getMyOrder().setCustomer(user);
        }

        System.out.println(user.getMyOrder());

        tablesService.addTable(tableId, user.getMyOrder());

        System.out.println(user.getMyOrder());
        return Ajax.emptyResponse();

    }

}
