package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.StudentDao;
import com.dto.Student;

@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
			String studentId=request.getParameter("userId");
            String password=request.getParameter("password");   
            StudentDao studentDao = new StudentDao();
    		Student student = studentDao.getStudent(studentId);
    		if(student != null) {
    			String correctPassword = student.getPassword();
    			if(password.equals(correctPassword)) {
    				session.setAttribute("studentId", studentId);
    				RequestDispatcher rd = request.getRequestDispatcher("StudentDashboard.jsp");
    				rd.include(request, response);
    			}else{
    				out.println("<script type=\"text/javascript\">");
    				out.println("alert('Wrong Password!Click to continue...');");
    				out.println("location='AllLoginPage.html';");
    				out.println("</script>");
    			}	
    		}else{
    			out.println("<script type=\"text/javascript\">");
    			out.println("alert('StudentId does not exist!Try signing up...');");
    			out.println("location='StudentRegister.html';");
    			out.println("</script>");
    		}  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    		doGet(request, response);
        
	}

}
