package com.bugfree.testgt.model.product;

import java.util.Date;

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
public class SubCategory {

	@Id
	@GeneratedValue
	private int subCategoryId;
	private String subCategoryName;
	private String subCategoryAlias;
	private String imageUrl;
	private String status;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

	@PrePersist
	private void obcreate(){
		this.createdDate = KrenaiCONSTANTS.getCurrentDate();
	}
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public int getSubCategoryId() {
		return subCategoryId;
	}
	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	public String getSubCategoryName() {
		return subCategoryName;
	}
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
	public String getSubCategoryAlias() {
		return subCategoryAlias;
	}
	public void setSubCategoryAlias(String subCategoryAlias) {
		this.subCategoryAlias = subCategoryAlias;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
