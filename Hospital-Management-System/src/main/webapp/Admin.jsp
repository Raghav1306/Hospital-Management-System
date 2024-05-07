<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RDR Hospital</title>
<%@include file="./view/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="./admin/navbar.jsp"%>
		<div class="row">
		<div class="fs-4 text-center" >
			<% String abc=(String)session.getAttribute("addDoc"); %>
						<% if (abc==null) { %>
							<h1></h1>
						<% } else { %>
								<%= session.getAttribute("addDoc") %>
								<% } %>	
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><h1>${ doctorAvail }</h1>
						</p>
					</div>
				</div>
			</div>



			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							Patient <br> <h1>${ patientAvail }</h1> 
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><h1>${ appointmentAvail }</h1> 
						</p>
					</div>
				</div>
			</div>

	</div>
		<%@include file="./view/footer.jsp" %>
		<% session.setAttribute("addDoc",null); %>    <%--to not display doctor already registered again when not required --%>
</body>
</html>