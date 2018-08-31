package com.bugfree.testgt.model.groupspermission;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="security_group")
public class SecurityGroup {

	@Id
	@Column(name="group_id")
	private String groupId;
	private String description;
	
	@OneToMany(mappedBy="securityGroup")
    private Set<SecurityGroupPermission> securityGroupPermission;
	
/*	@OneToMany(mappedBy="securityGroup",cascade=CascadeType.ALL)
    private Set<UserLoginSecurityGroup> userLoginSecurityGroup;
	
	*/
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
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
