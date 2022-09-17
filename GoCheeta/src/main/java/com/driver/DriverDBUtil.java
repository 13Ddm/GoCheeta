package com.driver;

import java.io.InputStream;
import java.sql.*;

import javax.servlet.http.Part;

import service.util.DBConnect;

public class DriverDBUtil {

	private static boolean isSuccess;
	private static Connection conn=null;
	private static Statement state =null;
	private static ResultSet rs=null;
	
	public static boolean validate(String email,String password) {
		
		try {
			
			conn = DBConnect.getConnection();
			state=conn.createStatement();
			String sql = "select * from driver where email = '" + email + "' and password = '" + password + "'";
			rs=state.executeQuery(sql);
			
			if(rs.next()) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
			
		}catch(Exception X) {
			
			X.printStackTrace();
			
		}
		return isSuccess;
	}
	
	public static boolean insertDriver(String fname , String lname , String cno , String email , String branch , Part image , String password , String vehicles) {
		
		boolean isSuccess = false;
		
		try {
			
			conn = DBConnect.getConnection();
			/*state = conn.createStatement();
			String sql = ;
			int rs = state.executeUpdate(sql);*/
			
			PreparedStatement ps = conn.prepareStatement("insert into driver values (0,'"+fname+"','"+lname+"','"+cno+"','"+email+"','"+branch+"',?,'"+password+"','"+vehicles+"')"); 
			InputStream is = image.getInputStream(); 
			ps.setBlob(1, is);
			int rs = ps.executeUpdate();
			 
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
	
	public static boolean updateDriver(String id, String fname , String lname , String cno , String email , String branch , String password , String vehicles) {
	
    	try {
    		
    		conn = DBConnect.getConnection();
    		state = conn.createStatement();
    		String sql = "update driver set fname='"+fname+"', lname = '"+lname+"' , contact='"+cno+"', email = '"+email+"' , branch='"+branch+"' , password='"+password+"' , vehicles = '"+vehicles+"' where id='"+id+"'";
    		int rs = state.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
	
	public static boolean deleteDriver(String id) {
		
		System.out.println(id);
		int empid = Integer.parseInt(id);
		
		try {
			conn = DBConnect.getConnection();
			state=conn.createStatement();
			String sql = "delete from driver where id = '" + empid + "'";
			int result = state.executeUpdate(sql);
			System.out.println(result);
			if(result > 0) {
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
