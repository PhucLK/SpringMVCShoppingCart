package com.spring.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.entities.OrderDetail;

@Repository
public interface OrderDetailRepository extends CrudRepository<OrderDetail, Integer> {

	@Query(value = "SELECT p.id, p.name, p.price, od.id as IdOrderDetail, od.quantity, o.id as IdOrder, o.total, o.dateOrder, c.id as IdCustomer, c.name, c.address, c.phoneNumber"
			+ "FROM orderdetail od" + "INNER JOIN product p ON od.IdProduct = p.id"
			+ "INNER JOIN orders o ON o.id  = od.IdOrder" + "INNER JOIN customer c ON o.id  = c.IdOrder"
			+ "ORDER BY p.name;", nativeQuery = true)
	public List<OrderDetail> getDetailOrders();
	
	@Query(value = "SELECT p.id, p.name, p.price,"
			+ " od.id, od.quantity, o.id, o.total, o.dateOrder,"
			+ " c.id, c.name, c.address, c.phoneNumber"
			+ " FROM orderdetail od "
			+ " INNER JOIN product p ON od.IdProduct = p.id"
			+ " INNER JOIN orders o ON o.id  = od.IdOrder"
			+ " INNER JOIN customer c ON o.id  = c.IdOrder"
			+ " where DATE(o.dateOrder) = '?1'"
			+ " ORDER BY p.name ", nativeQuery = true)
	public List<OrderDetail> getDetailOrdersWithDate(String date);
	
//	@Query(value = "SELECT p.id, p.name, p.price,"
//			+ " od.id as IdOrderDetail, od.quantity, o.id as IdOrder, o.total, o.dateOrder,"
//			+ " c.id as IdCustomer, c.name, c.address, c.phoneNumber"
//			+ " FROM orderdetail od "
//			+ " INNER JOIN product p ON od.IdProduct = p.id"
//			+ " INNER JOIN orders o ON o.id  = od.IdOrder"
//			+ " INNER JOIN customer c ON o.id  = c.IdOrder"
//			+ " where od.IdProduct = p.id and o.id  = od.IdOrder"
//			+ " ORDER BY p.name ", nativeQuery = true)
//	public List<OrderDetail> getDetailOrders();
}
