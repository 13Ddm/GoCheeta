package com.type;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TypeAddServlet
 */
@WebServlet("/TypeAddServlet")
public class TypeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TypeAddServlet() {
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
		
		String type = request.getParameter("type");
		String price = request.getParameter("price");
		double priceperkm = Double.parseDouble(price);
		
		boolean isTrue=false;
		
		isTrue= TypeDBUtil.addType(type , priceperkm);
		
		if(isTrue==true) {
			RequestDispatcher res=request.getRequestDispatcher("adminTypeView.jsp");
			res.forward(request, response);
		}else {
			RequestDispatcher res=request.getRequestDispatcher("adminDash.jsp");
			res.forward(request, response);
		}
	}

}
