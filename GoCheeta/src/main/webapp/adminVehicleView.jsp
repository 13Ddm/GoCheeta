<jsp:include page="header.jsp">
	<jsp:param name="title" value="View All Vehicles"/>
</jsp:include>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="service.util.*"%>
<%@ page import="com.driver.*"%>
<%@ page import="com.branch.*"%>
<%@ page import="com.vehicle.*"%>

<!-- Buttons trigger collapse -->
<a
  class="btn btn-primary"
  data-mdb-toggle="collapse"
  href="#collapseExample"
  role="button"
  aria-expanded="false"
  aria-controls="collapseExample"
>
  Add New Vehicle
</a>

	<!-- Collapsed content -->
	<div class="collapse mt-3" id="collapseExample">
	  
<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add New Vehicle</p>

                <form class="mx-1 mx-md-4" action = "addVehicle" method = "POST" enctype="multipart/form-data">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-cab fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example1c" class="form-control" name = "brand"/>
                      <label class="form-label" for="form3Example1c">Vehicle Brand</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-user-circle fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="text" id="form3Example1c" class="form-control" name = "model"/>
                        <label class="form-label" for="form3Example1c">Vehicle Model</label>
                      </div>
                    </div>
                    
                    <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <select name = "vehicle" class="form-control">
                       <option selected>Choose a Vehicle Type</option>
                      <%
						Connection conn2 = null;
						Statement state2 = null;
						ResultSet rs2 = null;
						
						try{
						    conn2 = DBConnect.getConnection();
						    state2 = conn2.createStatement();
						    String sql = "select * from vehicletype";
						    rs2 = state2.executeQuery(sql);
						
						    while(rs2.next())
						    {
						        String branch = rs2.getString(2);
						        %>
						        <option value="<%out.print(branch);%>"><%out.print(branch);%></option>
						        <%
						    }
						}
						catch(Exception e){
						    e.printStackTrace();
						}
						
						%>
                      </select>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-phone fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example3c" class="form-control" name = "color"/>
                      <label class="form-label" for="form3Example3c">Vehicle Color</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-drivers-license fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example3c" class="form-control" name = "regno"/>
                      <label class="form-label" for="form3Example3c">Vehicle Register No:</label>
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <select name = "branch" class="form-control">
                       <option selected>Choose a Branch</option>
                      <%
						Connection conn3 = null;
						Statement state3 = null;
						ResultSet rs3 = null;
						
						try{
						    conn3 = DBConnect.getConnection();
						    state3 = conn3.createStatement();
						    String sql = "select * from branch";
						    rs3 = state3.executeQuery(sql);
						
						    while(rs3.next())
						    {
						        String branch = rs3.getString(2);
						        %>
						        <option value="<%out.print(branch);%>"><%out.print(branch);%></option>
						        <%
						    }
						}
						catch(Exception e){
						    e.printStackTrace();
						}
						
						%>
                      </select>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-image fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <label class="form-label" for="form3Example3c">Vehicle Image : </label>
                      <input type="file" id="form3Example3c" class="form-control" name = "image"/>
                    </div>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">

                    <input type = "submit" class="btn btn-primary btn-lg" value = "Register">
                    
                  </div>


                </form>

              </div>
              <!-- <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                  class="img-fluid" alt="Sample image">

              </div> -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
	</div>
	
<div class = "adminCard">
  <table class="table align-middle mb-0 bg-white">
      <thead class="bg-light">
        <tr>
          <th>ID</th>
          <th>Brand</th>
          <th>Model</th>
          <th>Type</th>
          <th>Color</th>
          <th>Register No</th>
          <th>Branch</th>
          <th>Image</th>
          <th>Edit</th>
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
                		String sql = "select * from vehicle";
                		rs = state.executeQuery(sql);
        			
						while(rs.next())
						{
							String id = Integer.toString(rs.getInt(1));
							String brand = rs.getString(2);
							String model = rs.getString(3);
							String type = rs.getString(4);
							String color = rs.getString(5);
							String regno = rs.getString(6);
							String branch = rs.getString(7);
							%>
							<tr>
						  	  <th><%out.print(id); %></th>
						  	  <th><%out.print(brand); %></th>
						  	  <th><%out.print(model); %></th>
						  	  <th><%out.print(type); %></th>
						  	  <th><%out.print(color); %></th>
						  	  <th><%out.print(regno); %></th>
						  	  <th><%out.print(branch); %></th>
						  	  <th><a href = "vehicleImgView.jsp?vid=<%out.print(id); %>" target = "_blank" class = "btn btn-primary">View Image</a></th>
          					  <th><a href = "adminVehicleUpdate.jsp?did=<%out.print(id); %>" class = "btn btn-primary" target = "_blank">Edit</a></th>
						  	  <th><form action="deleteVehicle" method = "POST">
              						<input type = "text" value = "<%out.print(id); %>" name = "vid" hidden>
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