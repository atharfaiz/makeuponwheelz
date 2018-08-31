package com.bugfree.testgt.model.groupspermission;


import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class UserLoginSecurityGroupEmbed implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String userId;
	private String groupId;
	
	public UserLoginSecurityGroupEmbed(){}
	public UserLoginSecurityGroupEmbed(String user_id,String group_id)
	{
		this.userId=user_id;
		this.groupId=group_id;
	}
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((groupId == null) ? 0 : groupId.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserLoginSecurityGroupEmbed other = (UserLoginSecurityGroupEmbed) obj;
		if (groupId == null) {
			if (other.groupId != null)
				return false;
		} else if (!groupId.equals(other.groupId))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}
	
	
}
