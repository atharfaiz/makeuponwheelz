package com.bugfree.testgt.repository;

import java.util.Date;

import org.springframework.data.repository.CrudRepository;

import com.bugfree.testgt.model.User;

public interface UserRepository extends CrudRepository<User, String> {

	User findByUserIdAndOtpAndOtpExpiryDateTimeAfterAndStatus(String userId,
			String otp, Date date,String status);

	User findByUserId(String userId);

	User findByUserIdAndOtpAndOtpExpiryDateTimeAfter(String principal, String oTP, Date date);

	User findByUserIdAndStatus(String usermail, String activeStatus);
    
}
