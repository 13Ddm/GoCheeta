<jsp:include page="/header.jsp">
	<jsp:param name="title" value="Driver Dashborad"/>
</jsp:include>

<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.driver.*"%>
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

<!-- Buttons trigger collapse -->
<!-- <!-- <a class="btn btn-primary" data-mdb-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
  aria-controls="collapseExample">
  Link with href
</a>
 -->
<div class="collapse mt-3" id="collapseExample">
 <%--  <section class="vh-150" style="background-color: #eee;">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-130">
        <div class="col-lg-12 col-xl-11">
          <div class="card text-black" style="border-radius: 25px;">
            <div class="card-body p-md-5">
              <div class="row justify-content-center">
                <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                  <form class="mx-1 mx-md-4">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example1c" class="form-control" name = "fname"/>
                      <label class="form-label" for="form3Example1c">Driver's First Name</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-user-circle fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="text" id="form3Example1c" class="form-control" name = "lname"/>
                        <label class="form-label" for="form3Example1c">Driver's Last Name</label>
                      </div>
                    </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-phone fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example3c" class="form-control" name = "contact"/>
                      <label class="form-label" for="form3Example3c">Driver's Contact Number</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="email" id="form3Example3c" class="form-control" name = "email"/>
                      <label class="form-label" for="form3Example3c">Driver's Email Address</label>
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" id="form3Example3c" class="form-control" />
                      <label class="form-label" for="form3Example3c">Driver's Password</label>
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example3c" class="form-control" />
                      <label class="form-label" for="form3Example3c">Driver's Branch</label>
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-smile fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example3c">Driver's Profile Picture</label>
                      <input type="file" id="form3Example3c" class="form-control" />
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-smile fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example3c">Driver's Preffered Vehicles</label><br>
                      <div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="Yes" name = "bike"/>
						  <label class="form-check-label" for="inlineCheckbox1">Bike</label>
						</div>
						
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="Yes" name = "bike"/>
						  <label class="form-check-label" for="inlineCheckbox2">Tuk-Tuk</label>
						</div>
						
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="Yes" name = "car"/>
						  <label class="form-check-label" for="inlineCheckbox3">Car</label>
						</div>
						
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="Yes" name = "cab"/>
						  <label class="form-check-label" for="inlineCheckbox4">Cab</label>
						</div>
						
						<div class="form-check form-check-inline">
						  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="Yes" name = "jeep"/>
						  <label class="form-check-label" for="inlineCheckbox4">Jeep</label>
						</div>
                    </div>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <input class="btn btn-primary btn-lg" type = "submit" value = "Register">
                  </div>

                </form>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <a href="adminAdminImgView.jsp?did=<%out.print(session.getAttribute("id")); %>" target =
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
  </section> --%>

</div>
      
	<br><br>
	<div class="container">
	<!-- This example requires Tailwind CSS v2.0+ -->
		<div class="bg-blue-600" style = "border-radius: 10px 10px 0px 0px">
		  <div class="max-w-7xl mx-auto py-3 px-3 sm:px-6 lg:px-8">
		    <div class="flex items-center justify-between flex-wrap">
		      <div class="w-0 flex-1 flex items-center">
		        <p class="ml-3 font-medium text-white truncate">
		          <span class="md:hidden"> We announced a new product! </span>
		          <span class="hidden md:inline"> New Bookings </span>
		        </p>
		      </div>
		    </div>
		  </div>
		</div>
	<table class="table align-middle mb-0 bg-white">
      <thead class="bg-light">
        <tr>
          <th>ID</th>
          <th>Source</th>
          <th>Destination</th>
          <th>Distance</th>
          <th>Price</th>
          <th>Feedback</th>
          <th>Branch</th>
          <th>Customer Name</th>
          <th>Customer Contact No</th>
          <th>Vehicle Number</th>
          <th>Status</th>
          <th>Set Status</th>
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
                		String sql2 = "SELECT * FROM booking B , Customer C , vehicle V where B.cusid = C.id AND B.vehicleid = V.id AND B.driverid = '"+session.getAttribute("id")+"' AND B.status != 'Completed'";
                		rs2 = state2.executeQuery(sql2);
        			
						while(rs2.next())
						{
							String id = Integer.toString(rs2.getInt(1));
							String source = rs2.getString(2);
							String destinaton = rs2.getString(3);
							String distance = rs2.getString(4);
							String price = rs2.getString(5);
							String feedback = rs2.getString(7);
							String branch = rs2.getString(8);
							String cfname = rs2.getString(13);
							String clname = rs2.getString(14);
							String ccno = rs2.getString(15);
							String vno = rs2.getString(24);
							String status = rs2.getString(6);
		        		
	                		
							%>
							<tr>
						  	  <th><%out.print(id); %></th>
						  	  <th><%out.print(source); %></th>
						  	  <th><%out.print(destinaton); %></th>
						  	  <th><%out.print(distance); %></th>
						  	  <th><%out.print(price); %></th>
						  	  <th><%out.print(feedback); %></th>
						  	  <th><%out.print(branch); %></th>
						  	  <th><%out.print(cfname); %> <%out.print(clname); %></th>
						  	  <th><%out.print(ccno); %></th>
						  	  <th><%out.print(vno); %></th>
						  	  <th><%out.print(status); %></th>
	
						  	  <th><a href = "driverDashSetStatus.jsp?bid=<%out.print(id); %>" class="btn btn-primary">Set Status</a></th>
          					
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
	
	<br><br>
	<div class="container">
	<!-- This example requires Tailwind CSS v2.0+ -->
		<div class="bg-green-600" style = "border-radius: 10px 10px 0px 0px">
		  <div class="max-w-7xl mx-auto py-3 px-3 sm:px-6 lg:px-8">
		    <div class="flex items-center justify-between flex-wrap">
		      <div class="w-0 flex-1 flex items-center">
		        <p class="ml-3 font-medium text-white truncate">
		          <span class="md:hidden"> We announced a new product! </span>
		          <span class="hidden md:inline"> Completed Bookings </span>
		        </p>
		      </div>
		    </div>
		  </div>
		</div>
	<table class="table align-middle mb-0 bg-white">
      <thead class="bg-light">
        <tr>
          <th>ID</th>
          <th>Source</th>
          <th>Destination</th>
          <th>Distance</th>
          <th>Price</th>
          <th>Feedback</th>
          <th>Branch</th>
          <th>Customer Name</th>
          <th>Customer Contact No</th>
          <th>Vehicle Number</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <%
        			Connection conn3 = null;
        			Statement state3 = null;
        			ResultSet rs3 = null;
                	
        			try{
                		conn3 = DBConnect.getConnection();
                		state3 = conn3.createStatement();
                		String sql3 = "SELECT * FROM booking B , Customer C , vehicle V where B.cusid = C.id AND B.vehicleid = V.id AND B.driverid = '"+session.getAttribute("id")+"' AND B.status = 'Completed'";
                		rs3 = state3.executeQuery(sql3);
        			
						while(rs3.next())
						{
							String id = Integer.toString(rs3.getInt(1));
							String source = rs3.getString(2);
							String destinaton = rs3.getString(3);
							String distance = rs3.getString(4);
							String price = rs3.getString(5);
							String feedback = rs3.getString(7);
							String branch = rs3.getString(8);
							String cfname = rs3.getString(13);
							String clname = rs3.getString(14);
							String ccno = rs3.getString(15);
							String vno = rs3.getString(24);
							String status = rs3.getString(6);
		        		
	                		
							%>
							<tr>
						  	  <th><%out.print(id); %></th>
						  	  <th><%out.print(source); %></th>
						  	  <th><%out.print(destinaton); %></th>
						  	  <th><%out.print(distance); %></th>
						  	  <th><%out.print(price); %></th>
						  	  <th><%out.print(feedback); %></th>
						  	  <th><%out.print(branch); %></th>
						  	  <th><%out.print(cfname); %> <%out.print(clname); %></th>
						  	  <th><%out.print(ccno); %></th>
						  	  <th><%out.print(vno); %></th>
						  	  <th><%out.print(status); %></th>
          					
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


<jsp:include page="/footer.jsp"></jsp:include>