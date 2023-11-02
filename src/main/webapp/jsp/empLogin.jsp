<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Login</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
	<link rel="stylesheet" type="text/css" href="../css/home.css">
	<link rel="icon" href="logo.jpg" type="image/icon type">
<%@include file="../jsp/header.jsp"%>
</head>
<body>
<h1>Employee Login</h1>

	<div class="mainDiv">

		<div class="login_form" style="margin: 135px; margin-left: 430px;">

			<form action="<%=CBEView.ADMIN_LOGIN_CTL%>" method="post">

				<input type="text" placeholder="Enter Username(email)..." name="uname">
				
				<input type="hidden" value="user" name="utype">

				<input type="password" placeholder="Enter Password" name="password">

				<button type="submit">Login</button>

			</form>
			<!-- <a href="">Forgot Password?</a>   -->
		</div>

	</div>

</body>
<%@include file="../jsp/footer.jsp"%>
</html>