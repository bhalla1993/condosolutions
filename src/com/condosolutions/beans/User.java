package com.condosolutions.beans;

import com.condosolutions.utils.StringUtils;

public class User {
	
	private int ID;
	
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	
	public User(int iD, String username, String password, String firstName, String fullName, String dateOfBirth,
			String sex, String email, String phone, String address, String creationDate, String updationDate,
			String lastName) {
		super();
		ID = iD;
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.fullName = fullName;
		this.dateOfBirth = dateOfBirth;
		this.sex = sex;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.creationDate = creationDate;
		this.updationDate = updationDate;
		this.lastName = lastName;
	}


	private String username;
	private String password;
	private String firstName;
	private String fullName;
	
	private String dateOfBirth;
	
	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	private String sex;
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
	private String email;
	private String phone;
	private String address;
	private String creationDate;
	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getUpdationDate() {
		return updationDate;
	}

	public void setUpdationDate(String updationDate) {
		this.updationDate = updationDate;
	}
	private String updationDate;
	
	public void setFullName(String fullName) {
		this.fullName= fullName;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	private String lastName;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User() {
		
	}
	
	public String getFullName()
	{
		return fullName;
	}

}
