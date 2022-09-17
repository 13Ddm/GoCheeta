package com.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class CustomerAddServlet
 */
@WebServlet("/CustomerAddServlet")
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class CustomerAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerAddServlet() {
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
		
		isTrue = CustomerDBUtil.insertCustomer(firstName, lastName, contactNo, email, password , part);
		
		if(isTrue==true) {
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("index.jsp");
			dis2.forward(request, response);
		}
		
	}

}
