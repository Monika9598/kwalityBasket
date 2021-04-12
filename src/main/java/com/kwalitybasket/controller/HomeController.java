package com.kwalitybasket.controller;

import com.kwalitybasket.model.ProductCategory;
import com.kwalitybasket.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductCategoryService categoryService;

    @RequestMapping(value = {"/", "/home"})
    public String saveAddress(Model model) {
        List<ProductCategory> categories = categoryService.listAll();
        model.addAttribute("categories", categories);
        return "home";
    }
}
