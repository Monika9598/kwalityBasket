package com.kwalitybasket.controller;

import com.kwalitybasket.model.Product;
import com.kwalitybasket.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private com.kwalitybasket.service.ProductCategoryService categoryService;

    @RequestMapping("/products")
    public String productList(Model model, @RequestParam Long categoryId) {
        String category = "";
        List<Product> listProduct;
        if (StringUtils.isEmpty(categoryId)) {
            category = "All";
            listProduct = productService.listAllProducts().stream().limit(100).collect(Collectors.toList());
        } else {
            listProduct = productService.fetchProductsByCategory(categoryId);
            category = listProduct.get(0).getProductCategory().getCategoryName();
        }
        List<com.kwalitybasket.model.ProductCategory> categories = categoryService.listAll();
        model.addAttribute("category", category);
        model.addAttribute("categories", categories);
        model.addAttribute("categories", categories);
        model.addAttribute("listProduct", listProduct);
        return "products";
    }

    @RequestMapping("/search")
    public String search(Model model, @RequestParam String keyword) {
        List<Product> listProduct = productService.search(keyword);
        List<com.kwalitybasket.model.ProductCategory> categories = categoryService.listAll();
        model.addAttribute("categories", categories);
        if (listProduct.isEmpty())
            model.addAttribute("message", "No products found");
        model.addAttribute("keyword", keyword);
        model.addAttribute("listProduct", listProduct);
        return "products";
    }
}
