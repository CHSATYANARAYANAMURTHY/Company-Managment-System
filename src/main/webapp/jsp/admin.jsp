<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CMS</title>
<link rel="icon" href="logo.jpg" type="image/icon type">
<%
String adminUser=(String)session.getAttribute("adminUser");
System.out.println(adminUser);
if(adminUser != null){
	%> <jsp:include page="../jsp/header.jsp"/><% 
}%>

</head>
<body>
<img align="center" width="1520" height="625" src="images/admin-office.jpg" alt="Theme-Logo"  />
</body>
<%@include file="../jsp/footer.jsp" %>
</html>