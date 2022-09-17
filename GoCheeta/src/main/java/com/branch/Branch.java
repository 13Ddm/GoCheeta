package com.branch;

public class Branch {
	
	private int id;
	private String branch;
	
	public Branch(int id, String branch) {
		super();
		this.id = id;
		this.branch = branch;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}
}
