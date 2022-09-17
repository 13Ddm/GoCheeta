package com.admin;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.Part;

import service.util.DBConnect;

public class AdminDBUtil {
	
	private static boolean isSuccess;
	private static Connection conn=null;
	private static Statement state =null;
	private static ResultSet rs=null;
	
	public static boolean validate(String email, String password) {
		// TODO Auto-generated method stub
		try {
			
			conn = DBConnect.getConnection();
			state=conn.createStatement();
			String sql = "select * from admin where email = '" + email + "' and password = '" + password + "'";
			rs=state.executeQuery(sql);
			
			if(rs.next()) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean updateAdmin(String id , String fname , String lname , String contact , String email ,String password , Part image) {
		
		boolean isSuccess = false;
		
		try {
			conn = DBConnect.getConnection(); 
			state = conn.createStatement(); 
			String sql = "update admin set fname='"+fname+"', lname = '"+lname+"' , contact = '" +contact+"', email = '"+email+"' , password = '"+password+"' where id = '"+id+ "'"; 
			int rs = state.executeUpdate(sql);
			
			if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
}
