package com.admin;

public class Admin {

	private int id;
	private String fname;
	private String lname;
	private String contact;
	private String email;
	private String password;
	private String image;
	
	public Admin() {
		super();
	}

	public Admin(int id, String fname, String lname, String contact, String email, String password, String image) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.contact = contact;
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

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
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
