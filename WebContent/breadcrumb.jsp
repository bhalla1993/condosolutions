<%@ page import="com.condosolutions.beans.User" %>

<script type="text/javascript">
function performAction(option1)
{
return performAction(option1,"","","");
}
function performAction(option1,option2)
{
return performAction(option1,option2,""","");
}
function performAction(option1,option2,option3)
{
return performAction(option1,option2,option3,"");
}
function performAction(option1,option2,option3,option4)
{
var f=document.myForm;

if(option1=="myProfile")
{
f.action="home";	
}
f.submit();		
}
</script>


<%
User user=null;
String username="",firstName="",lastName="",fullName="";
	
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
}
%>
<div style="width:100%;border-bottom:0.5px solid grey;">
<p style="margin:5px;font-family: sans-serif;font-style: italic;font-weight:lighter;">
  <a onclick="javascript:performAction('myProfile')" style="margin-left:15px;text-decoration:underline;cursor:pointer">My Profile</a> > <%=fullName%>
</p> 
</div>