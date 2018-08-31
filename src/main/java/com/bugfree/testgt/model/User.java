package com.bugfree.testgt.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "user_login")
public class User {

    @Id
    @Column(name="user_id")
    private String userId;
    private String name;
    private String contact;
    private String password;
    private String status;
    private String userProfileImage;
    
    

	private String otp;
    private Date otpExpiryDateTime;
	@Column(length=1200)
	private String salt;
	   
    @Column(name="logged_in",nullable=false, columnDefinition="boolean default false")
    private boolean loggedIn;
    
    private String userType;
    
    @Temporal(TemporalType.DATE)
    private Date firstLoginDate;
    @Column(length=1000)
	private String address;
  
	public boolean isLoggedIn() {
		return loggedIn;
	}

	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	/* @OneToMany(mappedBy="user",cascade=CascadeType.ALL)
    private Set<UserLoginSecurityGroup> userLoginSecurityGroup;
	*/

    public void setPassword(String password) {
        this.password = password;
    }

	 public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getPassword() {
			return password;
		}

		public String getOtp() {
			return otp;
		}

		public void setOtp(String otp) {
			this.otp = otp;
		}

		public Date getOtpExpiryDateTime() {
			return otpExpiryDateTime;
		}

		public void setOtpExpiryDateTime(Date otpExpiryDateTime) {
			this.otpExpiryDateTime = otpExpiryDateTime;
		}

		public String getSalt() {
			return salt;
		}

		public void setSalt(String salt) {
			this.salt = salt;
		}

		public String getUserType() {
			return userType;
		}

		public void setUserType(String userType) {
			this.userType = userType;
		}

		public String getUserProfileImage() {
			return userProfileImage;
		}

		public void setUserProfileImage(String userProfileImage) {
			this.userProfileImage = userProfileImage;
		}

		public Date getFirstLoginDate() {
			return firstLoginDate;
		}

		public void setFirstLoginDate(Date firstLoginDate) {
			this.firstLoginDate = firstLoginDate;
		}

		public String getContact() {
			return contact;
		}

		public void setContact(String contact) {
			this.contact = contact;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		
	
}