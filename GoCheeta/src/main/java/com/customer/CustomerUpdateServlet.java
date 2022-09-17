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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class CustomerUpdateServlet
 */
@WebServlet("/CustomerUpdateServlet")
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class CustomerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerUpdateServlet() {
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
		
		HttpSession session = request.getSession(true);
		
		response.setContentType("text/html;charset=UTF-8"); 
		out = response.getWriter(); 
		int result = 0; 
		Part part = request.getPart("image");
		
		String id = (String) session.getAttribute("id");
		
        boolean isTrue;
       
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
		String contactNo = request.getParameter("contact");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println(firstName);
		System.out.println(lastName);
		System.out.println(contactNo);
		System.out.println(email);
		System.out.println(id);
		
		isTrue = CustomerDBUtil.updateCustomer(id, firstName, lastName, contactNo, email, password, part);
		
		if(isTrue==true) {
			System.out.println("Done serv");
			RequestDispatcher dis = request.getRequestDispatcher("cusDash.jsp?done");
			dis.forward(request, response);
		}else {
			System.out.println("Failed serv");
			RequestDispatcher dis2 = request.getRequestDispatcher("cusDash.jsp?not");
			dis2.forward(request, response);
		}
	}

}
