package com.type;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import service.util.DBConnect;

public class TypeDBUtil {

	private static boolean isSuccess;
	private static Connection conn = null;
	private static Statement state = null;
	private static ResultSet rs = null;
	
	public static boolean addType(String type , double price) {
		
		boolean isSuccess = false;
		
		try {
				conn = DBConnect.getConnection();
				state = conn.createStatement();
				String sql = "insert into vehicletype values(0,'"+type+"' , '"+price+"')";
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
	
	public static boolean updateType(String id , String type , double price) {
		
		boolean isSuccess = false;
		
		try {
				conn = DBConnect.getConnection();
				state = conn.createStatement();
				String sql = "update vehicletype set type = '"+type+"', price = '"+price+"' where id = '"+id+"'";
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
	
	public static boolean deleteType(String id) {
		
		int conId=Integer.parseInt(id);
		
		try {
			
			conn = DBConnect.getConnection();
			state = conn.createStatement();
			String sql = "delete from vehicletype where id='"+conId+"'";
			
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
