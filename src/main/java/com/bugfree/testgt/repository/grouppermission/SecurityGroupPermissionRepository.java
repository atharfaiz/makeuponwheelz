package com.bugfree.testgt.repository.grouppermission;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.bugfree.testgt.model.groupspermission.SecurityGroup;
import com.bugfree.testgt.model.groupspermission.SecurityGroupPermission;
import com.bugfree.testgt.model.groupspermission.SecurityPermission;

public interface SecurityGroupPermissionRepository extends CrudRepository<SecurityGroupPermission, String> {
   List<SecurityGroupPermission> findBySecurityGroup(SecurityGroup securityGroup);

   List<SecurityGroupPermission> findByGroupId(String groupId);

SecurityGroupPermission findBySecurityPermissionNotIn(SecurityPermission sp, List<SecurityGroupPermission> sgp_ro);

List<SecurityGroupPermission> findBySecurityGroupIn(List<SecurityGroup> securityGrpList);

}