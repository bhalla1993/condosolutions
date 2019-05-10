<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shift Logs</title>
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
</style>

</head>
<body>
<div id="outerDiv">
<div class="rows">
<h3>View Shift Logs</h3>
</div>
<div class="contentDiv">
<div class="notesDiv">
<p style="margin-left:10px">Filter:</p>
<p>Select Location: <select name="locationCombo" id="locationCombo"><option>Eden Park Phase 1</option><option></option><option></option></select></p>

</div>
</div>

</div>

</body>
</html>