<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.condosolutions.beans.User" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.condosolutions.beans.Location" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#locations{
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
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

</style>

</head>
<body>
<div id="outerDiv">
<div class="rows">
<h3  style="text-align:center;">Locations List</h3>
</div>

<%
try
{

HashMap<String,List<Location>> locMap=(HashMap<String,List<Location>>)request.getAttribute("locationMap");
System.out.println("Location Map in jsp is: "+locMap);
if(locMap!=null)
{
int sizeOfMap=0;
sizeOfMap=locMap.size();
if(sizeOfMap>0)
{
	for(int i=1;i<=sizeOfMap;i++)
	{
		ArrayList<Location> locList=(ArrayList<Location>)locMap.get(i+"");
		if(locList!=null)
		{	
		%>
	<table id="locations">
	  <tr>
	    <th>Location Name</th>
	    <th>Location Address</th>
	    <th>Added On</th>
	  </tr>	 
		<%	
		for (Location location : locList) 
		{
			%>
			<tr>
			<td><%=location.getLocationName()%></td>
			<td><%=location.getLocationAddress()%></td>
			<td><%=location.getCreationDate()%></td>
			</tr>
			<%								
		}
	}
		else
		{
			%>
			<tr>
			<td colspan="3">No location has been assigned to you yet. Please contact your administrator for assistance.</td>
			</tr>	
			<%
		}
		
		}
	%>
	</table>
	
	<%
}}
else
{
	
%>
<div>
<h4>No Location is assigned to user!</h4>
</div>
<%}%>
</div>
<%
}
catch(Exception e)
{
	//e.printStackTrace();
	System.out.println("Exception in locations.jsp"+e.getMessage());
}
%>
</body>
</html>