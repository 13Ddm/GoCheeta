package com.booking;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import service.util.DBConnect;

public class BookingDBUtil {
	
	private static boolean isSuccess;
	private static Connection conn = null;
	private static Statement state = null;
	private static ResultSet rs = null;
	
	public static boolean addBooking(String source , String destination , String distance , String price , String branch , String cusid , String driverid , String vehicleid) {
		
		boolean isSuccess = false;
		String status = "Not Accepted";
		String feedback = "Not Given";
		
		try {
				conn = DBConnect.getConnection();
				state = conn.createStatement();
				String sql = "insert into booking values(0 , '"+source+"' , '"+destination+"' , '"+distance+"' , '"+price+"' , '"+status+"' , '"+feedback+"' , '"+branch+"' , '"+cusid+"' , '"+driverid+"' , '"+vehicleid+"' )";
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
	
	public static boolean updateBooking(String id , String status) {
		
		boolean isSuccess = false;
		
		try {
				conn = DBConnect.getConnection();
				state = conn.createStatement();
				String sql = "update booking set status = '"+status+"' where id = '"+id+"'";
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
	
	public static boolean setBookingFeedback(String id , String feedback) {
		
		boolean isSuccess = false;
		System.out.println(feedback);
		try {
				conn = DBConnect.getConnection();
				state = conn.createStatement();
				String sql = "update booking set feedback = '"+feedback+"' where id = '"+id+"'";
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
	
	public static boolean deleteBooking(String id) {
		
		int conId=Integer.parseInt(id);
		
		try {
			
			conn = DBConnect.getConnection();
			state = conn.createStatement();
			String sql = "delete from booking where id='"+conId+"'";
			
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
