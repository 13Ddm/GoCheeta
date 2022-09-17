<jsp:include page="/header.jsp">
	<jsp:param name="title" value="Admin Dashborad"/>
</jsp:include>

<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.admin.*"%>
<%@page import="service.util.*"%>


<%-- <%
	String id = (String)session.getAttribute("id");

	try {
	    Connection con = DBConnect.getConnection();
	    PreparedStatement ps = con.prepareStatement("select * from admin where id=?");
	    ps.setString(1, id);
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
%> --%>

<%
	Connection conn = null;
	Statement state = null;
	ResultSet rs = null;

String cid = (String)session.getAttribute("id");

try {
	conn = DBConnect.getConnection();
	state = conn.createStatement();
	String sql = "select * from admin where id = '"+cid+"'";
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
%>


<!-- Buttons trigger collapse -->
<a class="btn btn-primary" data-mdb-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
  aria-controls="collapseExample">
  Update
</a>

<div class="collapse mt-3" id="collapseExample">
  <section class="vh-150" style="background-color: #eee;">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-130">
        <div class="col-lg-12 col-xl-11">
          <div class="card text-black" style="border-radius: 25px;">
            <div class="card-body p-md-5">
              <div class="row justify-content-center">
                <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                  <form class="mx-1 mx-md-4" action="updateAdmin" method="POST" enctype="multipart/form-data">

                    <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="text" id="form3Example1c" class="form-control"
                          value="<%out.print(session.getAttribute("fname"));%>" name = "fname"/>
                        <!-- <label class="form-label" for="form3Example1c">Your First Name</label> -->
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-user-circle fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="text" id="form3Example1c" class="form-control"
                          value="<%out.print(session.getAttribute("lname"));%>" name = "lname"/>
                        <!-- <label class="form-label" for="form3Example1c">Your Last Name</label> -->
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-phone fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="text" id="form3Example3c" class="form-control"
                          value="<%out.print(session.getAttribute("contact"));%>" name = "contact"/>
                        <!-- <label class="form-label" for="form3Example3c">Your Contact Number</label> -->
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="email" id="form3Example3c" class="form-control"
                          value="<%out.print(session.getAttribute("email"));%>" name = "email"/>
                        <!-- <label class="form-label" for="form3Example3c">Your Email Address</label> -->
                      </div>
                    </div>

                    <!-- <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-smile fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <label class="form-label" for="form3Example3c">Your Profile Picture</label>
                        <input type="file" id="form3Example3c" class="form-control" name="image" />

                      </div>
                    </div> -->

                    <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="password" id="form3Example4c" class="form-control"
                          value="<%out.print(session.getAttribute("password"));%>" name = "password"/>
                        <!-- <label class="form-label" for="form3Example4c">Password</label> -->
                      </div>
                    </div>
                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    	<input class="btn btn-primary btn-lg" value = "Update" type = "submit">
                      <!-- <button type="button" class="btn btn-primary btn-lg">Update</button> -->
                    </div>

                  </form>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <a href="adminAdminImgView.jsp?aid=<%out.print(session.getAttribute("id")); %>" target =
                      "_blank"><button type="button" class="btn btn-primary btn-lg">View Image</button></a>
                  </div>

                </div>
                <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                    class="img-fluid" alt="Sample image">

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

</div>
      
	<br><br>
	<div class="container">
	  <div class="row">
	    <div class="col-md">
	      <a href = "adminCustomerView.jsp"><button type="button" class="btn btn-primary btn-rounded justify-content-center">Manager All Customers</button></a>
	    </div>
	    <div class="col-md">
	      <a href = "adminVehicleView.jsp"><button type="button" class="btn btn-primary btn-rounded justify-content-center">Manager All Vehicles</button></a>
	    </div>
	    <div class="col-md">
	     <a href = "adminTypeView.jsp"><button type="button" class="btn btn-primary btn-rounded justify-content-center">Manager Vehicle Types</button></a>
	    </div>
	    <div class="col-md">
	     <a href = "adminDriverView.jsp"><button type="button" class="btn btn-primary btn-rounded justify-content-center">Manager All Drivers</button></a>
	    </div>
	    <div class="col-md">
	     <a href = "adminBookingView.jsp"><button type="button" class="btn btn-primary btn-rounded justify-content-center">Manager All Bookings</button></a>
	    </div>
	    <div class="col-md">
	     <a href = "adminBranchView.jsp"><button type="button" class="btn btn-primary btn-rounded justify-content-center">Manager All Branches</button></a>
	    </div>
	  </div>
	</div>
	
	<br><br>
	<div class = "container">
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
		        <tr>
		          <th>Branch</th>
		          <th>Income</th>
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
                		String sql2 = "SELECT branch , SUM(price) from booking group by branch";
                		rs2 = state2.executeQuery(sql2);
        			
						while(rs2.next())
						{
								String branch = rs2.getString(1);
								String sum = rs2.getString(2);
	                		
								%>
								<tr>
									<th><%out.print(branch); %></th>
									<th><%out.print(sum); %></th>
								</tr>
							    <%
						}
        			}
        			catch(Exception e){
        				e.printStackTrace();
        			}
        			
        			%>	
		      </tbody>
		</table>
	</div>


<jsp:include page="/footer.jsp"></jsp:include>