package com.kwalitybasket.controller;

import com.kwalitybasket.dto.Cart;
import com.kwalitybasket.dto.OrderDto;
import com.kwalitybasket.model.Address;
import com.kwalitybasket.model.Order;
import com.kwalitybasket.model.ProductCategory;
import com.kwalitybasket.model.User;
import com.kwalitybasket.service.AddressService;
import com.kwalitybasket.service.OrderService;
import com.kwalitybasket.service.ProductCategoryService;
import com.kwalitybasket.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.InvalidObjectException;
import java.security.Principal;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AddressService addressService;

    @Autowired
    private ProductCategoryService categoryService;

    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    @ResponseBody
    public String addToCart(Model model, @RequestParam Integer quantity, @RequestParam Long productId, Principal principal) {
        User user = getUser(principal);
        List<ProductCategory> categories = categoryService.listAll();
        model.addAttribute("categories", categories);
        return orderService.addToCart(user, productId, quantity);
    }

    @RequestMapping(value = "/userCart", method = RequestMethod.GET)
    @ResponseBody
    public String findUserCart(Model model, Principal principal) {
        User user = getUser(principal);
        if (user == null) {
            return "";
        }
        List<ProductCategory> categories = categoryService.listAll();
        model.addAttribute("categories", categories);
        Cart userCart = orderService.findUserCart(user);
        return userCart.getTotalQuantity() == null ? "" : userCart.getTotalQuantity().toString();
    }


    @RequestMapping("/cart")
    public String fetchUserCart(Model model, Principal principal) {
        User user = getUser(principal);
        com.kwalitybasket.dto.Cart cart = orderService.findUserCart(user);
        List<ProductCategory> categories = categoryService.listAll();
        model.addAttribute("cart", cart);
        model.addAttribute("categories", categories);
        return "cart";
    }

    @RequestMapping("/checkout")
    public String checkOut(Model model, Principal principal) {
        User user = getUser(principal);
        List<Address> addresses = addressService.listUserAddress(user);
        Cart cart = orderService.findUserCart(user);
        if (cart.getProducts().isEmpty()) {
            return "redirect:/products?categoryId=";
        }
        List<ProductCategory> categories = categoryService.listAll();
        model.addAttribute("cart", cart);
        model.addAttribute("categories", categories);
        model.addAttribute("addressList", addresses);
        return "checkout";
    }

    @RequestMapping(value = "/complete/order", method = RequestMethod.POST)
    public String completeOrder(Model model, @ModelAttribute("orderDto") OrderDto orderDto, Principal principal)
            throws InvalidObjectException {
        User user = getUser(principal);
        Order order = orderService.completeOrder(user, orderDto);
        if (order.getOrderDetails().isEmpty()) {
            return "redirect:/products?categoryId=";
        }
        List<ProductCategory> categories = categoryService.listAll();
        model.addAttribute("order", order);
        model.addAttribute("categories", categories);
        model.addAttribute("address", order.getAddress());
        model.addAttribute("orderDetails", new Cart(order.getOrderDetails()));
        return "order_summary";
    }

    private User getUser(Principal principal) {
        try {
            return userService.fetchUser(principal.getName());
        } catch (InvalidObjectException e) {
            e.printStackTrace();
        }
        return null;
    }
}
