<%@page import="com.cdac.entity.Doctors"%>
<%@page import="com.cdac.dao.DoctorDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Full Name</th>
									<th scope="col">Email</th>
									<th scope="col">City</th>
									<th scope="col">Country</th>
									<th scope="col">Mobile Number</th>
								</tr>
							</thead>
							<tbody>
								
								<c:forEach items="${ patients }" var="p">
								<tr>
									<td>${ p.patient_id}</td>
									<td>${ p.name}</td>
									<td>${ p.email}</td>
									<td>${ p.city}</td>
									<td>${ p.country}</td>
									<td>${ p.mobileno}</td>
									<td ><a href="editPatient.cdac?patient_id=${ p.patient_id}"
										class="btn btn-sm btn-primary" >Edit</a> 
										
										<a
										href="deletePatient.cdac?patient_id=${ p.patient_id}"
										class="btn btn-sm btn-danger" onclick="if(!(confirm('Are yousure want to delete this patient ?')))return false">Delete</a></td>
								</tr>							
								</c:forEach>
								
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>
	<%@include file="./view/footer.jsp" %>  
</body>
</html>