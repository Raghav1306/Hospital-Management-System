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
<script >
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
	});

</script>
</head>
<body>
	<%@include file="./view/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Login</p>
						<form action="doctorLogin.cdac" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control" id="email">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<button type="submit" id="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
						<div class="fs-4 text-center">
						<% String abc=(String)session.getAttribute("messageDoc"); %>
						<% if (abc==null) { %>
							<h1></h1>
						<% } else { %>
								<h5> <%= session.getAttribute("messageDoc") %> </h5>
								<% } %>	
								</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="./view/footer.jsp" %>
</body>
</html>