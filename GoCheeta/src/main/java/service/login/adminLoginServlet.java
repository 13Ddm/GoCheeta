package service.login;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.admin.AdminDBUtil;

import service.util.DBConnect;

/**
 * Servlet implementation class adminLoginServlet
 */
@WebServlet("/adminLoginServlet")
public class adminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static boolean isSuccess;
	private static Connection conn=null;
	private static Statement state =null;
	private static ResultSet rs=null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLoginServlet() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession(true);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		out.println("<script type='text/javascript'>");
		out.println("alert('Logged in');");
		out.println("</script>");
		
		boolean isTrue = AdminDBUtil.validate(email,password);
		
		if(isTrue == true) {
			
			try {
				conn = DBConnect.getConnection();
				state = conn.createStatement();
				String sql = "select * from admin where email = '" + email + "' and password = '" + password + "'";
				rs=state.executeQuery(sql);
				
				if(rs.next()) {
					session.setAttribute("id", Integer.toString(rs.getInt(1)));
					session.setAttribute("fname", rs.getString(2));
					session.setAttribute("lname", rs.getString(3));
					session.setAttribute("contact", rs.getString(4));
					session.setAttribute("email", rs.getString(5));
					session.setAttribute("password", rs.getString(6));
					session.setAttribute("image", rs.getBlob(6));
					session.setAttribute("role", "admin");
					
					System.out.println(session.getAttribute("id"));
					System.out.println(session.getAttribute("fname"));
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			
			RequestDispatcher dis = request.getRequestDispatcher("adminDash.jsp");
			dis.forward(request, response);
			
		}
		else {
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
			System.out.println("Failed");
		}
	}
}
