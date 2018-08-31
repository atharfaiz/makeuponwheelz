package com.bugfree.testgt.model.groupspermission;

import javax.persistence.*;
import java.io.Serializable;

@Embeddable
public class SecurityGroupPermissionEmbed implements Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String groupId;
    private String permissionId;
	
	
	public SecurityGroupPermissionEmbed() {
		
	}
	public SecurityGroupPermissionEmbed(String groupId,String permissionId) {
		this.groupId=groupId;
		this.permissionId=permissionId;
	}
	
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
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((groupId == null) ? 0 : groupId.hashCode());
		result = prime * result + ((permissionId == null) ? 0 : permissionId.hashCode());
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
		SecurityGroupPermissionEmbed other = (SecurityGroupPermissionEmbed) obj;
		if (groupId == null) {
			if (other.groupId != null)
				return false;
		} else if (!groupId.equals(other.groupId))
			return false;
		if (permissionId == null) {
			if (other.permissionId != null)
				return false;
		} else if (!permissionId.equals(other.permissionId))
			return false;
		return true;
	}
	
	
	
}
