package com.kwalitybasket.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.kwalitybasket.model.OrderDetail;
import com.kwalitybasket.model.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class Cart {

	private double totalAmount;
	private Integer totalQuantity = 0;

	private List<Long> orderIds;
	private List<Product> products;

	public Cart() {
	}

	public Cart(List<OrderDetail> orderDetails) {
		this.orderIds = new ArrayList<>();
		this.products = orderDetails.stream().map(orderDetail -> {
			this.orderIds.add(orderDetail.getId());
			Product product = orderDetail.getProduct();
			this.totalAmount += orderDetail.getAmount();
			this.totalQuantity += orderDetail.getQuantity();
			return new Product(product.getId(), product.getImage(), orderDetail.getQuantity(), product.getProductName(),
					orderDetail.getAmount());
		}).collect(Collectors.toList());
	}

}
