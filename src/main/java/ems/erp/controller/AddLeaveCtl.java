package ems.erp.controller;

import java.io.IOException;

import ems.erp.beans.Leave;
import ems.erp.beans.Salary;
import ems.erp.model.ReportsModel;
import ems.erp.util.CBEView;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddLeaveCtl
 */
public class AddLeaveCtl extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher(CBEView.ADD_LEAVE_jsp).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // Get the user session
	    String usession = (String) request.getSession(false).getAttribute("empUser");

	    // Create a Leave object and populate it with request parameters
	    Leave leave = new Leave();
	    String email = request.getParameter("editMsgLeave");
	    leave.setEmail(request.getParameter("email"));
	    leave.setDescription(request.getParameter("des"));
	    leave.setFromDate(request.getParameter("fdate"));
	    leave.setToDate(request.getParameter("tdate"));
	    leave.setStatus(request.getParameter("lstatus"));

	    if (email == null) {
	        // Attempt to add leave
	        String s1 = ReportsModel.addLeave(leave);

	        if (s1 != null && s1.equalsIgnoreCase("success")) {
	            request.setAttribute("msg", "Leave is Added successfully");
	            request.getRequestDispatcher(CBEView.ADD_LEAVE_jsp).forward(request, response);
	        } else {
	            // Handle the case where s1 is null or not equal to "success"
	            request.setAttribute("error", "Failed to add leave");
	            request.getRequestDispatcher(CBEView.ADD_LEAVE_jsp).forward(request, response);
	        }
	    } else {
	        // Attempt to update leave
	        String s2 = ReportsModel.updateLeave(email, leave);
	        if (s2 != null && s2.equalsIgnoreCase("success")) {
	            request.setAttribute("msg", "Leave is Updated successfully");
	            request.getRequestDispatcher(CBEView.VIEW_LEAVE_Jsp).forward(request, response);
	        } else {
	            // Handle the case where s2 is null or not equal to "success"
	            request.setAttribute("error", "Failed to update leave");
	            request.getRequestDispatcher(CBEView.VIEW_LEAVE_Jsp).forward(request, response);
	        }
	    }
	}
}
