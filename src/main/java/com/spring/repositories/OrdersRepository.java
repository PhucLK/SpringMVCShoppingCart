package com.spring.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.entities.Orders;

@Repository
public interface OrdersRepository extends CrudRepository<Orders, Integer> {

//	public List<Orders> findByDateOrderContaining(String name);
	/////// "SELECT u FROM User u WHERE u.status = ?1 and u.name = ?2"
//	@Query("Select o from Orders o where o.orderDetail.quantity = ?1 and o.total = ?2")
//	public List<Orders> findOrdersJoinOrderDetail(Integer quantity, Double total);

	@Query(value = "SELECT * FROM orders join customer on orders.id = customer.idOrder join orderdetail on orders.id = orderdetail.IdOrder ;", nativeQuery = true)
	public List<Orders> findOrderr();
//
//	@Query("Select o from Orders o where o.dateOrder like ?1 and o.orderDetail.quantity like ?2")
//	public List<Orders> findOrdersByDateOrderJoinQuantity(Date dateOrder, int quantity);
}
