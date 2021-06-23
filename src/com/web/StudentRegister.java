package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentDao;
import com.dto.Student;

@WebServlet("/StudentRegister")
public class StudentRegister extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String studentId = request.getParameter("studentId");
		String password = request.getParameter("password");
		String branch = request.getParameter("branch");
		int batch = Integer.parseInt(request.getParameter("batch"));
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		StudentDao studentDao = new StudentDao();
		Student userExists = studentDao.getStudent(studentId);
		if(userExists == null) {
			Student student = new Student(studentId, password, name,batch, branch, mobile, email,1,1,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f); 
			int x = studentDao.register(student);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Sign up success!Click to continue...');");
			out.println("location='AllLoginPage.html';");
			out.println("</script>");
			out.println("<h3><CENTER>Registration Success .."+x+" Rows inserted...</CENTER></H3>");
		}else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('StudentId already exists!Click to retry...');");
			out.println("location='StudentRegister.html';");
			out.println("</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
