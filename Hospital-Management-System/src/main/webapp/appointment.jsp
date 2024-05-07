<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RDR Hospital</title>
<%@include file="./view/allcss.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<script type="text/javascript">
window.addEventListener('DOMContentLoaded', ()=>{
	
	let email=document.getElementById("email");
	let submit=document.getElementById("submit");
	email.addEventListener('blur',()=>{

   let email1=email.value;
    console.log(email1);
    
    if(email1==''){
    	console.log("entered if");
		//alert('Please Enter email');
		//submit.disabled=true;
	}else{
		console.log("entered else");
		ValidateEmail(email1);
	}
    
});
	
	 function ValidateEmail(email1){
			var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			if(email1.match(mailformat))
				{
					//alert("Valid email address!");	
					submit.disabled=false;
				}
			else
				{
					alert("You have entered an invalid email address!");
					email.value="";
					submit.disabled=true;
				}
	}	
	
	 let mobileno=document.getElementById("mobileno");
		
	 mobileno.addEventListener('blur',()=>{

      let mobileno1=mobileno.value;
      console.log(mobileno1);
      
      if(mobileno1=="")
		{
    	  console.log("entered if");
    	  //alert('Please Enter Mobile Number');
    		//submit.disabled=true;
		}
	else
		{
			console.log("entered else");
			phonenumber(mobileno1);
		}
	 });
	 
	 function phonenumber(mobileno1)
	 {
	   var phoneno = /^\d{10}$/;
	   if( mobileno1.match(phoneno)){
		   	submit.disabled=false;
	   }else{
	         alert("Invalid Mobile Number");
	         mobileno.value="";
	         submit.disabled=true;
	   }
	 }		
});
</script>
</head>
<body>
	<%@include file="./view/navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
		<div class="fs-4 text-center" >
			<% String abc=(String)session.getAttribute("doc"); %>
						<% if (abc==null) { %>
							<h1></h1>
						<% } else { %>
								<%= session.getAttribute("doc") %>
								<% } %>	
			</div>
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Book Appointment</p>						
						
						<form action="bookAppointPat.cdac" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="name" class="form-control">
							</div>


							<div class="mb-3">
								<label class="form-label">Email</label> <input required
									name="email" id="email" type="email" class="form-control">
							</div>	
							<div class="md-3">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									required class="form-control" name="doct" >
									<option value="">--select--</option>
									<c:forEach items="${ doctors }" var="d">
									<option value=${ d.doctor_id }>${ d.getName() }</option>									
									</c:forEach>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">City</label> <input type="text"
									required name="city" class="form-control">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input type="text"
									required name="mobileno" id="mobileno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Country</label> <input type="text"
									required name="country" class="form-control">
							</div>

							<button type="submit" id="submit" class="btn btn-success offset-md-5">Submit</button>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@include file="./view/footer.jsp" %>
</body>
</html>