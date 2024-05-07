<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RDR Hospital</title>
<%@include file="view/allcss.jsp" %>
</head>
<body>
<%@include file="admin/navbar.jsp" %>
		
		
		<div class="container p-2" style="margin-left:35%;;margin-top:6%; position: absolute; align-items: center;justify-content: center; display:inline;">
		
		
		<div class="row">
	
			<div class="col-md-4" style="border-color: red;">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/patlogo.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5"></p>
						<form action="viewPatient.cdac" method="post">
						<button class="btn btn-outline-success"
						type="submit"> View Patients</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>