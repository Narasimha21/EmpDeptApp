package com.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imcs.project.entities.Employee;
import com.imcs.project.service.EmployeeService;

/**
 * Servlet implementation class EmployeeServlet
 */
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EmployeeService es = new EmployeeService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String hVar = request.getParameter("hParam");

		switch (hVar) {

		case "searchE":
			   getEmployee(request, response);
			break;
		case "uEmp":
			updateEmployee(request, response);
			break;
		case "addEmp":
			addEmployee(request, response);
			break;

		case "deleteEmp":
			deleteEmployee(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer empNo = Integer.parseInt(request.getParameter("emp"));
		Employee empl =es.getEmployee(empNo);
		es.deleteEmployee(empNo);
		request.setAttribute("display",empl);
		request.setAttribute("result", "Employee deleted sucessfully");
		RequestDispatcher rd = request.getRequestDispatcher("/employee.jsp");
		rd.forward(request, response);

	}

	private void addEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer deptNo = Integer.parseInt(request.getParameter("dept"));
		float salary = Float.parseFloat(request.getParameter("salary"));
		SimpleDateFormat sd = new SimpleDateFormat("YYYY-MM-DD");
		try {
			Date doj = sd.parse(request.getParameter("doj"));
			Date dob = sd.parse(request.getParameter("dob"));
			Integer salaryGrade = Integer.parseInt(request.getParameter("grade"));
			
			int empid= es.addEmployee(deptNo, salary, doj, dob, salaryGrade);
			Employee empl = new Employee(empid,deptNo, salary, doj, dob, salaryGrade, "INC");
			request.setAttribute("display",empl);
			request.setAttribute("result", "Employee added sucessfully");
			RequestDispatcher rd = request.getRequestDispatcher("/employee.jsp");
			rd.forward(request, response);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

	private void getEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer empNo = Integer.parseInt(request.getParameter("emp"));
		Employee employee = es.getEmployee(empNo);
		if (employee == null) {
			request.setAttribute("error", "Employee doesn't exists");

		}
		String check = request.getParameter("search");

		if (check != null) {
			request.setAttribute("flag", true);
			request.setAttribute("employee", employee);
			RequestDispatcher rd = request.getRequestDispatcher("/employee.jsp");
			rd.forward(request, response);
			return;
		} else {
			request.setAttribute("updateFlag", true);
		}
		request.setAttribute("employee", employee);
		request.setAttribute("homePage", "deptPage");
		RequestDispatcher rd = request.getRequestDispatcher("/employee.jsp");
		rd.forward(request, response);
	}

	private void updateEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String homePage = request.getParameter("homePage");
		Integer empNo = Integer.parseInt(request.getParameter("emp"));
		Integer deptNo = Integer.parseInt(request.getParameter("dept"));
	
		float salary = Float.parseFloat(request.getParameter("salary"));
		SimpleDateFormat sd = new SimpleDateFormat("YYYY-MM-DD");
		try {
			Date doj = sd.parse(request.getParameter("doj"));
			Date dob = sd.parse(request.getParameter("dob"));
			Integer salaryGrade = Integer.parseInt(request.getParameter("grade"));
            Employee empl = new Employee(empNo, deptNo, salary, doj, dob, salaryGrade,"INC");
			es.updateEmployee(empNo, deptNo, salary, doj, dob, salaryGrade);

			request.setAttribute("result", "Employee updated sucessfully");
			if (null!=homePage && homePage.equals("deptPage")) {
				Integer deptNoOld = Integer.parseInt(request.getParameter("deptOld"));
				request.setAttribute("department",es.getDept(deptNoOld));
				request.setAttribute("employee", es.getEmployeeByDeptNo(deptNoOld));
				RequestDispatcher rd = request.getRequestDispatcher("/deptView.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("display",empl);
				RequestDispatcher rd = request.getRequestDispatcher("/employee.jsp");
				rd.forward(request, response);

			}

			// es.addEmployee(deptNo, salary, doj, dob, salaryGrade);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}