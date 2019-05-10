<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<title><tiles:getAsString name="title" /></title>
</head>
<body style="padding:0px auto;margin:0px auto">

<div style="width:100%;margin-top:10px;border:0px solid black;float:left">
<%@  include file="header.jsp" %>
</div>
<div style="width:100%;float:left;border:0px solid yellow">
<tiles:insertAttribute name="body" />
</div>
<div style="width:100%;float:left;">
<%@  include file="footer.jsp" %>
</div>
</body>
</html>  