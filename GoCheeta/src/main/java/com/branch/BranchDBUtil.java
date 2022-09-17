package com.branch;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import service.util.*;

public class BranchDBUtil {
	
	private static boolean isSuccess;
	private static Connection conn = null;
	private static Statement state = null;
	private static ResultSet rs = null;
	
	public static boolean addBranch(String branch) {
		
		boolean isSuccess = false;
		
		try {
				conn = DBConnect.getConnection();
				state = conn.createStatement();
				String sql = "insert into branch values(0,'"+branch+"')";
				int rs = state.executeUpdate(sql);
				if(rs>0) {
					isSuccess=true;
				}else {
					isSuccess=false;
				}
		}catch(Exception X) {
			X.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean deleteBranch(String id) {
		
		int conId=Integer.parseInt(id);
		
		try {
			
			conn = DBConnect.getConnection();
			state = conn.createStatement();
			String sql = "delete from branch where id='"+conId+"'";
			
			int r = state.executeUpdate(sql);
			
			if(r>0) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
		}catch(Exception X) {
			X.printStackTrace();
		}
		return isSuccess;
	}

}
