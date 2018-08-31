package com.bugfree.testgt.repository.user;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.User;
import com.bugfree.testgt.model.user.UserLoginSession;

public interface UserLoginSessionRepository extends PagingAndSortingRepository<UserLoginSession, String> {

	UserLoginSession findBySessionIdAndStatus(String sessionId, String restACTIVE_status);

	List<UserLoginSession> findByUserAndStatus(User userParent, String status);

	List<UserLoginSession> findByUser(User user);

	

}
