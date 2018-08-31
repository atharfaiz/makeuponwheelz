package com.bugfree.testgt.model.groupspermission;

import javax.persistence.*;

@Entity
@Table(name = "security_group_permission")
@IdClass(SecurityGroupPermissionEmbed.class)

public class SecurityGroupPermission {

	public SecurityGroupPermission() {}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(String permissionId) {
		this.permissionId = permissionId;
	}

	public SecurityGroupPermission(SecurityGroupPermissionEmbed securityGroupPermissionEmbed) {
	groupId = securityGroupPermissionEmbed.getGroupId();
	permissionId = securityGroupPermissionEmbed.getPermissionId();
	}

	@Id
	@AttributeOverrides({
	@AttributeOverride(name = "groupId",
	column = @Column(name="group_id")),
	@AttributeOverride(name = "permissionId",
	column = @Column(name="permission_id"))
	})

	@Column(name="group_id",length=20)
	private String groupId;
	@Column(name="permission_id",length=60)
	private String permissionId;

	@ManyToOne
	@MapsId
    @JoinColumn(name="group_id")
    private SecurityGroup securityGroup;
	
	@ManyToOne
	@MapsId
    @JoinColumn(name="permission_id")
    private SecurityPermission securityPermission;

	
	public SecurityGroup getSecurityGroup() {
		return securityGroup;
	}

	public void setSecurityGroup(SecurityGroup securityGroup) {
		this.securityGroup = securityGroup;
	}	
   
	public SecurityPermission getSecurityPermission() {
		return securityPermission;
	}

	public void setSecurityPermission(SecurityPermission securityPermission) {
		this.securityPermission = securityPermission;
	}
	

}
