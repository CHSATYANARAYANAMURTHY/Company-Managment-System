package ems.erp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import ems.erp.beans.Employee;
import ems.erp.model.EmployeeModel;
import ems.erp.util.CBEView;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddEmployee extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the JSP page for adding employees
        request.getRequestDispatcher(CBEView.ADMIN_ADD_EMP).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the PrintWriter
        PrintWriter out = response.getWriter();

        // Create an Employee object
        Employee emp = new Employee();

        // Get the email parameter from the request
        String email = request.getParameter("editEmail");

        // Get the user session attribute
        String usession = (String) request.getSession(false).getAttribute("empUser");

        // Set the employee attributes
        emp.setFname(request.getParameter("fname"));
        emp.setLname(request.getParameter("lname"));
        emp.setDob(request.getParameter("dob"));
        emp.setGender(request.getParameter("gender"));
        emp.setFatherName(request.getParameter("fatherName"));
        emp.setMotherNmae(request.getParameter("motherNmae")); 
        emp.setDesignation(request.getParameter("designation"));
        emp.setDepartment(request.getParameter("department"));
        emp.setDoj(request.getParameter("doj"));
        emp.setCaddress(request.getParameter("caddress"));
        emp.setPaddress(request.getParameter("paddress"));
        emp.setEmail(request.getParameter("email"));
        emp.setCnumber(request.getParameter("cnumber"));
        emp.setEducation(request.getParameter("education"));
        emp.setLanguage(request.getParameter("language"));
        emp.setPskill(request.getParameter("pskill"));
        emp.setSskill(request.getParameter("sskill"));
        emp.setPassword(request.getParameter("maritalStatus"));
        if (email == null) {
            // Add a new employee
            String result = EmployeeModel.addEmployee(emp);
            if ("success".equalsIgnoreCase(result)) {
                request.setAttribute("msg", "Data is inserted successfully");
            } else {
                request.setAttribute("errorMsg", "Something went wrong");
            }
            if (usession == null) {
                request.getRequestDispatcher(CBEView.VIEW_EMP).forward(request, response);
            } else {
                request.getRequestDispatcher(CBEView.ADMIN_ADD_EMP).forward(request, response);
            }
        } else {
            String result = EmployeeModel.editEmployee(email, emp);
            if ("success".equalsIgnoreCase(result)) {
                request.setAttribute("updateMsg", "Data is updated successfully");
            }
            // Forward to the appropriate page based on the session
            if (usession == null) {
                request.getRequestDispatcher(CBEView.VIEW_EMP).forward(request, response);
            } else {
                request.getRequestDispatcher(CBEView.ADMIN_ADD_EMP).forward(request, response);
            }
        }
    }
}
