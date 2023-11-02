<!DOCTYPE html>
<%@page import="ems.erp.beans.Employee"%>
<%@page import="ems.erp.model.EmployeeModel"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">
	<link rel="icon" href="logo.jpg" type="image/icon type">
	<title>Add Employee</title>
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #f1f1f1;
}

#regForm {
	background-color: #ffffff;
	margin: 0px auto;
	font-family: Raleway;
	padding: 40px;
	width: 70%;
	min-width: 300px;
}

h1 {
	text-align: center;
}

input {
	padding: 5px;
	width: 100%;
	font-size: 15px;
	font-family: Raleway;
	border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
	background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
	display: none;
}

button {
	background-color: #4CAF50;
	color: #ffffff;
	border: none;
	padding: 10px 20px;
	font-size: 17px;
	font-family: Raleway;
	cursor: pointer;
}

button:hover {
	opacity: 0.8;
}

#prevBtn {
	background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbbbbb;
	border: none;
	border-radius: 50%;
	display: inline-block;
	opacity: 0.5;
}

.step.active {
	opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
	background-color: #4CAF50;
}

.p {
	font-style: bold;
}
</style>
<%@include file="../jsp/header.jsp"%>

<%
	String editMsg = (String) request.getAttribute("editMsg");
    String errorMsg = (String) request.getAttribute("errorMsg");
    String empSession = (String)session.getAttribute("empUser");
	Employee emp = EmployeeModel.editEmp(editMsg);
%>
<body>
    
    <%if(empSession != null){ %>
    <h3>MY Info</h3>
    <%}else{ %>
    <h3>Add Employee</h3>    
    <%} %>
    
    
	<%
		if (editMsg == null) {
	%>
	<form id="regForm" action="<%=CBEView.ADD_EMP%>" method="post">
		<%
			String msg = (String) request.getAttribute("msg");
				if (msg == null) {

				} else {
		%>
		<h2 style="color: green;"><%=msg%></h2>
	
		<%
			}
		%>


		<!-- One "tab" for each step in the form: -->
		<div class="tab">
			Official Info:
			<p>
				<input placeholder="First name..." oninput="this.className = ''"
					name="fname">
			</p>
			<p>
				<input placeholder="Last name..." oninput="this.className = ''"
					name="lname">
			</p>
			<p>
				<input placeholder="Date Of Birth.." oninput="this.className  = ''"
					name="dob">
			<p>
				<input placeholder="Gender.." oninput="this.className  = ''"
					name="gender">
			<p>
				<input placeholder="Father's Name.." oninput="this.className  = ''"
					name="fatherName">
			<p>
				<input placeholder="Mother's Name.." oninput="this.className  = ''" 
					name="motherNmae">

			<p>
				<input placeholder="Designation.." oninput="this.className  = ''"
					name="designation">
			<p>
				<input placeholder="Department.." oninput="this.className  = ''"
					name="department">
			<p>
				<input placeholder="Date Of Joining.."
					oninput="this.className  = ''" name="doj">
		</div>
		<div class="tab">
			Contact Info:
			<p>
				<input placeholder="Current Address..."
					oninput="this.className = ''" name="caddress">
			</p>
			<p>
				<input placeholder="Permanent Address..."
					oninput="this.className = ''" name="paddress">
			</p>
			<p>
				<input placeholder="Email.." oninput="this.className  = ''"
					name="email">
			<p>
				<input placeholder="Contact Number.." oninput="this.className  = ''"
					name="cnumber">
			<p>
				<input placeholder="Highest Education.."
					oninput="this.className  = ''" name="education">
			<p>
				<input placeholder="Language Known .."
					oninput="this.className  = ''" name="language">
			<p>
				<input placeholder="Primary Skills.." oninput="this.className  = ''"
					name="pskill">
			<p>
				<input placeholder="Secondary Skills.."
					oninput="this.className  = ''" name="sskill">
			<p>
				<input placeholder="password.." oninput="this.className  = ''"
					name="maritalStatus" type="password">
		</div>

		<div style="overflow: auto;">
			<div style="float: right;">
				<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
				<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
			</div>
		</div>
		<!-- Circles which indicates the steps of the form: -->
		<div style="text-align: center; margin-top: 40px;">
			<span class="step"></span> <span class="step"></span>

		</div>
	</form>
	<%
		} else {
	%>

	<form id="regForm" action="<%=CBEView.ADD_EMP%>" method="post">
		<!-- One "tab" for each step in the form: -->
		<div class="tab">
			Official Info:
			<p>
				First Name<input placeholder="First name..."
					oninput="this.className = ''" name="fname"
					value="<%=emp.getFname()%>">
			</p>
			<input type="hidden" name="editEmail" value="<%=editMsg%>">
			<p>
				Last name<input placeholder="Last name..."
					oninput="this.className = ''" name="lname"
					value="<%=emp.getLname()%>">
			</p>
			<p>
				Date Of Birth<input placeholder="Date Of Birth.."
					oninput="this.className  = ''" name="dob" value="<%=emp.getDob()%>">
			<p>
				Gender<input placeholder="Gender.." oninput="this.className  = ''"
					name="gender" value="<%=emp.getGender()%>">
			<p>
				Father's Name<input placeholder="Father's Name.."
					oninput="this.className  = ''" name="fatherName"
					value="<%=emp.getFatherName()%>">
			<p>
				Mother's Name<input placeholder="Mother's Name.."
					oninput="this.className  = ''" name="motherNmae"
					value="<%=emp.getMotherNmae()%>">
			<p>
				Designation<input placeholder="Designation.."
					oninput="this.className  = ''" name="designation"
					value="<%=emp.getDesignation()%>">
			<p>
				Department<input placeholder="Department.."
					oninput="this.className  = ''" name="department"
					value="<%=emp.getDepartment()%>">
			<p>
				Date Of Joining<input placeholder="Date Of Joining.."
					oninput="this.className  = ''" name="doj" value="<%=emp.getDoj()%>">
		</div>
		<div class="tab">
			Contact Info:
			<p>
				Current Address<input placeholder="Current Address..."
					oninput="this.className = ''" name="caddress"
					value="<%=emp.getCaddress()%>">
			</p>
			<p>
				Permanent Address<input placeholder="Permanent Address..."
					oninput="this.className = ''" name="paddress"
					value="<%=emp.getPaddress()%>">
			</p>
			<p>
				Email<input placeholder="Email.." oninput="this.className  = ''"
					name="email" value="<%=emp.getEmail()%>">
			<p>
				Contact Number<input placeholder="Contact Number.."
					oninput="this.className  = ''" name="cnumber"
					value="<%=emp.getCnumber()%>">
			<p>
				Highest Education<input placeholder="Highest Education.."
					oninput="this.className  = ''" name="education"
					value="<%=emp.getEducation()%>">
			<p>
				Language Known<input placeholder="Language Known .."
					oninput="this.className  = ''" name="language"
					value="<%=emp.getLanguage()%>">
			<p>
				Primary Skills<input placeholder="Primary Skills.."
					oninput="this.className  = ''" name="pskill"
					value="<%=emp.getPskill()%>">
			<p>
				Secondary Skills<input placeholder="Secondary Skills.."
					oninput="this.className  = ''" name="sskill"
					value="<%=emp.getSskill()%>">
			<p>
				Password<input placeholder="Password.."
					oninput="this.className  = ''" name="maritalStatus"
					value="<%=emp.getPassword()%>" type="password">
		</div>
		<div style="overflow: auto;">
			<div style="float: right;">
				<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
				<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
			</div>
		</div>
		<!-- Circles which indicates the steps of the form: -->
		<div style="text-align: center; margin-top: 40px;">
			<span class="step"></span> <span class="step"></span>
		</div>
	</form>
	<%
		}
	%>
	<script>
		var currentTab = 0; // Current tab is set to be the first tab (0)
		showTab(currentTab); // Display the crurrent tab
		function showTab(n) {
			// This function will display the specified tab of the form...
			var x = document.getElementsByClassName("tab");
			x[n].style.display = "block";
			//... and fix the Previous/Next buttons:
			if (n == 0) {
				document.getElementById("prevBtn").style.display = "none";
			} else {
				document.getElementById("prevBtn").style.display = "inline";
			}
			if (n == (x.length - 1)) {
				document.getElementById("nextBtn").innerHTML = "Submit";
			} else {
				document.getElementById("nextBtn").innerHTML = "Next";
			}
			//... and run a function that will display the correct step indicator:
			fixStepIndicator(n)
		}
		function nextPrev(n) {
			// This function will figure out which tab to display
			var x = document.getElementsByClassName("tab");
			// Exit the function if any field in the current tab is invalid:
			if (n == 1 && !validateForm())
				return false;
			// Hide the current tab:
			x[currentTab].style.display = "none";
			// Increase or decrease the current tab by 1:
			currentTab = currentTab + n;
			// if you have reached the end of the form...
			if (currentTab >= x.length) {
				// ... the form gets submitted:
				document.getElementById("regForm").submit();
				return false;
			}
			// Otherwise, display the correct tab:
			showTab(currentTab);
		}

		function validateForm() {
			// This function deals with validation of the form fields
			var x, y, i, valid = true;
			x = document.getElementsByClassName("tab");
			y = x[currentTab].getElementsByTagName("input");
			// A loop that checks every input field in the current tab:
			for (i = 0; i < y.length; i++) {
				// If a field is empty...
				if (y[i].value == "") {
					// add an "invalid" class to the field:
					y[i].className += " invalid";
					// and set the current valid status to false
					valid = false;
				}
			}
			// If the valid status is true, mark the step as finished and valid:
			if (valid) {
				document.getElementsByClassName("step")[currentTab].className += " finish";
			}
			return valid; // return the valid status
		}

		function fixStepIndicator(n) {
			// This function removes the "active" class of all steps...
			var i, x = document.getElementsByClassName("step");
			for (i = 0; i < x.length; i++) {
				x[i].className = x[i].className.replace(" active", "");
			}
			//... and adds the "active" class on the current step:
			x[n].className += " active";
		}
	</script>
	<%@include file="../jsp/footer.jsp"%>
</body>
</html>
