package com.kwalitybasket.controller;

import com.kwalitybasket.model.Order;
import com.kwalitybasket.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AdminController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = {"/dashboard"})
    public String saveAddress(Model model) {
        return "dashboard";
    }

    @RequestMapping(value = {"/orders"})
    public String getOrdersByStatus(Model model, @RequestParam String status) {
        List<Order> orders = orderService.listAllOrders()
                .stream()
                .filter(order -> StringUtils.isEmpty(status) || order.getStatus().equals(status))
                .collect(Collectors.toList());
        model.addAttribute("orders", orders);
        return "dashboard";
    }
}
