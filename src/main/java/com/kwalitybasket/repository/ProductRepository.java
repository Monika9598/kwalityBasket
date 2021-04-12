package com.kwalitybasket.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.kwalitybasket.model.Product;
import com.kwalitybasket.model.ProductCategory;

public interface ProductRepository extends CrudRepository<Product, Long> {

    @Query(value = "SELECT p FROM Product p WHERE p.productName LIKE '%' || :keyword || '%'"
            + " OR p.description LIKE '%' || :keyword || '%'")
    List<Product> search(@Param("keyword") String keyword);

    List<Product> findByProductCategory(@Param("category") ProductCategory category);
}
