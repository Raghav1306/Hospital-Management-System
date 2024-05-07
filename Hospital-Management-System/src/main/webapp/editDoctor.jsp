<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
	<%@include file="./admin/navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor</p>
						
						<form:form action="updateDoctor.cdac" modelAttribute="doctors" method="POST">
							
							<form:hidden path="doctor_id"/>
											
							<div class="mb-3">
								<label class="form-label">Full Name</label> 
								<form:input path="name" class="form-control" name="name" placeholder="Enter name"/> 
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile Number</label>
								 <form:input path="mobileno" name="mobileno" id="mobileno" class="form-control" placeholder="Enter Mobile Number"/>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Email</label>
								 <form:input path="email" name="email" id="email" class="form-control" placeholder="Enter Email"/>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								 <form:input path="speciality" name="speciality" class="form-control" placeholder="Enter Speciality"/>
							</div>
							
							<div class="mb-3">
								<label class="form-label">City</label>
								 <form:input path="city" name="city" class="form-control" placeholder="Enter City"/>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Country</label>
								 <form:input path="country" name="country" class="form-control" placeholder="Enter Country"/>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label>
								 <form:input path="password" name="password" class="form-control" placeholder="Enter Password"/>
							</div>			

							<button type="submit" id="submit" class="btn btn-primary">Submit</button>
						</form:form>
					</div>
				</div>
			</div>


		</div>
	</div>
	<%@include file="./view/footer.jsp" %>
</body>
</html>