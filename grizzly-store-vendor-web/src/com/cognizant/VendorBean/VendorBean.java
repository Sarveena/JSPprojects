package com.cognizant.VendorBean;

public class VendorBean {
	private int vendor_id;
	public int getVendor_id() {
		return vendor_id;
	}
	public void setVendor_id(int vendor_id) {
		this.vendor_id = vendor_id;
	}
	private String vendor_name;
	private int vendor_rating;
	private int vendor_contact;
	private String vendor_adrs;
	
	public String getVendor_name() {
		return vendor_name;
	}
	public void setVendor_name(String vendor_name) {
		this.vendor_name = vendor_name;
	}
	public int getVendor_rating() {
		return vendor_rating;
	}
	public void setVendor_rating(int vendor_rating) {
		this.vendor_rating = vendor_rating;
	}
	public int getVendor_contact() {
		return vendor_contact;
	}
	public void setVendor_contact(int vendor_contact) {
		this.vendor_contact = vendor_contact;
	}
	public String getVendor_adrs() {
		return vendor_adrs;
	}
	public void setVendor_adrs(String vendor_adrs) {
		this.vendor_adrs = vendor_adrs;
	}
	
}
