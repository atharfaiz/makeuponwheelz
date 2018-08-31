package com.bugfree.testgt.repository.grouppermission;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.User;
import com.bugfree.testgt.model.groupspermission.UserLoginSecurityGroup;

public interface UserLoginSecurityGroupRepository extends PagingAndSortingRepository<UserLoginSecurityGroup, String> {

	public	List<UserLoginSecurityGroup> findByUser(User user);
	
	public List<UserLoginSecurityGroup> findByUserId(String userId);
	
	public UserLoginSecurityGroup findByUserIdAndGroupId(String userId,String groupId);
	
	public List<UserLoginSecurityGroup> findByGroupId(String groupId);
	
	public List<UserLoginSecurityGroup> findByUserIdAndGroupIdIn(String emailId, List<String> perms);

	public List<UserLoginSecurityGroup> findByGroupIdIn(List<String> perms);

	@Query(value="select uls.group_id, sgp.permission_id from user_login_security_group uls left join security_group_permission sgp on uls.group_id=sgp.group_id where uls.user_id=?;", nativeQuery=true)
	public List<Object> getROPermissionList(String string);

	/*public List<UserLoginSecurityGroup> findByPermissionIdIn(List<String> perms);
*/
}