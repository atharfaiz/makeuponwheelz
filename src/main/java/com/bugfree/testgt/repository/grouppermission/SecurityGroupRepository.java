package com.bugfree.testgt.repository.grouppermission;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.bugfree.testgt.model.groupspermission.SecurityGroup;
import com.bugfree.testgt.model.groupspermission.SecurityGroupPermission;

public interface SecurityGroupRepository extends CrudRepository<SecurityGroup, String> {


	List<SecurityGroup> findByGroupIdNotIn(List<String> ignoreGroupsList);

	List<SecurityGroup> findByGroupIdIn(List<SecurityGroupPermission> permList);
}