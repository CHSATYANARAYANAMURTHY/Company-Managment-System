<%@page import="ems.erp.model.ReportsModel"%>
<%@page import="ems.erp.beans.Timesheet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*, jakarta.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Timesheet</title>
<link rel="icon" href="logo.jpg" type="image/icon type">
<%@include file="../jsp/header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="../css/home.css">
</head>
<body>
<h3>Add TimeSheet</h3>

	<%
			String msg = (String) request.getAttribute("msg");
	       String editMsg = (String)request.getAttribute("editMsg");
	       Timesheet tsheet = ReportsModel.editTimesheet("editMsg");
				if (msg == null) {

				} else {
		%>
		<h2 style="color: green;"><%=msg%></h2>
	
		<%
			}
		%>
<%if(editMsg==null){ %>
<div class="login_form" style="margin: 80px; margin-left: 430px;">

		<form action="<%=CBEView.ADD_TimeSheet%>" method="post">

			<input type="text" placeholder="Enter Employee's Email" name="email">
			
			<input type="text" placeholder="Work Tittle" name="tittle">
		
           	<input type="text" placeholder="Enter the Work Description" name="des">
            
            <input type="text" placeholder="Total working hours" name="whours">
          
            <input type="text" value= "<%= new Date().toString() %>" name="date1">

			<button type="submit">Submit</button>

		</form>

	</div>
	<%}else{ %>
	
	<div class="login_form" style="margin: 80px; margin-left: 430px;">

		<form action="CBEView.ADD_TimeSheet" method="post">
		   <input type="hidden" name="editMsgTime" value="<%=editMsg%>">

			<input type="text" placeholder="Enter Employee's Email" name="email" value="<%=tsheet.getEmail()%>">
			
			<input type="text" placeholder="Work Tittle" name="tittle" value="<%=tsheet.getWorkTittle()%>">
			
             <textarea name="des" ><%=tsheet.getDescription()%></textarea>
           
            
            <input type="text" placeholder="Total working hours" name="whours" value="<%=tsheet.getHours()%>">
          
            <input type="text" value= "<%= new Date().toString() %>" name="date1" value="<%=tsheet.getDate()%>">

			<button type="submit">Submit</button>

		</form>

	</div>
	
	<%} %>

</body>
<%@include file="../jsp/footer.jsp"%>
</html>