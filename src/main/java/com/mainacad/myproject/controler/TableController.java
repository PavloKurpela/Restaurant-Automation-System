package com.mainacad.myproject.controler;

import com.mainacad.myproject.entities.Order;
import com.mainacad.myproject.entities.User;
import com.mainacad.myproject.services.TablesService;
import com.mainacad.myproject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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


    User user = null;

    @Autowired
    private TablesService tablesService;

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String tables(Model model) {
        model.addAttribute("table", tablesService.listTable());
        System.out.println(tablesService.listTable());
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


        if (user == null) {
            user = userService.initUser();
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
