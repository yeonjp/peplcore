package com.peplcore.blogic.member;

import java.util.Date;

public class MemberDTO {

	//field
	private String id;
	private String password;
	private String name;
	private String phone;
	private String address;
	private String zipCode;
	private String gender;
	private String ssn;
	private String role;
	private String grade;
	private String email;
	private Date date;
	private String newsAgency;
	private String countrySelect;
	
	//getter / setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getNewsAgency() {
		return newsAgency;
	}
	public void setNewsAgency(String newsAgency) {
		this.newsAgency = newsAgency;
	}
	public String getCountrySelect() {
		return countrySelect;
	}
	public void setCountrySelect(String countrySelect) {
		this.countrySelect = countrySelect;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	
	
	
}//end of class
