<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Admin</title>
<link rel="icon" href="logo.jpg" type="image/icon type">
<%@include file="../jsp/header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="../css/home.css">
</head>
<body>
	<h3>Create Admin</h3>
	<%
		String msg = (String) request.getAttribute("msg");
	%>
	<%
		if (msg == null) {

		} else {
	%>
	<h2 style="color: green;"><%=msg%></h2>

	<%
		}
	%>

	<div class="login_form" style="margin: 80px; margin-left: 430px;">

		<form action="<%=CBEView.ADD_Admin%>" method="post">

			<input type="text" placeholder="Admin's User Name" name="uname">

			<input type="text" placeholder="Enter Password" name="pass">

			<button type="submit">Submit</button>

		</form>

	</div>

</body>
<%@include file="../jsp/footer.jsp"%>
</html>