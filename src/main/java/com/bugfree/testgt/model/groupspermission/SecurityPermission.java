package com.bugfree.testgt.model.groupspermission;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="security_permission")
public class SecurityPermission {

	@Id
	@Column(name="permission_id")
	private String permissionId;
	private String description;
	
	@OneToMany(mappedBy="securityPermission")
    private Set<SecurityGroupPermission> securityGroupPermission;
	
	
	public String getPermissionId() {
		return permissionId;
	}
	public void setPermissionId(String permissionId) {
		this.permissionId = permissionId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Set<SecurityGroupPermission> getSecurityGroupPermission() {
		return securityGroupPermission;
	}
	public void setSecurityGroupPermission(
			Set<SecurityGroupPermission> securityGroupPermission) {
		this.securityGroupPermission = securityGroupPermission;
	}
}
