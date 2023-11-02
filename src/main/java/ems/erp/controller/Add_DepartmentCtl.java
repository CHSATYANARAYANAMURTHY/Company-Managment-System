package ems.erp.controller;

import java.io.IOException;

import ems.erp.beans.Admin;
import ems.erp.model.AdminLoginModel;
import ems.erp.util.CBEView;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Add_DepartmentCtl
 */
public class Add_DepartmentCtl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.getRequestDispatcher(CBEView.Add_Department_JSP).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
        String dname = request.getParameter("dname");

        String s1 = AdminLoginModel.AddDepartment(dname);

        if (s1 != null && s1.equalsIgnoreCase("success")) {
            request.setAttribute("msg", "Department is Added successfully");
            request.getRequestDispatcher(CBEView.Add_Department_JSP).forward(request, response);
        } else {
            request.setAttribute("msg", " ");
            request.getRequestDispatcher(CBEView.Add_Department_JSP).forward(request, response);
        }
    }
}
