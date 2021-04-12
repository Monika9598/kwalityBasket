package com.kwalitybasket.service;

import com.kwalitybasket.model.Product;
import com.kwalitybasket.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Transactional
public class ProductService {

    private Map<Long, Product> productsMap = new HashMap<>();
    private Map<Long, List<Product>> productsCategoryMap = new HashMap<>();

    @Autowired
    ProductRepository productRepository;

    @PostConstruct
    private void init() {
        productsMap = listAllProductsMap();
        productsCategoryMap = listAllProductsByCategory();
    }

    @Cacheable("productsMap")
    public Map<Long, Product> listAllProductsMap() {
        List<Product> products = (List<Product>) productRepository.findAll();
        return products.stream()
                .collect(Collectors.toMap(Product::getId, product -> product));
    }

    @Cacheable("productsCategoryMap")
    public Map<Long, List<Product>> listAllProductsByCategory() {
        return productsMap.values()
                .stream()
                .collect(Collectors.groupingBy(product -> product.getProductCategory().getId()));
    }

    public List<Product> listAllProducts() {
        return productsMap.values().stream().collect(Collectors.toList());
    }

    public List<Product> fetchProductsByCategory(Long categoryId) {
        return productsCategoryMap.get(categoryId);
    }

    public List<Product> search(String keyword) {
        return productRepository.search(keyword);
    }

    public Product fetchProductById(Long productId) {
        return productsMap.get(productId);
    }
}
