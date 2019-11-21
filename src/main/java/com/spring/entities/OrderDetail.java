package com.spring.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table
public class OrderDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int quantity;

	@ManyToOne
	@JoinColumn(name = "IdOrder")
	private Orders orders;

	@ManyToOne
	@JoinColumn(name = "IdProduct")
	private Product product;
	
	@OneToOne(mappedBy = "orderDetail",cascade = CascadeType.PERSIST)
	private OrderSize orderSize ;

	@Transient
	private String orderSizeTem;
	
	public OrderDetail() {
		super();
	}

	public int getQuantity() {
		return quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public OrderDetail(int quantity) {
		super();
		this.quantity = quantity;
	}

	public double getAmount() {
		return product.getPrice()*quantity;
	}

	public OrderSize getOrderSizes() {
		return orderSize;
	}

	public void setOrderSizes(OrderSize orderSizes) {
		this.orderSize = orderSizes;
	}

	public OrderSize getOrderSize() {
		return orderSize;
	}

	public void setOrderSize(OrderSize orderSize) {
		this.orderSize = orderSize;
	}

	public String getOrderSizeTem() {
		return orderSizeTem;
	}

	public void setOrderSizeTem(String orderSizeTem) {
		this.orderSizeTem = orderSizeTem;
	}
	
	
}
