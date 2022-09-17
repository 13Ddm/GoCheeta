<jsp:include page="header.jsp">
	<jsp:param name="title" value="Set Status"/>
</jsp:include>

<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Status</p>

				<%
					String bid = (String)request.getParameter("bid");
					System.out.print(bid);
				%>
                <form class="mx-1 mx-md-4" action = "setStatus" method = "POST">
					<div class="form-outline mb-4">
                            <input type="text" id="loginName" class="form-control" name = "bid" value ="<%out.print(bid); %>" hidden/>
                        </div>
					<!-- Default radio -->
					<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                 		 <div class="form-check">
						  <select class="select" name = "status">
							  <option value="Pending">Pending</option>
							  <option value="Decline">Decline</option>
							  <option value="Accpected">Accpected</option>
							  <option value="On The Way">On The Way</option>
							  <option value="Picked Up">Picked Up</option>
							  <option value="Dropped">Dropped</option>
							  <option value="Completed">Completed</option>
							</select>
						</div>
                    
                  	</div>
						
					
                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                  	<input type="submit" class="btn btn-primary btn-lg" value = "Set Status">
                    
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