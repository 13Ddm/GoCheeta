package com.booking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.util.DBConnect;

/**
 * Servlet implementation class BookingAddServlet
 */
@WebServlet("/BookingAddServlet")
public class BookingAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		boolean isTrue;
		
		HttpSession session = request.getSession(true);
		
		String cid = (String) session.getAttribute("id");
		System.out.println(cid);
		
		String picloc = request.getParameter("picloc");
		String pickstreet = request.getParameter("pickstreet");
		String droploc = request.getParameter("droploc");
		String dropstreet = request.getParameter("dropstreet");
		String distance = request.getParameter("distance");
		String type = request.getParameter("type");
		
		double dis = Double.parseDouble(distance);
		double priceperkm = 0;
		
		Connection conn = null;
		Statement state = null;
		ResultSet rs = null;
		
		Connection conn2 = null;
		Statement state2 = null;
		ResultSet rs2 = null;
		
		Connection conn3 = null;
		Statement state3 = null;
		ResultSet rs3 = null;
    	
		try{
    		conn = DBConnect.getConnection();
    		state = conn.createStatement();
    		String sql = "select * from vehicletype where type = '"+type+"'";
    		rs = state.executeQuery(sql);
		
			while(rs.next())
			{
				String id = Integer.toString(rs.getInt(1));
				String price = rs.getString(3);
				priceperkm = Double.parseDouble(price);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		double price = priceperkm * dis;
		String totalPrice = Double.toString(price);
		
		String source = picloc + " , " +  pickstreet;
		String destination = droploc + " , " +  dropstreet;
		String vid = "";
		System.out.println(type);
		try{
    		conn2 = DBConnect.getConnection();
    		state2 = conn2.createStatement();
    		String sql2 = "select * from vehicle where type LIKE '%"+type+"%' order by RAND() LIMIT 1";
    		rs2 = state2.executeQuery(sql2);
		
			while(rs2.next())
			{
				vid = Integer.toString(rs2.getInt(1));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		String did = "";
		try{
    		conn3 = DBConnect.getConnection();
    		state3 = conn3.createStatement();
    		String sql3 = "select * from driver where vehicles LIKE '%"+type+"%' order by RAND() LIMIT 1";
    		rs3 = state3.executeQuery(sql3);
		
			while(rs3.next())
			{
				did = Integer.toString(rs3.getInt(1));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		isTrue = BookingDBUtil.addBooking(source, destination, distance, totalPrice , picloc , cid, did, vid);
		
		if(isTrue==true) {
			RequestDispatcher dis1 = request.getRequestDispatcher("cusDash.jsp");
			dis1.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("index.jsp");
			dis2.forward(request, response);
		}
	}

}
