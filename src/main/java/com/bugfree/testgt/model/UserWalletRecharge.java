package com.bugfree.testgt.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;


@Entity
@Table(name="user_wallet_recharge")
public class UserWalletRecharge {

	@Id
	@GeneratedValue
	private long userWalletRechargeId;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	
	/*
	 * unpaid when transaction is unpaid and
	 * paid when it is paid
	 */
	private String rechargeStatus;
	
	@OneToOne(mappedBy = "userWalletRecharge")
	 private OnlinePaymentInfo onlinePaymentInfo;
	 
	private float amount;

	@Type(type="date")
	private Date createdDate;
	
	
	public long getUserWalletRechargeId() {
		return userWalletRechargeId;
	}
	public void setUserWalletRechargeId(long userWalletRechargeId) {
		this.userWalletRechargeId = userWalletRechargeId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	public String getRechargeStatus() {
		return rechargeStatus;
	}
	public void setRechargeStatus(String rechargeStatus) {
		this.rechargeStatus = rechargeStatus;
	}
	public OnlinePaymentInfo getOnlinePaymentInfo() {
		return onlinePaymentInfo;
	}
	public void setOnlinePaymentInfo(OnlinePaymentInfo onlinePaymentInfo) {
		this.onlinePaymentInfo = onlinePaymentInfo;
	}
	
	
	
	
	
}
