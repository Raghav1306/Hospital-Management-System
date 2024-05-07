<%@ page language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RDR Hospital</title>
</head>
<body>
<% session.removeAttribute("Admin"); 
		 session.setAttribute("succMsg", "Admin Logout Sucessfully");
	
%>
		<%@include file="index.jsp"%>
		
</body>
</html>