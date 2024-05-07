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
						<p class="fs-3 text-center">Appointment Details</p>
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Doctor Name</th>
									<th scope="col">Doctor Contact Number</th>
									<th scope="col">Doctor Email</th>
									<th scope="col">Patient Name</th>	
								</tr>
							</thead>
							<tbody>								
								<c:forEach items="${ patients }" var="p">
									<tr>
										<td>${ p.getDoctors().getName()}</td>
										<td>${ p.getDoctors().getMobileno()}</td>
										<td>${ p.getDoctors().getEmail()}</td>
										<td>${ p.getName()}</td>
									</tr>							
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>