<%@ page import="com.condosolutions.beans.User" %>
<%@ page import="com.condosolutions.utils.Constants"%>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #57b846;
 }
li {
  float: right;
  width: 100px; 
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
 
li a:hover {
  background-color: #111;
}
.leftDiv
{
width:30%; 
float:left;
margin:20px;
}
.leftDiv img
{
margin-left: 40px;
}
.rightDiv
{
width:65%; 
float:left;
/*border:1px solid green;*/
height:100px;
}
#firstRoundDiv{
width:10%;
height:90%;
float:left;
margin-left:100px;
margin-top:5px;
}
.imgDiv
{
width:100%;
height:70%;
border-radius:50%;
border:1px solid grey;
}
.imgDiv img
{
margin-left: 12px;
margin-top: 10px;
width: 70%;
height: 70%;
}
.textDiv
{
color:brown;margin-top:3px;
cursor:pointer !important;
width:100%;
height:28%;
text-align:center;
font-family: sans-serif;
font-size:12px;
font-weight:bold;
}
.secondRoundDivs
{
width:10%;  
height:90%;
float:left;
margin-left:15px;
margin-top:5px;

}

</style>
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

<div class="leftDiv">
<img src="images/avatar-03.jpg" alt="AVATAR" title="Nationwide Security">
</div>

<div class="rightDiv">
    
 <form name="modulesAction" action="" method="post">
<div id="firstRoundDiv">
<div class="imgDiv"><img src="images/profilePic.png" alt="AVATAR" title="Profile"></div>
<div class="textDiv" onclick="javascript:performActions('myProfile')">My Profile</div>
</div>

<div class="secondRoundDivs">
<div class="imgDiv"><img  src="images/emps.png" alt="AVATAR" title="Employees"></div>
<div class="textDiv">Employees</div>
</div>
<div class="secondRoundDivs">
<div class="imgDiv"><img src="images/locations.png" alt="AVATAR" title="Locations"></div>
<div class="textDiv" onclick="javascript:performActions('locations')">Locations</div>
</div>
<div class="secondRoundDivs">
<div class="imgDiv"><img src="images/activities.png" alt="AVATAR" title="Actions"></div>
<div class="textDiv">Actions</div>
</div>

<div class="secondRoundDivs">
<div class="imgDiv"><img src="images/settings.png" alt="AVATAR" title="Settings"></div>
<div class="textDiv" onclick="javascript:performActions('settings')">Settings</div>
</div>

<div class="secondRoundDivs">
<div class="imgDiv"><img src="images/logout.png" alt="AVATAR" title="Logout"></div>
<div class="textDiv" onclick="javascript:performActions('logout')">Logout</div>
</div> 

</form>
</div>

<div style="width:100%; float:left;border:0px solid yellow;height:40px;background-color:#57b846;color:white">
<%@  include file="subMenu.jsp" %>
</div>
<script type="text/javascript">
function performActions(s)
{	
var f=document.modulesAction;
if(s=="logout")
{
f.action="logout";
}
if(s=="myProfile")
{
	f.action="home";	
}
if(s=="locations")
{
	f.action="locations";
}
f.submit();
}
</script>
