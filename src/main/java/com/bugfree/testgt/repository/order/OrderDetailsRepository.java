package com.bugfree.testgt.repository.order;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.bugfree.testgt.model.User;
import com.bugfree.testgt.model.order.OrderDetails;

public interface OrderDetailsRepository extends CrudRepository<OrderDetails, Long>{

	List<OrderDetails> findByScheduleDate(Date selectedDate);

	List<OrderDetails> findByScheduleDateAndUser(Date selectedDate, User user);

	List<OrderDetails> findByUser(User user);

}
