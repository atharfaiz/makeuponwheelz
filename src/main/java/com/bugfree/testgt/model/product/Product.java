package com.bugfree.testgt.model.product;

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

@Entity
public class Product {

	@Id
	@GeneratedValue
	private long productId;
	
	private String productName;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	@ManyToOne
	@JoinColumn(name="sub_category_id")
	private SubCategory subCategory;
	
	private float mrp;
	private float bookingPercentage;
	
	private float sellingPrice;
	private boolean discountIsInPercent;
	private float discount;
	private float gstTax;
	private String productNameAlias;
	private String imageUrl;
	@Column(length=2400)
	private String description;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

	@PrePersist
	private void obcreate(){
		this.createdDate = KrenaiCONSTANTS.getCurrentDate();
	}
	
	
	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public SubCategory getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(SubCategory subCategory) {
		this.subCategory = subCategory;
	}
	public float getMrp() {
		return mrp;
	}
	public void setMrp(float mrp) {
		this.mrp = mrp;
	}
	public float getSellingPrice() {
		return sellingPrice;
	}
	public void setSellingPrice(float sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	public boolean isDiscountIsInPercent() {
		return discountIsInPercent;
	}
	public void setDiscountIsInPercent(boolean discountIsInPercent) {
		this.discountIsInPercent = discountIsInPercent;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getGstTax() {
		return gstTax;
	}
	public void setGstTax(float gstTax) {
		this.gstTax = gstTax;
	}
	public String getProductNameAlias() {
		return productNameAlias;
	}
	public void setProductNameAlias(String productNameAlias) {
		this.productNameAlias = productNameAlias;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public float getBookingPercentage() {
		return bookingPercentage;
	}


	public void setBookingPercentage(float bookingPercentage) {
		this.bookingPercentage = bookingPercentage;
	}
	
	
	
	
}
