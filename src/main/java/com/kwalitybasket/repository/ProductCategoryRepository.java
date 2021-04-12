package com.kwalitybasket.repository;

import org.springframework.data.repository.CrudRepository;

import com.kwalitybasket.model.ProductCategory;

public interface ProductCategoryRepository extends CrudRepository<ProductCategory, Long> {

}
