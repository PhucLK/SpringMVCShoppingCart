package com.spring.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table
public class Orders implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Temporal(TemporalType.DATE)
	private Date dateOrder;

	private double total;

	@OneToMany(mappedBy = "orders", fetch = FetchType.LAZY)
	private List<OrderDetail> orderDetail;

	@OneToOne(mappedBy = "orders", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Customer customer;

	public Orders() {
		super();
	}

	public Date getDateOrder() {
		return dateOrder;
	}

	public void setDateOrder(Date dateOrder) {
		this.dateOrder = dateOrder;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public List<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Orders(Date dateOrder, double total) {
		super();
		this.dateOrder = dateOrder;
		this.total = total;
	}

	@Override
	public String toString() {
		return "Orders [dateOrder=" + dateOrder + ", total=" + total + "]";
	}

	public double getTotalProduct() {
		double s = 0;
		for (OrderDetail o : orderDetail) {
			s = s + o.getProduct().getPrice() * o.getQuantity();
		}
		return s;
	}

}
