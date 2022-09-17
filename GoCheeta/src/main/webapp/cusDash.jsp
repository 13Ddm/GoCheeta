<jsp:include page="/header.jsp">
	<jsp:param name="title" value="Customer Dashborad"/>
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

<%
Connection conn = null;
Statement state = null;
ResultSet rs = null;

String cid = (String)session.getAttribute("id");

try {
	conn = DBConnect.getConnection();
	state = conn.createStatement();
	String sql = "select * from customer where id = '"+cid+"'";
	rs=state.executeQuery(sql);
	
	if(rs.next()) {
		session.setAttribute("id", Integer.toString(rs.getInt(1)));
		session.setAttribute("fname", rs.getString(2));
		session.setAttribute("lname", rs.getString(3));
		session.setAttribute("contact", rs.getString(4));
		session.setAttribute("email", rs.getString(5));
		session.setAttribute("password", rs.getString(6));
		session.setAttribute("image", rs.getBlob(6));
		session.setAttribute("role", "customer");
		
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
  Update Profile
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
      
                      <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Update Profile</p>
      
                      <form class="mx-1 mx-md-4" action = "updateCustomer" method = "POST" enctype="multipart/form-data">
      
                        <div class="d-flex flex-row align-items-center mb-4">
                          <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-0">
                            <input type="text" id="form3Example1c" class="form" name = "fname" value="<%out.print(session.getAttribute("fname"));%>"/>
                            <label class="form-label" for="form3Example1c">Your First Name</label>
                          </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-4">
                            <i class="fas fa-user-circle fa-lg me-3 fa-fw"></i>
                            <div class="form-outline flex-fill mb-0">
                              <input type="text" id="form3Example1c" class="form" name = "lname" value="<%out.print(session.getAttribute("lname"));%>"/>
                              <label class="form-label" for="form3Example1c">Your Last Name</label>
                            </div>
                          </div>

                        <div class="d-flex flex-row align-items-center mb-4">
                          <i class="fas fa-phone fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-0">
                            <input type="text" id="form3Example3c" class="form" name = "contact" value="<%out.print(session.getAttribute("contact"));%>"/>
                            <label class="form-label" for="form3Example3c">Your Contact Number</label>
                          </div>
                        </div>
      
                        <div class="d-flex flex-row align-items-center mb-4">
                          <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-0">
                            <input type="email" id="form3Example3c" class="form" name = "email" value="<%out.print(session.getAttribute("email"));%>"/>
                            <label class="form-label" for="form3Example3c">Your Email Address</label>
                          </div>
                        </div>

                        <!-- <div class="d-flex flex-row align-items-center mb-4">
                          <i class="fas fa-smile fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-0">
                            <label class="form-label" for="form3Example3c">Your Profile Picture</label>
                            <input type="file" id="form3Example3c" class="form" name = "image"/>
                          </div>
                        </div> -->
                        
                        <div class="d-flex flex-row align-items-center mb-4">
                          <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                          <div class="form-outline flex-fill mb-0">
                            <input type="password" id="form3Example3c" class="form" name = "password" value="<%out.print(session.getAttribute("password"));%>"/>
                            <label class="form-label" for="form3Example3c">Your Password</label>
                          </div>
                        </div>
      
                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                        	<input type = "submit" class="btn btn-primary btn-lg" value = "Update">
                        </div>
      
                      </form>
                      
                      <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <a href="customerImgView.jsp?cid=<%out.print(session.getAttribute("id")); %>" target =
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
          <th>Driver Name</th>
          <th>Driver Contact No</th>
          <th>Vehicle Number</th>
          <th>Status</th>
          <th>Write FeedBack</th>
          <th>Cancel</th>
        </tr>
      </thead>
      <tbody>
         <%
        			Connection conn2 = null;
        			Statement state2 = null;
        			ResultSet rs2 = null;
        			
        			Connection conn3 = null;
        			Statement state3 = null;
        			ResultSet rs3 = null;
                	
        			try{
                		conn2 = DBConnect.getConnection();
                		state2 = conn2.createStatement();
                		String sql2 = "SELECT * FROM booking B , Driver D , vehicle V where B.driverid = D.id AND B.vehicleid = V.id AND B.cusid = '"+session.getAttribute("id")+"' AND B.status != 'Completed'";
                		rs2 = state.executeQuery(sql2);
        			
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
							String cusid = rs2.getString(9);
							String driverid = rs2.getString(10);
							String vehicleid = rs2.getString(11);	
							String dfname = rs2.getString(13);	
							String dlname = rs2.getString(14);
							String dcontact = rs2.getString(15);	
							String vno = rs2.getString(26);	
		        			
		        			System.out.println(driverid);
	                		
							%>
							<tr>
						  	  <th><%out.print(id); %></th>
						  	  <th><%out.print(source); %></th>
						  	  <th><%out.print(destinaton); %></th>
						  	  <th><%out.print(distance); %></th>
						  	  <th><%out.print(price); %></th>
						  	  <th><%out.print(feedback); %></th>
						  	  <th><%out.print(branch); %></th>
						  	  <th><%out.print(dfname); %></th>
						  	  <th><%out.print(dlname); %></th>
						  	  <th><%out.print(vno); %></th>
						  	  <th><%out.print(status); %></th>
						  	  <th><a href = "cusDashFeedback.jsp?bid=<%out.print(id); %>" class="btn btn-primary">Set Feedback</a></th>
						  	  <th><!-- Button trigger modal -->
								<button type="button" class="btn btn-primary" data-mdb-toggle="modal" data-mdb-target="#exampleModal">
								  Cancel
								</button>
								
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">Cancel Order</h5>
								        <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">Call the driver to cancel the trip..<br><%out.print(dfname); %> <%out.print(dlname); %><br><%out.print(dcontact); %></div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Close</button>
								      </div>
								    </div>
								  </div>
								</div></th>
          					
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
	  <div class="row">
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
          <th>Driver Name</th>
          <th>Driver Contact No</th>
          <th>Vehicle Number</th>
        </tr>
      </thead>
      <tbody>
         <%
      	
        			try{
                		conn3 = DBConnect.getConnection();
                		state3 = conn3.createStatement();
                		String sql3 = "SELECT * FROM booking B , Driver D , vehicle V where B.driverid = D.id AND B.vehicleid = V.id AND B.cusid = '"+session.getAttribute("id")+"' AND B.status = 'Completed'";
                		rs3 = state3.executeQuery(sql3);
        			
						while(rs3.next())
						{
							String id = Integer.toString(rs3.getInt(1));
							String source = rs3.getString(2);
							String destinaton = rs3.getString(3);
							String distance = rs3.getString(4);
							String price = rs3.getString(5);
							String status = rs3.getString(6);
							String feedback = rs3.getString(7);
							String branch = rs3.getString(8);
							String cusid = rs3.getString(9);
							String driverid = rs3.getString(10);
							String vehicleid = rs3.getString(11);	
							String dfname = rs3.getString(13);	
							String dlname = rs3.getString(14);
							String dcontact = rs3.getString(15);	
							String vno = rs3.getString(26);	
		        			
		        			System.out.println(driverid);
	                		
							%>
							<tr>
						  	  <th><%out.print(id); %></th>
						  	  <th><%out.print(source); %></th>
						  	  <th><%out.print(destinaton); %></th>
						  	  <th><%out.print(distance); %></th>
						  	  <th><%out.print(price); %></th>
						  	  <th><%out.print(feedback); %></th>
						  	  <th><%out.print(branch); %></th>
						  	  <th><%out.print(dfname); %></th>
						  	  <th><%out.print(dlname); %></th>
						  	  <th><%out.print(vno); %></th>				
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
	</div>


<jsp:include page="/footer.jsp"></jsp:include>