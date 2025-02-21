package com.sushant.live.model;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name = "customer")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Customer {

    @Id
    private String mobile;  // Assuming mobile is the primary key

    private String name;

    private String bussinessName;

    private String gstNo;

    private String acNo;

    private String ifsc;

    private String bankName;

    private String address;

    @Lob  // To indicate that the picture is a large object (BLOB)
   // @Column(name = "picture", columnDefinition = "MEDIUMBLOB")
    private byte[] picture;
    
    private String password;

    // Default constructor
    public Customer() {}

    // Parameterized constructor
    public Customer(String mobile, String name, String bussinessName, String gstNo,
                    String acNo, String ifsc, String bankName, String address, 
                    byte[] picture, String password) {
        this.mobile = mobile;
        this.name = name;
        this.bussinessName = bussinessName;
        this.gstNo = gstNo;
        this.acNo = acNo;
        this.ifsc = ifsc;
        this.bankName = bankName;
        this.address = address;
        this.picture = picture;
        this.password = password;
    }

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBussinessName() {
		return bussinessName;
	}

	public void setBussinessName(String bussinessName) {
		this.bussinessName = bussinessName;
	}

	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	public String getAcNo() {
		return acNo;
	}

	public void setAcNo(String acNo) {
		this.acNo = acNo;
	}

	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

    
}
