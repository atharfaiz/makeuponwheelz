package com.bugfree.testgt.model.product;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PackageDetails {

	@Id
	@GeneratedValue
	private int packageDetailsId;
	
	private String packageName;
	private float amount;
	private float mrp;
	private float tax;
	
	@Column(length=2400)
	private String description;
	
	private String imagePath;
	private float bookingPercentage;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	private boolean featured;
	
	private String status;
	@ManyToOne
	@JoinColumn(name="sub_category_id")
	private SubCategory subCategory;

	public int getPackageDetailsId() {
		return packageDetailsId;
	}

	public void setPackageDetailsId(int packageDetailsId) {
		this.packageDetailsId = packageDetailsId;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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

	public boolean isFeatured() {
		return featured;
	}

	public void setFeatured(boolean featured) {
		this.featured = featured;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public float getTax() {
		return tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	public float getMrp() {
		return mrp;
	}

	public void setMrp(float mrp) {
		this.mrp = mrp;
	}

	public float getBookingPercentage() {
		return bookingPercentage;
	}

	public void setBookingPercentage(float bookingPercentage) {
		this.bookingPercentage = bookingPercentage;
	}
	
	
}
