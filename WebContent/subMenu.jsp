<%@page import="com.condosolutions.utils.Constants"%>
<style type="text/css">
ul li a
{
cursor:pointer;
}
</style>
<script type="text/javascript">
function submitForm(s)
{
	var f=document.subMenuForm;
	
if(s=="homeMenu")
{
	f.action="homeMenu";	
}
if(s=="shiftLogs")
{
	f.action="shiftLogs";
}
if(s=="locations")
{
	f.action="locations";
}
if(s=="usershiftlogs")
{
f.action="usershiftlogs";	
}
if(s=="pageuc")
{
f.action="pageuc";	
}
f.submit();
}

</script>

<form name="subMenuForm" method="post" action="">
<ul>
  <li style="margin-right:100px"><a onclick="javascript:return submitForm('pageuc')">Option10</a></li>
  <li><a onclick="javascript:return submitForm('pageuc')">Option8</a></li>
  <li><a onclick="javascript:return submitForm('pageuc')">Option7</a></li>
  <li><a onclick="javascript:return submitForm('pageuc')">Option6</a></li>
  <li><a onclick="javascript:return submitForm('pageuc')">Option5</a></li>
  <li><a onclick="javascript:return submitForm('usershiftlogs')">Shift Logs</a></li>
  <%  
  if(!Constants.ADMIN_USER_NAME.equals(username)){%>
  <li><a onclick="javascript:return submitForm('shiftLogs')">Daily Log</a></li>  
  <%} %>
   <%  
  if(!Constants.ADMIN_USER_NAME.equals(username)){%>
  <li><a onclick="javascript:return submitForm('locations')">My Sites</a></li>
  <%}else{ %>
  <li><a onclick="javascript:return submitForm('locations')">Locations</a></li>
  <%} %>
  <li><a onclick="javascript:return submitForm('homeMenu')">Home</a></li>  
</ul> 
</form>