package com.spring.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class OrderSize {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String sizeOrder;

//	@OneToOne
//	@JoinColumn(name = "product_id")
//	private Product product;
	
	@OneToOne
	@JoinColumn(name = "orderDetail_id")
	private OrderDetail orderDetail;

	public OrderSize() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSizeOrder() {
		return sizeOrder;
	}

	public void setSizeOrder(String sizeOrder) {
		this.sizeOrder = sizeOrder;
	}

//	public Product getProduct() {
//		return product;
//	}
//
//	public void setProduct(Product product) {
//		this.product = product;
//	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

}
