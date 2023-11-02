package ems.erp.controller;

import java.io.IOException;
import ems.erp.beans.Admin;
import ems.erp.model.AdminLoginModel;
import ems.erp.util.CBEView;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddAdminCtl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddAdminCtl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(CBEView.Create_Admin_JSP).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin = new Admin();
        admin.setUname(request.getParameter("uname"));
        admin.setPass(request.getParameter("pass"));
        String s1 = AdminLoginModel.AddAdmin(admin);

        if (s1 != null && s1.equalsIgnoreCase("success")) {
            request.setAttribute("msg", "Failed to add the new Admin");
            request.getRequestDispatcher(CBEView.Create_Admin_JSP).forward(request, response);
        } else {
            request.setAttribute("msg", "New Admin is Added successfully");
            request.getRequestDispatcher(CBEView.Create_Admin_JSP).forward(request, response);
        }
    }
}
