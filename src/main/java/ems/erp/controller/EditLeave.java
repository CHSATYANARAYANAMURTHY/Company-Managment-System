package ems.erp.controller;

import java.io.IOException;

import ems.erp.model.ReportsModel;
import ems.erp.util.CBEView;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditLeave
 */
public class EditLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditLeave() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String email = request.getParameter("email");
		String op = request.getParameter("op");
		System.out.println(email + " " + op);

		if (op.equalsIgnoreCase("edit")) {
			request.setAttribute("editMsg", email);
			request.getRequestDispatcher(CBEView.ADD_LEAVE2).forward(request, response);

		} else if (op.equalsIgnoreCase("delete")) {

			String emailDelete = request.getParameter("delEmail");
			String s1 = ReportsModel.deleteLeave(emailDelete);
			System.out.println("s111 " + s1);
			if (s1.equalsIgnoreCase("sucess")) {
				request.setAttribute("msg", "Record is delete Sucessfully");
				request.getRequestDispatcher(CBEView.VIEW_LEAVE_Jsp).forward(request, response);

			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
