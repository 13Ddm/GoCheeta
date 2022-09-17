package com.driver;

public class Driver {
	
	private int id;
	private String fname;
	private String lname;
	private String contact;
	private String email;
	private String branch;
	private String image;
	private String password;
	private String bike;
	private String tuk;
	private String car;
	private String cab;
	private String jeep;
	
	public Driver(int id, String fname, String lname, String contact, String email, String branch, String image,
			String password, String bike, String tuk, String car, String cab, String jeep) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.contact = contact;
		this.email = email;
		this.branch = branch;
		this.image = image;
		this.password = password;
		this.bike = bike;
		this.tuk = tuk;
		this.car = car;
		this.cab = cab;
		this.jeep = jeep;
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

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBike() {
		return bike;
	}

	public void setBike(String bike) {
		this.bike = bike;
	}

	public String getTuk() {
		return tuk;
	}

	public void setTuk(String tuk) {
		this.tuk = tuk;
	}

	public String getCar() {
		return car;
	}

	public void setCar(String car) {
		this.car = car;
	}

	public String getCab() {
		return cab;
	}

	public void setCab(String cab) {
		this.cab = cab;
	}

	public String getJeep() {
		return jeep;
	}

	public void setJeep(String jeep) {
		this.jeep = jeep;
	}
}
