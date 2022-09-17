package com.vehicle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VehicleUpdateServlet
 */
@WebServlet("/VehicleUpdateServlet")
public class VehicleUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleUpdateServlet() {
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
	       String brand = request.getParameter("brand");
	       String model = request.getParameter("model");
	       String type = request.getParameter("type");
	       String color = request.getParameter("color");
	       String regno = request.getParameter("regno");
	       String branch = request.getParameter("branch");
	       
	       System.out.println(id);
	       System.out.println(brand);
	       System.out.println(model);
	       System.out.println(type);
	       System.out.println(color);
	       System.out.println(regno);
	       System.out.println(branch);
	       
			
			isTrue = VehicleDBUtil.updateVehicle(id , brand, model, type, color, regno, branch);
			
			if(isTrue==true) {
				RequestDispatcher dis = request.getRequestDispatcher("adminVehicleView.jsp");
				dis.forward(request, response);
			}else {
				RequestDispatcher dis2 = request.getRequestDispatcher("adminDash.jsp");
				dis2.forward(request, response);
			}
	}

}
