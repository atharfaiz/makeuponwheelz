package com.bugfree.testgt.model.order;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.bugfree.testgt.commons.KrenaiCONSTANTS;
import com.bugfree.testgt.model.User;

@Entity
public class OrderDetails {

	@Id
	@GeneratedValue
	private long orderDetailsId;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="invoice_id")
	private InvoiceSeries invoiceSeries;
	
	private String alternateNo;
	private String address;
	private Date createdDate;
	private String orderStatus;
	private String paymentStatus;
	
	private String serviceTakenBy;
	
	@Temporal(TemporalType.TIME)
	private Date scheduledTime;
	
	private int familyMember;
	
	@Column(length=1500)
	private String personalMessage;

	private float amountWithoutTax;
	private float taxPercentage;
	private float taxableAmount;
	private float totalDiscount;
	private float totalDiscountPercentage;
	private float totalAmount;
	
	private String invoiceNo;
	@Temporal(TemporalType.DATE)
	private Date scheduleDate;
	
	
	@PrePersist
	private void onCreate(){
		this.createdDate = KrenaiCONSTANTS.getCurrentDate();
	}


	public long getOrderDetailsId() {
		return orderDetailsId;
	}


	public void setOrderDetailsId(long orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public InvoiceSeries getInvoiceSeries() {
		return invoiceSeries;
	}


	public void setInvoiceSeries(InvoiceSeries invoiceSeries) {
		this.invoiceSeries = invoiceSeries;
	}


	public String getAlternateNo() {
		return alternateNo;
	}


	public void setAlternateNo(String alternateNo) {
		this.alternateNo = alternateNo;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


	public String getPaymentStatus() {
		return paymentStatus;
	}


	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}


	public String getServiceTakenBy() {
		return serviceTakenBy;
	}


	public void setServiceTakenBy(String serviceTakenBy) {
		this.serviceTakenBy = serviceTakenBy;
	}


	public Date getScheduledTime() {
		return scheduledTime;
	}


	public void setScheduledTime(Date scheduledTime) {
		this.scheduledTime = scheduledTime;
	}


	public int getFamilyMember() {
		return familyMember;
	}


	public void setFamilyMember(int familyMember) {
		this.familyMember = familyMember;
	}


	public String getPersonalMessage() {
		return personalMessage;
	}


	public void setPersonalMessage(String personalMessage) {
		this.personalMessage = personalMessage;
	}


	public float getAmountWithoutTax() {
		return amountWithoutTax;
	}


	public void setAmountWithoutTax(float amountWithoutTax) {
		this.amountWithoutTax = amountWithoutTax;
	}


	public float getTaxPercentage() {
		return taxPercentage;
	}


	public void setTaxPercentage(float taxPercentage) {
		this.taxPercentage = taxPercentage;
	}


	public float getTaxableAmount() {
		return taxableAmount;
	}


	public void setTaxableAmount(float taxableAmount) {
		this.taxableAmount = taxableAmount;
	}


	public float getTotalDiscount() {
		return totalDiscount;
	}


	public void setTotalDiscount(float totalDiscount) {
		this.totalDiscount = totalDiscount;
	}


	public float getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}


	public String getInvoiceNo() {
		return invoiceNo;
	}


	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}


	public Date getScheduleDate() {
		return scheduleDate;
	}


	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}


	public float getTotalDiscountPercentage() {
		return totalDiscountPercentage;
	}


	public void setTotalDiscountPercentage(float totalDiscountPercentage) {
		this.totalDiscountPercentage = totalDiscountPercentage;
	}
	
	
}
