package com.kwalitybasket.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@Entity
@ToString
@Table(name = "PRODUCT", schema = "kwalitybasket")
public class Product extends PersistedObject {

	@Column(name = "PRODUCT_NAME", nullable = false)
	private String productName;
	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "PRODUCT_CATEGORY_ID", nullable = false)
	private ProductCategory productCategory;
	private double price;
	private int quantity;
	private String size;
	private String description;
	private String image;
	private String status;

	public Product() {
	}

	public Product(Long id, String image, int quantity, String productName, double amount) {
		this.setId(id);
		this.image = image;
		this.price = amount;
		this.quantity = quantity;
		this.productName = productName;
	}
}
