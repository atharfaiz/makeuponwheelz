package com.bugfree.testgt.repository.order;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.bugfree.testgt.model.order.OrderDetails;
import com.bugfree.testgt.model.order.OrderProducts;

public interface OrderProductsRepository extends CrudRepository<OrderProducts, Integer>{

	List<OrderProducts> findByOrderDetails(OrderDetails order);

	
}
