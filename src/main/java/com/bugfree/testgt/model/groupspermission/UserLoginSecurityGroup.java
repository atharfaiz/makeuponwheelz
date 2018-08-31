package com.bugfree.testgt.model.groupspermission;


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.bugfree.testgt.model.User;
import com.bugfree.testgt.model.groupspermission.SecurityGroup;

@Entity
@Table(name = "user_login_security_group")
@IdClass(UserLoginSecurityGroupEmbed.class)

public class UserLoginSecurityGroup {
	
	/**
	 * 
	 */
	
	public UserLoginSecurityGroup()
	{
		
	}
	public UserLoginSecurityGroup(UserLoginSecurityGroupEmbed userLoginSecurityGroupEmbed)
	{
		userId = userLoginSecurityGroupEmbed.getUserId();
		groupId = userLoginSecurityGroupEmbed.getGroupId();
		
	}
	
	
	@Id
	@AttributeOverrides({
	@AttributeOverride(name = "groupId",
	column = @Column(name="group_id")),
	@AttributeOverride(name = "userId",
	column = @Column(name="user_id"))
	})
	
	@Column(name="user_id")
	private String userId;
	@Column(name="group_id")
	private String groupId;
	
	@ManyToOne
	@MapsId
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@MapsId
	@JoinColumn(name="group_id")
    private SecurityGroup securityGroup;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public SecurityGroup getSecurityGroup() {
		return securityGroup;
	}
	public void setSecurityGroup(SecurityGroup securityGroup) {
		this.securityGroup = securityGroup;
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
		
}
