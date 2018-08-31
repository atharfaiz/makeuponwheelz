package com.bugfree.testgt.model.profile;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class StoreInfo {

	@Id
	@GeneratedValue
	private int storeInfoId;
	
	@Column(length=5000)
	private String aboutUs;
	
	@Column(length=2000)
	private String address;
	
	private String storeContact;
	private String alternateContact;
	private String emailId;
	
	private String homeBanner1;
	private String homeBanner2;
	private String homeBanner3;
	public int getStoreInfoId() {
		return storeInfoId;
	}
	public void setStoreInfoId(int storeInfoId) {
		this.storeInfoId = storeInfoId;
	}
	public String getAboutUs() {
		return aboutUs;
	}
	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStoreContact() {
		return storeContact;
	}
	public void setStoreContact(String storeContact) {
		this.storeContact = storeContact;
	}
	public String getAlternateContact() {
		return alternateContact;
	}
	public void setAlternateContact(String alternateContact) {
		this.alternateContact = alternateContact;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getHomeBanner1() {
		return homeBanner1;
	}
	public void setHomeBanner1(String homeBanner1) {
		this.homeBanner1 = homeBanner1;
	}
	public String getHomeBanner2() {
		return homeBanner2;
	}
	public void setHomeBanner2(String homeBanner2) {
		this.homeBanner2 = homeBanner2;
	}
	public String getHomeBanner3() {
		return homeBanner3;
	}
	public void setHomeBanner3(String homeBanner3) {
		this.homeBanner3 = homeBanner3;
	}
	
	
}
