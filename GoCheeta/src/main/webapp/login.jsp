<jsp:include page="header.jsp">
	<jsp:param name="title" value="Login"/>
</jsp:include>

<div class="login-out">
		<br>
        <div class="login">
        <div class="row d-flex align-items-center justify-content-center h-100">
                <div class="col-md-8 col-lg-7 col-xl-6">
                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                    class="img-fluid" alt="Phone image">
                </div>

        </div>
        <br><br><br>
            <!-- Pills navs -->
            <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="tab-login" data-mdb-toggle="pill" href="#pills-customer" role="tab"
                        aria-controls="pills-customer" aria-selected="true">Login As Customer</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab-register" data-mdb-toggle="pill" href="#pills-admin" role="tab"
                        aria-controls="pills-admin" aria-selected="false">Login As Admin</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="tab-register" data-mdb-toggle="pill" href="#pills-driver" role="tab"
                        aria-controls="pills-admin" aria-selected="false">Login As Driver</a>
                </li>
            </ul>
            <!-- Pills navs -->

            <!-- Pills content -->
            <div class="tab-content">
                <div class="tab-pane fade show active" id="pills-customer" role="tabpanel" aria-labelledby="tab-login">
                    <form action = "cuslogin" method = "POST">
                        <!-- customer -->
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" id="loginName" class="form-control" name = "email" required/>
                            <label class="form-label" for="loginName">Email</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" id="loginPassword" class="form-control" name = "password" required/>
                            <label class="form-label" for="loginPassword">Password</label>
                        </div>


                        <!-- Submit button -->
                       <button type="submit" class="btn btn-primary btn-block mb-4" value = "Sign in">Login</button>

                        <!-- Register buttons -->
                        <div class="text-center">

                        </div>
                    </form>
                    <div class="row mb-4">
                        <p>Not a member? <a href="register.jsp">Register</a></p>
                    </div>
                </div>
                
                <div class="tab-pane fade" id="pills-admin" role="tabpanel" aria-labelledby="tab-register">
                    <form action = "adminlogin" method = "POST">
                        <!-- admin -->
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" id="loginName" class="form-control" name = "email" required/>
                            <label class="form-label" for="loginName">Email</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" id="loginPassword" class="form-control" name = "password" required/>
                            <label class="form-label" for="loginPassword">Password</label>
                        </div>

                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-block mb-4" value = "Sign in">Login</button>

                        <!-- Register buttons -->
                    </form>
                </div>
                
                <div class="tab-pane fade" id="pills-driver" role="tabpanel" aria-labelledby="tab-register">
                    <form action = "driverLogin" method = "POST">
                        <!-- admin -->
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" class="form-control" name = "email" required/>
                            <label class="form-label" for="loginName">Email</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" class="form-control" name = "password" required/>
                            <label class="form-label" for="loginPassword">Password</label>
                        </div>

                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-block mb-4" value = "Sign in">Login</button>

                        <!-- Register buttons -->
                    </form>
                </div>
            </div>
            <!-- Pills content -->

        </div>
    </div>

<jsp:include page="footer.jsp"></jsp:include>