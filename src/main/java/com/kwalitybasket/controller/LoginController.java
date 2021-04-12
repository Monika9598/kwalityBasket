package com.kwalitybasket.controller;

import com.kwalitybasket.model.ProductCategory;
import com.kwalitybasket.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;
import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private ProductCategoryService categoryService;

    @RequestMapping(value = "/login")
    public String login(Model model) {
        List<ProductCategory> categories = categoryService.listAll();
        model.addAttribute("categories", categories);
        return "login";
    }

    @RequestMapping(value = "/signup")
    public String signup(Model model) {
        List<ProductCategory> categories = categoryService.listAll();
        model.addAttribute("categories", categories);
        return "signup";
    }

    @RequestMapping(value = "/reset")
    public String passwordReset(Model model) {
        List<ProductCategory> categories = categoryService.listAll();
        model.addAttribute("categories", categories);
        return "signup";
    }
}
