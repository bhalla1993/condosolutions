<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Nationwide Security</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<script>
function submitForm()
{
	var f=document.loginForm;

	if(f.login.value=="")
	{
	alert("Please enter username to proceed.");
	return false;
	}
	else if(f.password.value=="")
	{
		alert("Please enter password to proceed.")
	}
	else
	{
		f.submit();
	}
	
}

</script>
<style type="text/css">
.errroMessage
{
color:red;
}
.message
{
color:#57b846;
}
</style>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-10 p-b-50">
				<form name="loginForm" method="post" class="login100-form validate-form" action="authenticate">
					<span class="login100-form-title p-b-50">
						Nationwide Security Employee Portal
					</span>
					<span class="login100-form-avatar">
						<img src="images/avatar-01.png" alt="AVATAR" title="Nationwide Security">
					</span>
						
					<p>
					<span class="errroMessage"><%=request.getAttribute("errorMessage")!=null && request.getAttribute("errorMessage")!="" ?request.getAttribute("errorMessage"):""%></span>
					<span class="message"><%=request.getAttribute("message")!=null && request.getAttribute("message")!="" ?request.getAttribute("message"):""%></span>
					
					</p>	
						
					<div class="wrap-input100 validate-input m-t-50 m-b-25" data-validate = "Enter username">
						<input class="input100" type="text" name="username">
						<span class="focus-input100" data-placeholder="Username"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-25" data-validate="Enter password">
						<input class="input100" type="password" name="password">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" onclick="javascript:submitForm()">
							Login
						</button>
					</div>
										<input type="hidden" name="fromWhere" value="proceedLogin"/>
					
				</form>
	<form name="forgotPasswordForm" action="forgot" method="post">
		
					<ul class="login-more p-t-50">
						<li class="m-b-8">
							<span class="txt1">
								Forgot
							</span>
							<a href="#" class="txt2">
								Username / Password?
							</a>
						</li>
						
					</ul>
					<input type="hidden" name="fromWhere" value="forgotPassword"/>
					</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>

        
        