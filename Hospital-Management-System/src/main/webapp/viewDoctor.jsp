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
						<p class="fs-3 text-center">Doctor Details</p>
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">NAME</th>
									<th scope="col">MOBILE NUMBER</th>
									<th scope="col">EMAIL</th>
									<th scope="col">SPECIALIST</th>
									<th scope="col">CITY</th>
									<th scope="col">COUNTRY</th>
								</tr>
							</thead>
							<tbody>
								
								<c:forEach items="${ doctors }" var="d">
								<tr>
									<td>${ d.getDoctor_id()}</td>
									<td>${ d.getName()}</td>
									<td>${ d.getMobileno()}</td>
									<td>${ d.getEmail()}</td>
									<td>${ d.getSpeciality()}</td>
									<td>${ d.getCity()}</td>
									<td>${ d.getCountry()}</td>
									<td><a href="editDoctor.cdac?id=${ d.getDoctor_id()}"
										class="btn btn-sm btn-primary">Edit</a> 
										
										<a
										href="deleteDoctor.cdac?doctor_id=${ d.getDoctor_id()}" class="btn btn-sm btn-danger" 
										onclick="if(!(confirm('Are yousure want to delete this doctor ?')))return false">Delete</a>
										</td>
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