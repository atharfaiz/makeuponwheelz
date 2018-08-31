package com.bugfree.testgt.repository.grouppermission;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.bugfree.testgt.model.groupspermission.SecurityPermission;

public interface SecurityPermissionRepository extends PagingAndSortingRepository<SecurityPermission, String> {

	SecurityPermission findByPermissionId(String perm);
   
}