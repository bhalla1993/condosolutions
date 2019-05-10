<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.condosolutions.beans.ShiftLog" %>
<%@ page import="com.condosolutions.beans.User" %>

<%

ShiftLog shift=(ShiftLog)request.getAttribute("shiftLog");
User user=null;
String fullName="",username="";
if(session.getAttribute("user")!=null)
{
user=(User)session.getAttribute("user");
}

if(user!=null)
{
	fullName=user.getFullName();
	username=user.getUsername();
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shift Logs</title>
<style type="text/css">
#outerDiv
{
width:70%;
margin-left:200px; 
margin-top:20px;
background-color:#eeeee0; 
}       
.rows 
{
width:100%;
float:left;
background-color:lightgray;   
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
.formfieldsDiv
{
width:90%;
margin-left:50px;
margin-top:10px;
float:left;
color:black;
}
.formfieldsDiv p
{
font-family: monospace;
font-size: 14px;
font-style: normal;
font-weight: 700; 
}  
.formfieldsDiv input
{
width:60%;
height:30px;
}
input[type="submit"]
{
background: #0066A2;
color: white;
border-style: outset;
border-color: #0066A2;
height: 50px;
width: 100px;
font: bold 15px arial, sans-serif;
text-shadow:none;
}

</style>  
<script type="text/javascript">
function submitShiftLogForm()
{
	var f=document.shiftLogForm;

	var startTime,endTime,relieved,relievedBy,equipments;
	startTime=f.startTime.value;
	endTime=f.endTime.value;
	relieved=f.relieved.value;
	relievedBy=f.relievedBy.value;
	equipments=f.equipReceived.value;

	alert('startTime: '+startTime+' endTime'+endTime+' relieved: '+relieved+' relievedBy: '+relievedBy+' equipments: '+equipments);

	
	if(startTime=="" || startTime=="undefined" || startTime=="null")
	{	alert("Please fill Shift Start Time field to proceed further.")
		f.startTime.focus();
		return false;
	}
	if(endTime=="" || endTime=="undefined" || endTime=="null")
	{	alert("Please fill Shift End Time field to proceed further.")
		f.endTime.focus();
		return false;
	}

	f.fromWhere.value="startShiftLogs";
	
	f.submit();
	
}
function addLogs()
{
	var f=document.updateLog;
	var user='<%=username%>';
	var logText=document.getElementById("logText").value;
	
	$.ajax({
	    type: 'POST',
	    async: false,
	    dateType: 'text',
	    url:'ajaxSearch?dataSet=updateShiftLogs&param='+logText+'&username='+user,
	    success: function(response)
	    {
	    	if(response.trim()=="true")
	        {
	            alert("Changes have been saved.");
	            document.getElementById("logText").focus();
			
	        }
	   }});
		f.action="shiftLogs";
		f.fromWhere.value="";
		f.submit();
}
function cancelForm()
{
	var f=document.updateLog;
	f.fromWhere.value="cancelForm";
	f.action="shiftLogs";
	f.submit();
	
}
</script>
</head>
<body>
<div id="outerDiv">
<div class="rows">
<h3  style="text-align:center;">Eden Park Phase 01: <%=fullName%> Shift logs</h3>
</div>

<%if(shift==null){ %>
<div class="contentDiv">
<div class="notesDiv">
<p style="margin-left:10px">Notes:</p>
<p style="margin-left:10px">1. Fields marked with <span style="color:red">*</span> are mandatory fields.</p>
<p style="margin-left:10px">2. You must start a shift before you can create security shift logs.</p>
</div> 

<form name="shiftLogForm" method="post" action="">
<div class="formfieldsDiv">
<p>Shift Start Time<span style="color:red">*</span>:</p>
<p><input type="time" name="startTime"/></p>
<p>Shift End Time<span style="color:red">*</span>:</p>
<p><input type="time" name="endTime"/></p>
<p>Relieved:</p>
<p><input type="text" name="relieved" placeholder="Relieved security name"/></p>
<p>To Be Relieved By:</p>
<p><input type="text" name="relievedBy" placeholder="To be relieved by security name"/></p>
<p>Equipment Received:</p>
<p><input type="text" name="equipReceived" placeholder="Equipments"/>
<p>
<input type="submit" name="submit" value="Start Shift" onclick="javascript:return submitShiftLogForm()"/>
</p>  
</div>
<input type="hidden" value="" name="fromWhere"/>
</form>
 
</div> 

<%}else{ %>
<div class="contentDiv">
<div class="notesDiv">
<p style="margin-left:10px">Notes:</p>
<p style="margin-left:10px">1. You already have created shift for today. Please add shift logs in that.</p>

</div> 
<div class="formfieldsDiv">

<h2>Shift Details:</h2>
<p>Shift Start Time: <%=shift.getStartTime()%></p>
<p>Shift End Time: <%=shift.getEndTime()%></p>
<p>Relieved: <%=shift.getRelieved()%></p>
<p>Relieved By: <%=shift.getRelievedBy()%></p>
<p>Equipments: <%=shift.getEquipments()%></p>
<p>Created On: <%=shift.getCreationDate()%></p>
<p>Last Updated On: <%=shift.getUpdationDate()%></p>
<p>Created By: <%=fullName%></p>


<h2>New Security Log Entry:</h2>
<div style="width:90%">
<textarea style="width:100%;" rows="20" contenteditable="true" id="logText" name="logText"><%=shift.getLogText()%></textarea>
</div> 
<p>
<input type="submit" name="submit" value="Add Logs" onclick="javascript:return addLogs()"/>
<input type="submit" name="cancel" value="Cancel" onclick="javascript:return cancelForm()"/>
</p>  

</div> 
<form name="updateLog" action="" method="post">
<input type="hidden" value="" name="fromWhere"/>
</form>
</div>
<%} %>

</div>
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->


</body>
</html>