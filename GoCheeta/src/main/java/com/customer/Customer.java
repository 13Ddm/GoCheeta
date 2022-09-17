package com.customer;

public class Customer {
	
	private int id; 
	private String fname;
	private String lname;
	private String contactno;
	private String email;
	private String password;
	private String image;
	
	public Customer(int id, String fname, String lname, String contactno, String email, String password, String image) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.contactno = contactno;
		this.email = email;
		this.password = password;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getContactno() {
		return contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	

}
