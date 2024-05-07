<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RDR Hospital</title>
<%@include file="./view/allcss.jsp" %>
</head>
<body>
<%@include file="./view/navbar.jsp" %>
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/dr8.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
    <div class="carousel-item">
      <img src="img/dr5.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
    <div class="carousel-item">
      <img src="img/dr7.jpg" class="d-block w-100" alt="..." height="500px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div class="container p-3">
		<p class="text-center fs-2 ">Key Features of our Hospital</p>

		<div class="row">
			<div class="col-md-12 p-2">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
									Voluptatem, inventore</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
			
			<div class="container p-2">
		<p class="text-center fs-2 ">Our Team</p>
		
		<div class="row">
	
			
			
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="./img/raghav.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Raghavendra Joshi</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="./img/rushikesh1.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Rushikesh Godse</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="./img/divyani.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Divyani Ingale</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

		</div>

	</div>
	<%@include file="./view/footer.jsp" %>
	<% session.setAttribute("message",null); %>	 <!-- for adminlogin to not show Incorrect password -->
</body>
</html>