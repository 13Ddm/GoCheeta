package com.vehicle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.driver.DriverDBUtil;

import service.util.DBConnect;

/**
 * Servlet implementation class VehicleAddServlet
 */
@WebServlet("/VehicleAddServlet")
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class VehicleAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleAddServlet() {
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
       
       String brand = request.getParameter("brand");
       String model = request.getParameter("model");
       String vehicle = request.getParameter("vehicle");
       String color = request.getParameter("color");
       String regno = request.getParameter("regno");
       String branch = request.getParameter("branch");
		
		isTrue = VehicleDBUtil.insertVehicle(brand, model, vehicle, color, regno, branch, part);
		
		if(isTrue==true) {
			RequestDispatcher dis = request.getRequestDispatcher("adminVehicleView.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("adminDash.jsp");
			dis2.forward(request, response);
		}
	}

}
