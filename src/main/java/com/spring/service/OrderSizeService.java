package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.OrderSize;
import com.spring.repositories.OrderSizeRepository;

@Service
public class OrderSizeService {

	@Autowired
	OrderSizeRepository orderSizeRepository;
	
	public OrderSize save(OrderSize o) {
		return orderSizeRepository.save(o);
	}
}
