package com.vehicle;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.Part;

import service.util.DBConnect;

public class VehicleDBUtil {
	
	private static boolean isSuccess;
	private static Connection conn=null;
	private static Statement state =null;
	private static ResultSet rs=null;
	
	public static boolean insertVehicle(String brand , String model , String type , String color , String regno , String branch , Part image ) {
		
		boolean isSuccess = false;
		
		try {
			
			conn = DBConnect.getConnection();
			/*state = conn.createStatement();
			String sql = ;
			int rs = state.executeUpdate(sql);*/
			
			PreparedStatement ps = conn.prepareStatement("insert into vehicle values (0,'"+brand+"','"+model+"','"+type+"','"+color+"','"+regno+"','"+branch+"', ? )"); 
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
	
	public static boolean updateVehicle(String id, String brand , String model , String type , String color , String regno , String branch) {
	
    	try {	
    		conn = DBConnect.getConnection();
    		state = conn.createStatement();
    		String sql = "update vehicle set brand='"+brand+"', model = '"+model+"' , type='"+type+"', color = '"+color+"' , regno='"+regno+"' , branch='"+branch+"' where id='"+id+"'";
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
	
	public static boolean deleteVehicle(String id) {
		
		System.out.println(id);
		int empid = Integer.parseInt(id);
		
		try {
			conn = DBConnect.getConnection();
			state=conn.createStatement();
			String sql = "delete from vehicle where id = '" + empid + "'";
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
