<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.condosolutions.beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<script type="text/javascript">
function performAction(s)
{
var f=document.myForm;

if(s=="myProfile")
{
f.action="home";	
}
f.submit();		
}
</script>
<style type="text/css">
#locations{
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#locations th
{
width:30%;
}
#locations td, #locations th {
  border: 1px solid #ddd;
  padding: 8px;
}

#locations tr:nth-child(even){background-color: #f2f2f2;}

#locations tr:hover {background-color: #ddd;}

#locations th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

#outerDiv
{
width:70%;
margin-left:200px; 
margin-top:20px;
background-color:#eeeee0; 
min-height: 500px;
}       
.rows 
{
width:100%;
float:left;
background-color:lightgray;   
}
input[type="submit"]
{
background: #0066A2;
color: white;
border-style: outset;
border-color: #0066A2;
height: 50px;
width: 200px;
font: bold 15px arial, sans-serif;
text-shadow:none;
float:left;
margin-top:10px;
} 
</style>
</head>
<body>
<%
User user=null;

String username="",firstName="",lastName="",fullName="",dob="",email="",sex="",phone="",address="",creationDate="",updationDate="";

int id=0;
	
if(session.getAttribute("user")!=null)
{
user=(User)session.getAttribute("user");
}

if(user!=null)
{
username=user.getUsername();
firstName=user.getFirstName();
lastName=user.getLastName();
fullName=user.getFullName();
sex=user.getSex();

if("M".equals(sex))
	sex="Male";
else if("F".equals(sex))
	sex="Female";

email=user.getEmail();
phone=user.getPhone();
dob=user.getDateOfBirth();
address=user.getAddress();
creationDate=user.getCreationDate();
updationDate=user.getUpdationDate();
}
%>

<div style="width:100%;border-bottom:0.5px solid grey;">
<p style="margin:5px;font-family: sans-serif;font-style: italic;font-weight:lighter;">
  <a onclick="javascript:performAction('myProfile')" style="margin-left:15px;text-decoration:underline;cursor:pointer">My Profile</a> > <%=fullName%>
</p> 
</div>

<div id="outerDiv">
<div class="rows">
<h3  style="text-align:center;">Profile: <%=fullName%></h3>
</div>

	<table id="locations" border="1" class="key-value-table">
	<tbody>
	<tr><th>Username:</th><td><%=username%></td></tr>	
	<tr><th>First Name:</th><td><%=firstName%></td></tr>	
	<tr><th>Last Name:</th><td><%=lastName%></td></tr>	
	<tr><th>Sex:</th><td><%=sex%></td></tr>	
	<tr><th>Date Of Birth:</th><td><%=dob%></td></tr>	
	<tr><th>Email:</th><td><%=email%></td></tr>	
	<tr><th>Phone:</th><td><%=phone%></td></tr>	
	<tr><th>Address:</th><td><%=address%></td></tr>	
	<tr><th>Added On:</th><td><%=creationDate%></td></tr>	
	<tr><th>Last Modified On:</th><td><%=updationDate%></td></tr>	
	</tbody>
	</table>
	<div>
	<input type="submit" name="submit" value="Update Profile" onclick="javascript:return updateProfile()"/>
	<input style="margin-left:10px;" type="submit" name="cancel" value="Cancel" onclick="javascript:return cancelForm()"/>	
	</div>
  
</div>

<form action="" name="myForm" method="post">
<input type="hidden" name="fromWhere" value="showProfile"/>
</form>


</body>
</html>