package com.bugfree.testgt.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.bugfree.testgt.model.order.OrderDetails;

@Entity
@Table
public class OnlinePaymentInfo {

	@Id
	@GeneratedValue
	private int OnlinePaymentInfoId;
	
	@JoinColumn(name="order_details_id")
	@OneToOne
	private OrderDetails orderDetails;
	
	private String bankName;
	private String bankTxnId;
	private String currency;
	private String orderId;
	private String gateWayName;
	private String paymentMode;
	private String respCode;
	private String respMsg;
	private String status;
	private float txnAmount;
	private Date txnDate;
	private String txnId;
	private String checkSumHash;
	public int getOnlinePaymentInfoId() {
		return OnlinePaymentInfoId;
	}
	

	@OneToOne
	@JoinColumn(name="user_wallet_recharge_id")
	private UserWalletRecharge userWalletRecharge;
	
	
	public UserWalletRecharge getUserWalletRecharge() {
		return userWalletRecharge;
	}

	public void setUserWalletRecharge(UserWalletRecharge userWalletRecharge) {
		this.userWalletRecharge = userWalletRecharge;
	}

	public void setOnlinePaymentInfoId(int onlinePaymentInfoId) {
		OnlinePaymentInfoId = onlinePaymentInfoId;
	}
	
	public OrderDetails getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(OrderDetails orderDetails) {
		this.orderDetails = orderDetails;
	}

	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankTxnId() {
		return bankTxnId;
	}
	public void setBankTxnId(String bankTxnId) {
		this.bankTxnId = bankTxnId;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getGateWayName() {
		return gateWayName;
	}
	public void setGateWayName(String gateWayName) {
		this.gateWayName = gateWayName;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getRespCode() {
		return respCode;
	}
	public void setRespCode(String respCode) {
		this.respCode = respCode;
	}
	public String getRespMsg() {
		return respMsg;
	}
	public void setRespMsg(String respMsg) {
		this.respMsg = respMsg;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public float getTxnAmount() {
		return txnAmount;
	}
	public void setTxnAmount(float txnAmount) {
		this.txnAmount = txnAmount;
	}
	public Date getTxnDate() {
		return txnDate;
	}
	public void setTxnDate(Date txnDate) {
		this.txnDate = txnDate;
	}
	
	public String getTxnId() {
		return txnId;
	}
	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}
	public String getCheckSumHash() {
		return checkSumHash;
	}
	public void setCheckSumHash(String checkSumHash) {
		this.checkSumHash = checkSumHash;
	}
	
	
	
	
}
