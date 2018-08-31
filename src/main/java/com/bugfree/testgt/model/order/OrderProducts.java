package com.bugfree.testgt.model.order;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.bugfree.testgt.model.product.PackageDetails;
import com.bugfree.testgt.model.product.Product;

@Entity
public class OrderProducts {

	
	@Id
	@GeneratedValue
	private int orderProductId;
	
	@ManyToOne
	@JoinColumn(name="order_detail_id")
	private OrderDetails orderDetails;
	
	
	@ManyToOne
	@JoinColumn(name="product_id")
	private Product product;
	private int qty;
	@ManyToOne
	@JoinColumn(name="package_detail_id")
	private PackageDetails packageDetails;
	
	private float mrp;
	private float sellingPrice;
	private float discount;
	private float gstTaxPercent;
	private float gstTaxAmount;
	
	private boolean packge;
	
	public int getOrderProductId() {
		return orderProductId;
	}
	public void setOrderProductId(int orderProductId) {
		this.orderProductId = orderProductId;
	}
	public OrderDetails getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(OrderDetails orderDetails) {
		this.orderDetails = orderDetails;
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
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	
	public float getGstTaxPercent() {
		return gstTaxPercent;
	}
	public void setGstTaxPercent(float gstTaxPercent) {
		this.gstTaxPercent = gstTaxPercent;
	}
	public float getGstTaxAmount() {
		return gstTaxAmount;
	}
	public void setGstTaxAmount(float gstTaxAmount) {
		this.gstTaxAmount = gstTaxAmount;
	}
	public boolean isPackge() {
		return packge;
	}
	public void setPackge(boolean packge) {
		this.packge = packge;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
}
