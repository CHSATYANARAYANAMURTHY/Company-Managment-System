package ems.erp.controller;

import java.io.IOException;
import ems.erp.beans.Project;
import ems.erp.model.AdminLoginModel;
import ems.erp.model.ManagerModel;
import ems.erp.util.CBEView;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddProject
 */
public class AddProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher(CBEView.Add_Project_JSP).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Project project = new Project();
		project.setPname(request.getParameter("pname"));
		project.setPstatus(request.getParameter("pstatus"));
		project.setDescription(request.getParameter("des"));
		project.setCost(request.getParameter("cost"));
		project.setAssignTo(request.getParameter("assignTo"));
		project.setDepartment(request.getParameter("department"));
		
		
		
        String s1 = ManagerModel.addProject(project);
        
    	if (s1.equalsIgnoreCase("sucess")) {
			request.setAttribute("msg", "Project is Added sucessfully");
			request.getRequestDispatcher(CBEView.Add_Project_JSP).forward(request, response);
		}
	}

}
