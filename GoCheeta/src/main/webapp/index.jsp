<jsp:include page="header.jsp">
	<jsp:param name="title" value="Home"/>
</jsp:include>

<!-- Carousel wrapper -->
<div id="carouselBasicExample" class="carousel slide carousel-fade" data-mdb-ride="carousel">
  <!-- Indicators -->
  <div class="carousel-indicators">
    <button
      type="button"
      data-mdb-target="#carouselBasicExample"
      data-mdb-slide-to="0"
      class="active"
      aria-current="true"
      aria-label="Slide 1"
    ></button>
    <button
      type="button"
      data-mdb-target="#carouselBasicExample"
      data-mdb-slide-to="1"
      aria-label="Slide 2"
    ></button>
    <button
      type="button"
      data-mdb-target="#carouselBasicExample"
      data-mdb-slide-to="2"
      aria-label="Slide 3"
    ></button>
    <button
      type="button"
      data-mdb-target="#carouselBasicExample"
      data-mdb-slide-to="3"
      aria-label="Slide 4"
    ></button>
  </div>

  <!-- Inner -->
  <div class="carousel-inner">
    <!-- Single item -->
    <div class="carousel-item active">
      <img src="img/dan.jpg" class="d-block w-100" alt="Sunset Over the City"/>
      <div class="carousel-caption d-none d-md-block">
        <h3 class="display-6">We have Friendly Drivers at Your Service &#128512;</h3>
      </div>
    </div>

    <!-- Single item -->
    <div class="carousel-item">
      <img src="img/ella.jpg" class="d-block w-100" alt="Canyon at Nigh"/>
      <div class="carousel-caption d-none d-md-block">
        <h3 class="display-6">Wide Range of Vehicles for Your Desire &#128653;</h3>
      </div>
    </div>

    <!-- Single item -->
    <div class="carousel-item">
      <img src="img/hitesh.jpg" class="d-block w-100" alt="Cliff Above a Stormy Sea"/>
      <div class="carousel-caption d-none d-md-block">
        <h3 class="display-6">Quick Service to Save Your Time &#128336;</h3>
      </div>
    </div>
  
  <!-- Single item -->
    <div class="carousel-item">
      <img src="img/lexi.jpg" class="d-block w-100" alt="Cliff Above a Stormy Sea"/>
      <div class="carousel-caption d-none d-md-block">
        <h3 class="display-6">We are Available on 24/7 &#129310;</h3>
      </div>
    </div>
  </div>
  <!-- Inner -->

  <!-- Controls -->
  <button class="carousel-control-prev" type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-mdb-target="#carouselBasicExample" data-mdb-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<!-- Carousel wrapper -->
<br><br><br>
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-6 d-flex justify-content-center">
        <div class="card">
          <img src="img/login.jpg" class="card-img-top" alt="Fissure in Sandstone"/>
          <div class="card-body">
            <h2 class="display-5" class="card-title">Registered User?</h2>
            <p class="card-text">Click the button to login!!</p>
            <a href="login.jsp" class="btn btn-primary">Login</a>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 d-flex justify-content-center">
        <div class="card">
          <img src="img/sign.jpg" class="card-img-top" alt="Fissure in Sandstone"/>
          <div class="card-body">
            <h5 class="display-5" class="card-title">New Customer?</h5>
            <p class="card-text">Click the button to register!!</p>
            <a href="register.jsp" class="btn btn-primary">Register</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  
  
<jsp:include page="footer.jsp"></jsp:include>