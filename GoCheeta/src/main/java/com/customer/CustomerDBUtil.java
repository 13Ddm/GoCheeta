package com.customer;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;  //Importing Packages

import javax.servlet.http.Part;

import service.util.DBConnect;

public class CustomerDBUtil {
	
	private static boolean isSuccess;
	private static Connection conn=null;
	private static Statement state =null;
	private static ResultSet rs=null;
	
	public static boolean validate (String email,String password) {

		try {
			
			conn = DBConnect.getConnection();
			state=conn.createStatement();
			String sql = "select * from customer where email = '" + email + "' and password = '" + password + "'";
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
	
	public static boolean insertCustomer(String fname , String lname , String cno , String email , String password, Part image) {
		
		boolean isSuccess = false;
		
		try {
			
			conn = DBConnect.getConnection();
			
			 PreparedStatement ps = conn.prepareStatement("insert into customer values (0,'"+fname+"','"+lname+"','"+cno+"','"+email+"','"+password+"',?)"); 
			 InputStream is = image.getInputStream(); 
			 ps.setBlob(1, is);
			 int rs = ps.executeUpdate();
			 
			 if(rs>0) 
			 {
				 isSuccess=true; 
			 }
			 else 
			 { 
				 isSuccess=false; 
			 }
			 
		}catch(Exception X) {
			System.out.println("fail");
			X.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	public static boolean updateCustomer(String id, String fname , String lname , String cno , String email , String password, Part image) {
    	
    	try {
    		
    		conn = DBConnect.getConnection();

			 /*PreparedStatement ps = conn.prepareStatement("update customer set fname='"+fname+"', lname = '" +lname+"' ,contactno='"+cno+"', email = '"+email+"' , password='" +password+"' , image = ? where id='"+id+"'"); 
			 InputStream is = image.getInputStream(); 
			 ps.setBlob(1, is); 
			 int rs = ps.executeUpdate();*/
			 
    		
			
			 conn = DBConnect.getConnection(); 
			 state = conn.createStatement(); 
			 String sql = "update customer set fname='"+fname+"', lname = '"+lname+"' , contactno = '" +cno+"', email = '"+email+"' , password = '"+password+"' where id = '"+id+ "'"; 
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
	
	public static boolean deleteCustomer(String id) {
		
		System.out.println(id);
		int empid = Integer.parseInt(id);
		
		try {
			conn = DBConnect.getConnection();
			state=conn.createStatement();
			String sql = "delete from customer where id = '" + empid + "'";
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
