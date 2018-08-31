package com.bugfree.testgt.repository.user;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.UserWalletRecharge;

public interface UserWalletRechargeRepository extends PagingAndSortingRepository<UserWalletRecharge, Long> {

	
	List<com.bugfree.testgt.model.UserWalletRecharge> findByUserAndRechargeStatus(com.bugfree.testgt.model.User user, String status);

}
