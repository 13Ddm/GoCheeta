<jsp:include page="header.jsp">
	<jsp:param name="title" value="View All Customers"/>
</jsp:include>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="service.util.*"%>
<%@ page import="com.customer.*"%>

<div class = "adminCard">
  <table class="table align-middle mb-0 bg-white">
      <thead class="bg-light">
        <tr>
          <th>ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Contact No</th>
          <th>Email</th>
          <th>Profile Image</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
        <%
        			Connection conn = null;
        			Statement state = null;
        			ResultSet rs = null;
                	
        			try{
                		conn = DBConnect.getConnection();
                		state = conn.createStatement();
                		String sql = "select * from customer";
                		rs = state.executeQuery(sql);
        			
						while(rs.next())
						{
							String id = Integer.toString(rs.getInt(1));
							String fname = rs.getString(2);
							String lname = rs.getString(3);
							String contact = rs.getString(4);
							String email = rs.getString(5);
							%>
							<tr>
						  	  <th><%out.print(id); %></th>
						  	  <th><%out.print(fname); %></th>
						  	  <th><%out.print(lname); %></th>
						  	  <th><%out.print(contact); %></th>
						  	  <th><%out.print(email); %></th>
						  	  <th><a href = "customerImgView.jsp?cid=<%out.print(id); %>" target = "_blank" class = "btn btn-primary">View Image</a></th>
          					  <%-- <th><a href = "adminCustomerUpdate.jsp?cid=<%out.print(id); %>" target = "_blank" class = "btn btn-primary">Edit</a></th> --%>
						  	  <th><form action="deleteCustomer" method = "POST">
              						<input type = "text" value = "<%out.print(id); %>" name = "cid" hidden>
              						<input class="btn btn-primary" value = "Delete" type = "submit">
          					</form></th>
						    </tr><%
						}
        			}
        			catch(Exception e){
        				e.printStackTrace();
        			}
        			
        			%>
      </tbody>
    </table>
        
 
</div>

<jsp:include page="footer.jsp"></jsp:include>