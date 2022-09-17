<jsp:include page="/header.jsp">
	<jsp:param name="title" value="Feedback"/>
</jsp:include>

<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Feedback</p>

				<%
					String bid = (String)request.getParameter("bid");
					System.out.print(bid);
				%>
                <form class="mx-1 mx-md-4" action = "bookingfeedback" method = "POST">
					<div class="form-outline mb-4">
                            <input type="text" id="loginName" class="form-control" name = "bid" value ="<%out.print(bid); %>" hidden/>
                        </div>
					<div class="form-outline">
					  <textarea class="form-control" id="textAreaExample1" rows="4" name = "feedback"></textarea>
					  <label class="form-label" for="textAreaExample">Feedback</label>
					</div>
					
                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                  	<input type="submit" class="btn btn-primary btn-lg" value = "Set Feedback">
                    
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

<jsp:include page="/footer.jsp"></jsp:include>