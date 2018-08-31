package com.bugfree.testgt.model.user;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import org.hibernate.annotations.Type;

import com.bugfree.testgt.commons.EmployRollCommon;
import com.bugfree.testgt.model.User;

@Entity
public class UserLoginSession {

	@Id
	private String sessionId;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@Type(type="timestamp")
	private Date loginTimestamp;
	
	@Type(type="timestamp")
	private Date logoutTimestamp;
	
	private String otp;
	
	@Type(type="timestamp")
	private Date otpExpiry;

	private String status;
	
	
	@Column(length=512)
	private String deviceToken;

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Date getLoginTimestamp() {
		return loginTimestamp;
	}

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setLoginTimestamp(Date loginTimestamp) {
		this.loginTimestamp = loginTimestamp;
	}

	public Date getLogoutTimestamp() {
		return logoutTimestamp;
	}

	public void setLogoutTimestamp(Date logoutTimestamp) {
		this.logoutTimestamp = logoutTimestamp;
	}

	
	@PrePersist
	private void onCreate(){
		this.loginTimestamp = EmployRollCommon.getCurrentDate();
	}

	public String getDeviceToken() {
		return deviceToken;
	}

	public void setDeviceToken(String deviceToken) {
		this.deviceToken = deviceToken;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public Date getOtpExpiry() {
		return otpExpiry;
	}

	public void setOtpExpiry(Date otpExpiry) {
		this.otpExpiry = otpExpiry;
	}

	
}
