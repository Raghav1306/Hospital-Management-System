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
	
	let submit=document.getElementById("submit");
	
	let name=document.getElementById("name");
	name.addEventListener('blur',()=>{

	   let name1=name.value;
	    console.log(name1);
	    
	    if(name1==''){
	    	console.log("entered if");
			//alert('Please Enter email');
			//submit.disabled=true;
		}else{
			console.log("entered else");
			ValidateName(name1);
		}
    
	});
	
		function ValidateName(name1){
		    var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
		    
		    if(name1.match(regName)){
				//alert("Valid email address!");	
				submit.disabled=false;
			}else{
				alert("You have entered an invalid Name!");
				name.value="";
				submit.disabled=true;
			}
		}
	
	let email=document.getElementById("email");
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
						<p class="fs-3 text-center">Add Doctor</p>
						
						
						<form action="addDoctor.cdac" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="name" id="name" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Mobile Number</label> <input type="text"
									required name="mobileno" id="mobileno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input required
									name="email" id="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <input type="text" name="speciality"
									required class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">City</label> <input type="text"
									required name="city" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Country</label> <input type="text"
									required name="country" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button  type="submit" id="submit" class="btn btn-primary offset-md-5">Submit</button>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>
	<%@include file="./view/footer.jsp" %>
</body>
</html>