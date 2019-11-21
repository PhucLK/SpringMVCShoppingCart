package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.OrderDetail;
import com.spring.repositories.OrderDetailRepository;

@Service
public class OrderDetailService {

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	public OrderDetail save(OrderDetail od) {

		return orderDetailRepository.save(od);
	}

	public OrderDetail findOrderDetail(int id) {
		return orderDetailRepository.findOne(id);
	}

	public List<OrderDetail> getListOrder() {
		return orderDetailRepository.getDetailOrders();
	}

	public List<OrderDetail> getListOrderWithDate(String date) {
		return orderDetailRepository.getDetailOrdersWithDate(date);
	}
}
