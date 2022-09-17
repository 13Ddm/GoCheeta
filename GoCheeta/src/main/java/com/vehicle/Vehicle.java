package com.vehicle;

import javax.servlet.http.Part;

public class Vehicle {
	
	private int id;
	private String brand;
	private String model;
	private String type;
	private String color;
	private String regno;
	private String branch;
	private Part image;
	
	public Vehicle(int id, String brand, String model, String type, String color, String regno, String branch,
			Part image) {
		super();
		this.id = id;
		this.brand = brand;
		this.model = model;
		this.type = type;
		this.color = color;
		this.regno = regno;
		this.branch = branch;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getRegno() {
		return regno;
	}

	public void setRegno(String regno) {
		this.regno = regno;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public Part getImage() {
		return image;
	}

	public void setImage(Part image) {
		this.image = image;
	}
	
	
	
}
