<jsp:include page="header.jsp">
	<jsp:param name="title" value="View All Branches"/>
</jsp:include>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="service.util.*"%>
<%@ page import="com.branch.*"%>


<!-- Buttons trigger collapse -->
<a
  class="btn btn-primary"
  data-mdb-toggle="collapse"
  href="#collapseExample"
  role="button"
  aria-expanded="false"
  aria-controls="collapseExample"
>
  Add New Vehicle Type
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

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add New Vehicle Type</p>

                <form class="mx-1 mx-md-4" action = "addType" method = "POST">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-cab fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example1c" class="form-control" name = "type"/>
                      <label class="form-label" for="form3Example1c">Vehicle Type</label>
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-cab fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example1c" class="form-control" name = "price"/>
                      <label class="form-label" for="form3Example1c">Price per Kilo Meter</label>
                    </div>
                  </div>


                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                  	<input type="submit" class="btn btn-primary btn-lg" value = "Register">
                    
                  </div>


                </form>

              </div>
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
			      <th>Vehicle Type</th>
			      <th>Price Per km</th>
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
                		String sql = "select * from vehicletype";
                		rs = state.executeQuery(sql);
        			
						while(rs.next())
						{
							String id = Integer.toString(rs.getInt(1));
							String type = rs.getString(2);
							String price = rs.getString(3);
							%>
							<tr>
						  	  <th><%out.print(id); %></th>
						  	  <th><%out.print(type); %></th>
						  	  <th><%out.print(price); %></th>
						  	  <th><a href = "adminTypeUpdate.jsp?tid=<%out.print(id);%>" class="btn btn-primary">Edit</a></th>
						  	  <th><form action="deleteType" method = "POST">
              						<input type = "text" value = "<%out.print(id); %>" name = "id" hidden>
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