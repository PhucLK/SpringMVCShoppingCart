package com.spring.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.entities.Customer;
import com.spring.entities.Orders;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer> {

	@Query(value = "SELECT * FROM customer;", nativeQuery = true)
	public List<Customer> findListOrder();

	@Query(value = "SELECT * FROM customer join orders on orders.id = customer.idOrder;", nativeQuery = true)
	public List<Customer> findCustomerOrder();
}
