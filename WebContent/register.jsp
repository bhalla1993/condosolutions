
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="com.condosolutions.beans.User" %>
<%@ page import="com.condosolutions.utils.StringUtils" %> 
<%@ page import="java.util.HashMap" %>

<%
boolean fromProfile=false;

System.out.println("fromProfile in jsp : "+request.getAttribute("fromProfile"));
if(request.getAttribute("fromProfile")!=null)
	fromProfile=true;
%>
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
#mainTable{
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 50%;
  margin-top:10px;
} 

#mainTable td {
  border: 1px solid #ddd;
  padding: 8px;
  word-break:break-all;
  
}
#outerDiv
{
width:90%;
margin-left:5%; 
margin-top:20px;
background-color:#eeeee0; 
min-height: 500px;
}       
.rows 
{
width:100%;
float:left;
background-color:lightgray; 
text-align: center;

}
.contentDiv
{
width:100%;
float:left;
background-color:#eeeee0;
height:100%;
}
.notesDiv
{
width:90%;
margin-left:50px;
margin-top:10px;
background-color:lightblue;
border-radius:5px;
float:left;
color:black;
}
input[type=text],input[type=password], input[type=date],input[type=email],select, textarea {
  width: 90%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type="submit"]
{
background: #0066A2;
color: white;
border-style: outset;
border-color: #0066A2;
height: 35px;
width: 30%; 
font: bold 15px arial, sans-serif;
text-shadow:none;
cursor:pointer;
}
.mandatoryField
{
color:red;
}
</style>
<script>
function submitForm(uName,action)
{

var f=document.registerForm;
var userName,pass,conPass,fName,lName,sex,dOB,email,phone,add;
	
	if(action=='edit')
	{
		f.forEdit.value="yes";
		f.userForEdit.value=uName;
		
		if(<%=fromProfile%>)
		{
			f.fromProfile.value="yes";
		}
	}
	else
	{
		userName=f.username.value;
		pass=f.password.value;
		conPass=f.confirmPassword.value;
	
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
	
	}
	
	fName=f.firstName.value;
	lName=f.lastName.value;
	sex=f.sex.value;
	dOB=f.dateOfBirth.value;
	email=f.emailAddress.value;
	phone=f.phoneNumber.value;
	add=f.address.value;

	
if(fName=="" || fName=="undefined" || fName==null)
{	alert("Please enter First Name to proceed.");
	f.firstName.focus();
	return false;
}	

//alert("Username: "+userName+" Password: "+pass+" firstName: "+fName+" LastName: "+lName+" sex: "+sex+" DOB:"+dOB+" email:"+email+" phone:"+phone+" address:"+add);

f.action="register";
f.submit();
}
</script>
</head>
<body>
<%
User editUser=null;
boolean isEdit=false;
if(request.getAttribute("userForEdit")!=null)
{
	editUser=(User)request.getAttribute("userForEdit");
	
	if(editUser!=null)	
	{
		isEdit=true;
	}
}


%>
<div id="outerDiv">
<div class="rows">
<%if(isEdit){%>
<h3>Edit User</h3>
<%}else{%>
<h3>Add User</h3>
<%}%>
</div>

<div class="contentDiv">
<div class="notesDiv">
<p style="margin-left:10px">Notes:</p>
<p style="margin-left:10px">1. Fields marked with <span class="mandatoryField">*</span> are mandatory fields. </p>
</div>

				<form name="registerForm" method="post" class="login100-form validate-form" action="">
					<input type="hidden" name="fromProfile" value=""/>
					<div style="margin-top:10px;float:left;text-align:center;width:100%">
					<table  align="center" id="mainTable">
					
					<tr>
					<td class="leftSideTD">Username<span class="mandatoryField">*</span>:</td>
					<%if(isEdit){%>
					<td><%=editUser.getUsername()%></td>
					<%}else{ %>
					<td><input type="text" name="username" placeholder="Choose Username"/></td>
					<%} %>
					</tr>
					<%if(!isEdit){%>
					<tr>
					<td class="leftSideTD">Password<span class="mandatoryField">*</span>:</td>
					<td><input type="password" name="password" placeholder="Choose Password"/></td>
					</tr>
					<tr>
					<td class="leftSideTD">Confirm Password<span class="mandatoryField">*</span>:</td>
					<td><input type="password" name="confirmPassword" placeholder="Confirm Password"/></td>
					</tr>
					<%} %>
					
					<tr>
					<td class="leftSideTD">First Name<span class="mandatoryField">*</span>:</td>
					<td>	
					<%if(isEdit){%>
					<input type="text" name="firstName" value="<%=editUser.getFirstName()%>"/>
					<%}else{ %>
					<input type="text" name="firstName" placeholder="First Name"/>
					<%} %>
					</td>
					</tr>
					<tr>
					<td class="leftSideTD">Last Name:</td>
					<td>
					<%if(isEdit){%>
					<input type="text" name="lastName" value="<%=editUser.getLastName()%>"/>
					<%}else{ %>
					<input type="text" name="lastName" placeholder="Last Name"/>
					<%} %>
					</td>
					</tr>
					<tr>
					<td class="leftSideTD">Sex:</td>
					<td>
					<%if(isEdit){
					if("M".equals(editUser.getSex())){
					%>
					<input type="radio" value="M" name="sex" checked="checked"/>Male
					<input type="radio" value="F" name="sex"/>Female
					<%}else{ %>
					<input type="radio" value="M" name="sex"/>Male
					<input type="radio" value="F" name="sex" checked="checked"/>Female
					<%} %>
					<%}else{ %>
					<input type="radio" value="M" name="sex" checked="checked"/>Male
					<input type="radio" value="F" name="sex"/>Female
					<%} %>
					</td>
					</tr>
					<tr>
					<td class="leftSideTD">Date Of Birth:</td>
					<td>
					<%if(isEdit){%>
					<input type="date" name="dateOfBirth" value="<%=editUser.getDateOfBirth()%>">
					<%}else{ %>
					<input type="date" name="dateOfBirth" placeholder="Choose Date Of Birth">
					<%} %>
					</td>
					</tr>
					<tr>
					<td class="leftSideTD">Email Address:</td>
					<td>
					<%if(isEdit){%>
					<input type="email" name="emailAddress" value="<%=editUser.getEmail()%>"/>
					<%}else{ %>
					<input type="email" name="emailAddress" placeholder="Email Address"/>
					<%} %>
					</td>
					</tr>
					<tr>
					<td class="leftSideTD">Phone Number:</td>
					<td>
					<%if(isEdit){%>
					<input type="text" name="phoneNumber" value="<%=editUser.getPhone()%>" />
					<%}else{ %>
					<input type="text" name="phoneNumber" placeholder="Phone Number"/>
					<%} %>
					</td>
					</tr>
					<tr>
					<td class="leftSideTD">Address:</td>
					<td>
					<%if(isEdit){%>
					<textarea name="address" rows="5" cols="20"><%=editUser.getAddress()%></textarea>
					<%}else{ %>
					<textarea name="address" placeholder="Enter Address" rows="5" cols="20"></textarea>
					<%} %>
					</td></tr>
					<tr>
					<td colspan="2">
					<%if(isEdit){%>
					<input type="submit" value="Edit Changes" onclick="return submitForm('<%=editUser.getUsername()%>','edit')" />
					<%}else{%>
					<input type="submit" value="Register" onclick="return submitForm('','')" />
					<%} %>
					</td>
					</tr>
					</table>	
					</div>		
					<input type="hidden" name="fromWhere" value="processRegistration"/>
					<input type="hidden" name="forEdit" value=""/>
					<input type="hidden" name="userForEdit" value=""/>
					
					
				</form>
			
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