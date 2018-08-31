package com.bugfree.testgt.model.product;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.bugfree.testgt.commons.KrenaiCONSTANTS;

@Entity(name="category")
public class Category {

	@GeneratedValue
	@Id
	private int categoryId;
	
	private String categoryName;
	private String categoryAlias;
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;
	private String status;

	@PrePersist
	private void obcreate(){
		this.createdDate = KrenaiCONSTANTS.getCurrentDate();
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryAlias() {
		return categoryAlias;
	}
	public void setCategoryAlias(String categoryAlias) {
		this.categoryAlias = categoryAlias;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
