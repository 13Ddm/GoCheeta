<jsp:include page="header.jsp">
	<jsp:param name="title" value="View All Booking"/>
</jsp:include>

<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.customer.*"%>
<%@page import="service.util.*"%>

<div class = "adminCard">
  <table class="table align-middle mb-0 bg-white">
      <thead class="bg-light">
        <tr>
          <th>ID</th>
          <th>Source</th>
          <th>Destination</th>
          <th>Distance</th>
          <th>Price</th>
          <th>Status</th>
          <th>Feedback</th>
          <th>Branch</th>
          <th>Customer Name</th>
          <th>Customer Contact No</th>
          <th>Driver Name</th>
          <th>Driver Contact No</th>
          <th>Vehicle Number</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
			<%
        			Connection conn2 = null;
        			Statement state2 = null;
        			ResultSet rs2 = null;
                	
        			try{
                		conn2 = DBConnect.getConnection();
                		state2 = conn2.createStatement();
                		String sql2 = "SELECT * FROM booking B , Customer C , Driver D , Vehicle V where B.cusid = C.id AND B.vehicleid = V.id AND B.driverid = D.id";
                		rs2 = state2.executeQuery(sql2);
        			
						while(rs2.next())
						{
							String id = Integer.toString(rs2.getInt(1));
							String source = rs2.getString(2);
							String destinaton = rs2.getString(3);
							String distance = rs2.getString(4);
							String price = rs2.getString(5);
							String status = rs2.getString(6);
							String feedback = rs2.getString(7);
							String branch = rs2.getString(8);

							String cfname = rs2.getString(13);	
							String clname = rs2.getString(14);
							String ccontact = rs2.getString(15);
							String dfname = rs2.getString(20);	
							String dlname = rs2.getString(21);
							String dcontact = rs2.getString(22);	
							String vno = rs2.getString(33);	
	                		
							%>
							<tr>
						  	  <th><%out.print(id); %></th>
						  	  <th><%out.print(source); %></th>
						  	  <th><%out.print(destinaton); %></th>
						  	  <th><%out.print(distance); %></th>
						  	  <th><%out.print(price); %></th>
						  	  <th><%out.print(status); %></th>
						  	  <th><%out.print(feedback); %></th>
						  	  <th><%out.print(branch); %></th>
						  	  <th><%out.print(cfname); %> <%out.print(clname); %></th>
						  	  <th><%out.print(ccontact); %></th>
							  <th><%out.print(dfname); %> <%out.print(dlname); %></th>
							  <th><%out.print(dcontact); %></th>
							  <th><%out.print(vno); %></th>
								<!-- Modal -->
								<th><form action="deletebooking" method = "POST">
              						<input type = "text" value = "<%out.print(id); %>" name = "bid" hidden>
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