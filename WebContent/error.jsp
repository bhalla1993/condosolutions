<%
String errorMessage=(String)request.getAttribute("errorMessage");
%>

<div style="text-align:center;border:1px solid black; width:80%;">
<h1>Error Page</h1>
<p style="color:red">errorMessage</p>
</div>