<jsp:include page="header.jsp">
	<jsp:param name="title" value="Update Branch"/>
</jsp:include>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="service.util.*"%>
<%@ page import="com.branch.*"%>

<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
              <%
        			Connection conn = null;
        			Statement state = null;
        			ResultSet rs = null;
        			
        			String tid = request.getParameter("tid");
                	
        			try{
                		conn = DBConnect.getConnection();
                		state = conn.createStatement();
                		String sql = "select * from vehicletype where id = '"+tid+"'";
                		rs = state.executeQuery(sql);
        			
						while(rs.next())
						{
							String type = rs.getString(2);
							session.setAttribute("Vtype" , type);
							String value = Double.toString(rs.getDouble(3));
							session.setAttribute("Vtypeval" , value);
						}

        			}
        			catch(Exception e){
        				e.printStackTrace();
        			}
        			
        			%>

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Update Vehicle Type</p>

                <form class="mx-1 mx-md-4" action = "updateType" method = "POST">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-cab fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example1c" class="form" name = "type" value = <%out.print(session.getAttribute("Vtype")); %>>
                      <input type="text" id="form3Example1c" class="form" name = "id" value = <%out.print(tid); %> hidden>
                      
                      <label class="form-label" for="form3Example1c">Vehicle Type</label>
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-cab fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" id="form3Example1c" class="form" name = "price" value = <%out.print(session.getAttribute("Vtypeval")); %> />
                      <label class="form-label" for="form3Example1c">Price per Kilo Meter</label>
                    </div>
                  </div>


                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                  	<input type="submit" class="btn btn-primary btn-lg" value = "Update">
                    
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

<jsp:include page="footer.jsp"></jsp:include>