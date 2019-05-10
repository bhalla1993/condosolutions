<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.condosolutions.beans.User" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<script type="text/javascript">
function userAction(uName,action)
{
var f=document.actionForm;

if(action=="edit")
{
	
	f.forEdit.value="yes";
	f.userForEdit.value=uName;
	f.fromProfile.value="yes";
	f.submit();	
}

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
String username="",firstName="",lastName="",fullName="",dob="",email="",sex="",phone="",address="",creationDate="",updationDate="",isActivate="";
HashMap<String,User> userMap=(HashMap<String,User>)request.getAttribute("userMap");
System.out.println("UserMap is: "+userMap);

if(userMap.size()>0)
{
	for(int i=0;i<userMap.size();i++)
	{
	User u=userMap.get(i+"");
	
	username=u.getUsername();
	firstName=u.getFirstName();
	lastName=u.getLastName();
	fullName=u.getFullName();
	sex=u.getSex();
	dob=u.getDateOfBirth();
	email=u.getEmail();
	phone=u.getPhone();
	address=u.getAddress();
	creationDate=u.getCreationDate();
	updationDate=u.getUpdationDate();
	isActivate=u.getIsActivate();
	}
}

%>
<div id="outerDiv">
<div class="rows">
<h3  style="text-align:center;">Profile: <%=fullName%></h3>
</div>
<div style="height:30px;float:left;width:100%;">
<div style="width:100%;float:right;margin-top:10px;font-weight:bolder;">
<span style="color:green" id="msg">
<%if(request.getAttribute("message")!=null){%><%=request.getAttribute("message")%><%}%>
</span>
</div>
</div>


	<%if(userMap.size()>0){ %>
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
	<tr><th>Activate:</th><td><%=isActivate%></td></tr>	
	<tr><th>Added On:</th><td><%=creationDate%></td></tr>	
	<tr><th>Last Modified On:</th><td><%=updationDate%></td></tr>	
	
	</tbody>
	</table>
	
	<form name="actionForm" method="post" action="register">
	<input type="hidden" name="fromWhere" value="openRegisterPage"/>
	<input type="hidden" name="forEdit" value=""/>
	<input type="hidden" name="fromProfile" value=""/>
	<input type="hidden" name="userForEdit" value=""/>
	
	<div>
	<input type="submit" name="submit" value="Update Profile" onclick="javascript:return userAction('<%=username%>','edit')"/>
	</div>
	</form>
	<%} %>
  
</div>

</body>
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script>
setTimeout(function() {
	 $('#msg').fadeOut();
	 
	}, 3000 );
</script>
</html>