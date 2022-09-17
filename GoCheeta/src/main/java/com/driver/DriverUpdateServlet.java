package com.driver;

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

import service.util.DBConnect;

/**
 * Servlet implementation class DriverUpdateServlet
 */
@WebServlet("/DriverUpdateServlet")
public class DriverUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverUpdateServlet() {
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
	      
		String id = request.getParameter("did");
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
			        String type = rs.getString(2);
			        if(request.getParameter(type).equals("Yes"))
			        {
			        	vehicles = vehicles + " , " + type;
			        }
			        else {
			        	vehicles = vehicles + " ";
			        }
			        
			    }
			}
			catch(Exception e){
			    e.printStackTrace();
			}
	      
			
			isTrue = DriverDBUtil.updateDriver(id , firstName, lastName, contactNo, email , branch , password , vehicles);
			
			if(isTrue==true) {
				RequestDispatcher dis = request.getRequestDispatcher("adminDriverView.jsp");
				dis.forward(request, response);
			}else {
				RequestDispatcher dis2 = request.getRequestDispatcher("adminDash.jsp");
				dis2.forward(request, response);
			}
	}

}
