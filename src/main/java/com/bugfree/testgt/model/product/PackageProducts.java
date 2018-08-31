package com.bugfree.testgt.model.product;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PackageProducts {

	@Id
	@GeneratedValue
	private long packageProductId;
	
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;
	@ManyToOne
	@JoinColumn(name="package_details_id")
	private PackageDetails packageDetails;
	public long getPackageProductId() {
		return packageProductId;
	}
	public void setPackageProductId(long packageProductId) {
		this.packageProductId = packageProductId;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public PackageDetails getPackageDetails() {
		return packageDetails;
	}
	public void setPackageDetails(PackageDetails packageDetails) {
		this.packageDetails = packageDetails;
	}
	
	

}
