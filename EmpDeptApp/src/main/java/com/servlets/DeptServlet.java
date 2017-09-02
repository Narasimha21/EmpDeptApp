package com.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imcs.project.entities.Department;
import com.imcs.project.entities.Employee;
import com.imcs.project.service.EmployeeService;

/**
 * Servlet implementation class DepartServlet
 */
public class DeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeService es = new EmployeeService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeptServlet() {
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

		String hVar = request.getParameter("hdept");
		switch (hVar) {
		case "hdept":
			getDepts(request, response);
			break;
		case "hemp":
			getEmployees(request, response);
			break;
			
		case "deleteE":
			deleteEmployee(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void getDepts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Department department = new Department();
		Integer deptNo = Integer.parseInt(request.getParameter("dept"));
		department = es.getDept(deptNo);
		if (department == null) {
			request.setAttribute("result", "No such Deparment Exists..Try again");
			RequestDispatcher rd = request.getRequestDispatcher("/deptView.jsp");
			rd.forward(request, response);
		}

		request.setAttribute("department", department);
		RequestDispatcher rd = request.getRequestDispatcher("/deptView.jsp");
		rd.forward(request, response);
	}

	private void getEmployees(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Employee> list = new ArrayList<>();
		Integer deptNo = Integer.parseInt(request.getParameter("deptNo"));
		
		list = es.getEmployeeByDeptNo(deptNo);
		
		if (list.size() < 1) {
			request.setAttribute("result", "No Results for this search..try with another department no");
		}
		request.setAttribute("department", es.getDept(deptNo));
		request.setAttribute("employee", list);
		RequestDispatcher rd = request.getRequestDispatcher("/deptView.jsp");
		rd.forward(request, response);
	}
	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer empNo = Integer.parseInt(request.getParameter("emp"));
		
		String homePage = request.getParameter("homePage");
		Employee empl =es.getEmployee(empNo);
		es.deleteEmployee(empNo);
		request.setAttribute("result", "Employee deleted sucessfully");
		if (null!=homePage && homePage.equals("deptPage")) {
			Integer deptNo = Integer.parseInt(request.getParameter("deptt"));
			request.setAttribute("department",es.getDept(deptNo));
			request.setAttribute("employee", es.getEmployeeByDeptNo(deptNo));
			RequestDispatcher rd = request.getRequestDispatcher("/deptView.jsp");
			rd.forward(request, response);
		}
		else{
		request.setAttribute("display",empl);
		RequestDispatcher rd = request.getRequestDispatcher("/employee.jsp");
		rd.forward(request, response);

	}

}
}