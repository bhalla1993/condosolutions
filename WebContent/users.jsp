<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.condosolutions.beans.User" %>
<%@ page import="com.condosolutions.utils.StringUtils" %> 
<%@ page import="java.util.HashMap" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
<script type="text/javascript">
function toggleDiv()
{	
$(".notesDiv").slideToggle();
}
function submitFilterForm()
{
	var f=document.filterForm;
	
	var filterName,filterDate;
	filterName=f.filterName.value;
	filterDate=f.filterDate.value;
	
	f.fromWhere.value="filterUsers";
	f.action="users";
	
	f.submit();
}
function userAction(uName,action)
{
var f=document.actionForm;

if(action=="edit")
{
	
	f.forEdit.value="yes";
	f.userForEdit.value=uName;
	f.submit();	
}
if(action=="deactivate")
{
	
}
}
</script>

<style>
#mainTable{
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-top:10px;
} 

#mainTable td, #mainTable th {
  border: 1px solid #ddd;
  padding: 8px;
  word-break:break-all;
  
}

#mainTable tr:nth-child(even){background-color: #f2f2f2;}

#mainTable tr:hover {background-color: #ddd;}

#mainTable th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
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
#filterTable td
{
padding:5px;
}
input[type="text"]
{
width:100%;
height:30px;
}
input[type="submit"]
{
background: #0066A2;
color: white;
border-style: outset;
border-color: #0066A2;
height: 35px;
width: 100px; 
font: bold 15px arial, sans-serif;
text-shadow:none;
cursor:pointer;
}
</style>

</head>
<body>
<div id="outerDiv">
<div class="rows">
<h3>View Users</h3>
</div>
<form name="registerUserForm" action="register" method="post">
<input type="hidden" name="fromWhere" value="openRegisterPage"/>
<div style="height:30px;float:left;width:100%;">

<div style="width:100%;float:right;margin-top:10px;font-weight:bolder;">
<a style="cursor:pointer;text-decoration:underline;float:right" id="showHideFilter" onclick="javascript:toggleDiv()">Show/Hide Filter</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a style="cursor:pointer;text-decoration:underline;float:right;margin-right:5px" onclick="javascript:document.registerUserForm.submit()">Add User</a>
<span style="color:green" id="msg">
<%if(request.getAttribute("message")!=null){%><%=request.getAttribute("message")%><%}%>
</span>
</div>  
</div>
</form> 
<div class="contentDiv">

<div class="notesDiv">
	<form name="filterForm" action="" method="post">
	<input type="hidden" name="fromWhere" value=""/>
	<table id="filterTable"> 
	<tr><td colspan="4">Filter:</td></tr>
	
	<%
	String filterName="",filterDate="";
	if(StringUtils.isValidString((String)request.getAttribute("isFilter")))
	{
		filterName=(String)request.getAttribute("filterName");
		filterDate=(String)request.getAttribute("filterDate");
	}
	%>
	<tr><td>Name:</td><td><input type="text" name="filterName" value="<%=filterName%>"/></td>
	<td>Added On:</td><td><input type="date" name="filterDate" value="<%=filterDate%>"/></td>
	</tr>
	<tr>
	<td colspan="4">
	<input type="submit" name="submit" onclick="javascript:return submitFilterForm()" value="Save"/>
	</td>
	</tr>
	</table>
	</form>
	</div>
<%
try
{

HashMap<String,User> userMap=(HashMap<String,User>)request.getAttribute("userMap");
if(userMap.size()>0)
{
	%>
	<form name="actionForm" method="post" action="register">
	<input type="hidden" name="fromWhere" value="openRegisterPage"/>
	<input type="hidden" name="forEdit" value=""/>
	<input type="hidden" name="userForEdit" value=""/>
	<div style="height:10px;width:100%;border:0px solid red;float:left"></div>
	
	<table id="mainTable">
	  <tr>
	    <th>First Name</th>
	    <th>Last Name</th>
	    <th>Sex</th>
	    <th>Date Of Birth</th>
	    <th>Email</th>
	    <th>Phone</th>
	    <th>Activate</th>
	    <th>Added On</th>	
	    <th>Action</th>		        
	  </tr>	 
	<%
	
for(int i=0;i<userMap.size();i++)
{
	User user=userMap.get(i+"");
	%>
	
	<tr> 
	<td><%=user.getFirstName()%></td>
	<td><%=user.getLastName()%></td>
	<td><%=user.getSex()%></td>
	<td><%=user.getDateOfBirth()%></td>
	<td><%=user.getEmail()%></td>
	<td><%=user.getPhone()%></td>
	<td><%=user.getIsActivate()%></td>
	<td><%=user.getCreationDate()%></td>
	<td><a style="cursor:pointer;text-decoration:underline;" onclick="javascript:return userAction('<%=user.getUsername()%>','edit')">Edit</a>
	<a style="cursor:pointer;text-decoration:underline;" onclick="javascript:return userAction('<%=user.getUsername()%>','deactivate')">Deactivate</a>
	</td>
	</tr>
	
	<%
}
%>
</table>
</form>
<%
}
else{
%>
<div style="width:100%;margin-left:50px;margin-top:150px;">
<h3>User(s) not found.</h3>
</div>
<%	
}
}catch(Exception e){ 
System.out.println("Exception in users.jsp while processing");}
%>

</div>

</div>
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
</body>
<script>
setTimeout(function() {
	 $('#msg').fadeOut();
	 
	}, 3000 );
</script>
</html>