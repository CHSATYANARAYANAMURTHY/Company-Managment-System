<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee</title>
<link rel="icon" href="logo.jpg" type="image/icon type">
<%
String empUser=(String)session.getAttribute("empUser");
System.out.println(empUser);
if(empUser != null){
	%> <jsp:include page="../jsp/header.jsp"/><% 
}%>
</head>
<body>
<br>
<img align="center" width="1520" height="650" src="images/welcome.png" alt="Theme-Logo"  />
</body>
<%@include file="../jsp/footer.jsp"%>
</html>