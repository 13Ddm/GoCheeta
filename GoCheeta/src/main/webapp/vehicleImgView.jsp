<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.vehicle.*"%>
<%@page import="service.util.*"%>

<%
	//String id = (String)session.getAttribute("id");

	String vid = request.getParameter("vid");
	System.out.println(vid);
	

	try {
	    Connection con = DBConnect.getConnection();
	    PreparedStatement ps = con.prepareStatement("select * from vehicle where id=?");
	    ps.setString(1, vid);
	    ResultSet rs = ps.executeQuery();
	    if (rs.next()) {
	        Blob blob = rs.getBlob("image");
	        byte byteArray[] = blob.getBytes(1, (int) blob.length());
	        response.setContentType("image/gif");
	        OutputStream os = response.getOutputStream();
	        os.write(byteArray);
	        os.flush();
	        os.close();
	        System.out.println("true");
	    } else {
	        System.out.println("No image found with this id.");
	    }
	} catch (Exception e) {
		System.out.println(e);
	}
%>