package com.driver;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.customer.CustomerDBUtil;

import service.util.DBConnect;

/**
 * Servlet implementation class DriverAddServlet
 */
@WebServlet("/DriverAddServlet")
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class DriverAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverAddServlet() {
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
		
		response.setContentType("text/html;charset=UTF-8"); 
		out = response.getWriter(); 
		int result = 0; 
		Part part = request.getPart("image");
		 
		
       boolean isTrue;
       
       String firstName = request.getParameter("fname");
       String lastName = request.getParameter("lname");
       String contactNo = request.getParameter("contact");
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       String branch = request.getParameter("branch");
       
       Connection conn = null;
       Statement state = null;
       ResultSet rs = null;
       String vehicles = "";
       
       try{
		    conn = DBConnect.getConnection();
		    state = conn.createStatement();
		    String sql = "select * from vehicletype";
		    rs = state.executeQuery(sql);
		    
		
		    while(rs.next())
		    {
		    	int c = 0;
		        String type = rs.getString(2);
		        if(request.getParameter(type).equals("Yes"))
		        {
		        	if(c == 0) {
		        		vehicles = vehicles + "" + type;
		        	}
		        	else {
		        		vehicles = vehicles + " " + type;
		        	}
		        }
		        else {
		        	vehicles = vehicles + "";
		        }
		        
		    }
		}
		catch(Exception e){
		    e.printStackTrace();
		}
      
		
		isTrue = DriverDBUtil.insertDriver(firstName, lastName, contactNo, email , branch , part , password , vehicles);
		
		if(isTrue==true) {
			RequestDispatcher dis = request.getRequestDispatcher("adminDriverView.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("adminDash.jsp");
			dis2.forward(request, response);
		}
	}

}
