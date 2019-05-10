
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
td
{
padding: 12px 12px 12px 0;
margin: 10px;
width: 400px;
}
.mandatoryField
{
color:red;
line-height: 0.5;
font-size: 12px;
}
input[type=text],input[type=password], input[type=date],input[type=email],select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}
.leftSideTD
{
width:150px;
} 
input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 70%;
  float:right;
}
</style>
<script>
function submitForm()
{

var f=document.registerForm;
var userName,pass,conPass,fName,lName,sex,dOB,email,phone,add;

	userName=f.username.value;
	pass=f.password.value;
	conPass=f.confirmPassword.value;
	fName=f.firstName.value;
	lName=f.lastName.value;
	sex=f.sex.value;
	dOB=f.dateOfBirth.value;
	email=f.emailAddress.value;
	phone=f.phoneNumber.value;
	add=f.address.value;

	if(userName=="" || userName=="undefined" || userName==null)
	{	
		alert("Please enter username to proceed.");
        f.username.focus();
		return false;
	}

$.ajax({
    type: 'POST',
    async: false,
    dateType: 'text',
    url:'ajaxSearch?dataSet=checkUsernameExists&param='+userName,
    success: function(response)
    {
    	if(response.trim()=="true")
        {
            alert("Username already exists. Please choose another one.");
            f.username.focus();
			return false;	
        }
   }});


if(pass=="" || pass=="undefined" || pass==null)
{	alert("Please enter password to proceed.");
	f.password.focus();
	return false;
}	
if(conPass=="" || conPass=="undefined" || conPass==null)
{	alert("Please enter Confirm Password to proceed.");
	f.confirmPassword.focus();
	return false;
}	
if(pass!=conPass)
{
	alert("Password and Confirm Password do not match. Please fill it again.");
	f.password.focus();
	return false;
}
if(fName=="" || fName=="undefined" || fName==null)
{	alert("Please enter First Name to proceed.");
	f.firstName.focus();
	return false;
}	

alert("Username: "+userName+" Password: "+pass+" firstName: "+fName+" LastName: "+lName+" sex: "+sex+" DOB:"+dOB+" email:"+email+" phone:"+phone+" address:"+add);

f.action="register";
f.submit();

}
</script>
</head>
<body>
<div class="limiter">
		<div class="container-login100" >
			<div class="wrap-login100 p-t-10 p-b-50" style="border:1px solid black">
				<form name="registerForm" method="post" class="login100-form validate-form" action="">
					
					<p style="text-align:right;">Fields marked with <span class="mandatoryField">*</span> are mandatory fields.</p>
					<table align="center">
					<tr>
					<td colspan="2" style="text-align:center"><h3>User Registration</h3></td>
					</tr>
					<tr>
					<td class="leftSideTD">Choose Username<span class="mandatoryField">*</span>:</td>
					<td><input type="text" name="username" placeholder="Choose Username"/></td>
					</tr>
					<tr>
					<td class="leftSideTD">Choose Password<span class="mandatoryField">*</span>:</td>
					<td><input type="password" name="password" placeholder="Choose Password"/></td>
					</tr>
					<tr>
					<td class="leftSideTD">Confirm Password<span class="mandatoryField">*</span>:</td>
					<td><input type="password" name="confirmPassword" placeholder="Confirm Password"/></td>
					</tr>
					<tr>
					<td class="leftSideTD">First Name<span class="mandatoryField">*</span>:</td>
					<td><input type="text" name="firstName" placeholder="First Name"/></td>
					</tr>
					<tr>
					<td class="leftSideTD">Last Name:</td>
					<td><input type="text" name="lastName" placeholder="Last Name"/></td>
					</tr>
					<tr>
					<td class="leftSideTD">Choose Sex:</td>
					<td>
					<input type="radio" value="M" name="sex" checked="checked"/>Male
					<input type="radio" value="F" name="sex"/>Female
					</td>
					</tr>
					<tr>
					<td class="leftSideTD">Date Of Birth:</td>
					<td><input type="date" name="dateOfBirth" placeholder="Choose Date Of Birth"></td>
					</tr>
					<tr>
					<td class="leftSideTD">Email Address:</td>
					<td><input type="email" name="emailAddress" placeholder="Email Address"/></td>
					</tr>
					<tr>
					<td class="leftSideTD">Phone Number:</td>
					<td><input type="text" name="phoneNumber" placeholder="Phone Number"/></td>
					</tr>
					<tr>
					<td class="leftSideTD">Address:</td>
					<td><textarea name="address" placeholder="Enter Address" rows="5" cols="20"></textarea></td></tr>
					<tr>
					<td colspan="2"><input type="submit" value="Register" onclick="return submitForm()" /></td>
					</tr>
					</table>			
					<input type="hidden" name="fromWhere" value="processRegistration"/>
					
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