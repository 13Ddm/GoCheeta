<jsp:include page="header.jsp">
	<jsp:param name="title" value="Update Vehicle Details"/>
</jsp:include>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="service.util.*"%>
<%@ page import="com.driver.*"%>
<%@ page import="com.branch.*"%>
<%@ page import="com.vehicle.*"%>

<%
        			Connection conn = null;
        			Statement state = null;
        			ResultSet rs = null;
        			
        			String did = request.getParameter("did");
        			System.out.println(did);
                	
        			try{
                		conn = DBConnect.getConnection();
                		state = conn.createStatement();
                		String sql = "select * from vehicle where id = '"+did+"'";
                		rs = state.executeQuery(sql);
        			
						while(rs.next())
						{
							session.setAttribute("vbrand" , rs.getString(2));
							session.setAttribute("vmodel" , rs.getString(3));
							session.setAttribute("vcolor" , rs.getString(5));
							session.setAttribute("vreg" , rs.getString(6));
						}

        			}
        			catch(Exception e){
        				e.printStackTrace();
        			}
        			
%>


<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add New Vehicle</p>

                <form class="mx-1 mx-md-4" action = "updateVehicle" method = "POST">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-cab fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example1c" class="form" name = "brand" value = "<%out.print(session.getAttribute("vbrand"));%>"/>
                      <label class="form-label" for="form3Example1c">Vehicle Brand</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-user-circle fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="text" id="form3Example1c" class="form" name = "model" value = "<%out.print(session.getAttribute("vmodel"));%>"/>
                        <label class="form-label" for="form3Example1c">Vehicle Model</label>
                      </div>
                    </div>
                    
                    <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <select name = "type" class="form-control">
                       <option selected>Choose a Vehicle</option>
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
                      <input type="text" id="form3Example3c" class="form" name = "color" value = "<%out.print(session.getAttribute("vcolor"));%>"/>
                      <label class="form-label" for="form3Example3c">Vehicle Color</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-drivers-license fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example3c" class="form" name = "regno" value = "<%out.print(session.getAttribute("vreg"));%>"/>
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

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                  <input type = "text" value = "<%out.print(did); %>" name = "did" hidden>
                    <input type = "submit" class="btn btn-primary btn-lg" value = "Update">
                    
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

<jsp:include page="footer.jsp"></jsp:include>