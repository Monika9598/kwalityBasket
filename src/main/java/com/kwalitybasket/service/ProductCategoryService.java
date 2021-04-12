package com.kwalitybasket.service;

import com.kwalitybasket.model.ProductCategory;
import com.kwalitybasket.repository.ProductCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ProductCategoryService {

    @Autowired
    ProductCategoryRepository productCategoryRepository;

    private List<ProductCategory> productCategories = new ArrayList<>();

    @PostConstruct
    private void init() {
        productCategories = (List<ProductCategory>) productCategoryRepository.findAll();
    }

    @Cacheable("categories")
    public List<ProductCategory> listAll() {
        return productCategories;
    }
}
