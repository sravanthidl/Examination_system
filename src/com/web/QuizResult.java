package com.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.QuizDao;
import com.dao.SAMDao;
import com.dto.Quiz;
import com.dto.ScriptsAndMarks;
import com.dto.Student;

@WebServlet("/QuizResult")
public class QuizResult extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String studentId = (String)session.getAttribute("studentId");
		String YBSId=(String)session.getAttribute("YBSId");
		String examType=(String)session.getAttribute("examType");
		System.out.println(studentId+"->"+YBSId+" "+examType);
		String userAns="";
		try {
			//Class.forName("com.mysql.cj.jdbc.Driver");
		HashMap<String,String> qos= (HashMap<String,String>)session.getAttribute("QA");
		for (String key: qos.keySet()){  
			//out.println(key+ " = " + qos.get(key));
			//userAns=userAns+""+qos.get(key)+""+key+" ";
		} 
		
		int count=0;
		HashMap<String,String> anshm=new HashMap<>();
		String ans="";
		QuizDao quizDao= new QuizDao();
		List<Quiz> quiz=quizDao.getQuizList(YBSId, examType);
		for(Quiz q:quiz) {
			//ans=ans+q.getAnswerOption()+q.getQuestionNo()+" ";
			String m=""+q.getQuestionNo();
			anshm.put(m, q.getAnswerOption());
		}
		
		for(String key:qos.keySet()) {
			if(qos.get(key).equals(anshm.get(key))) {
				count++;
			}
		}
		session.setAttribute("studentScore",count);
		SAMDao samDao=new SAMDao();
		ScriptsAndMarks sam = samDao.getSam(studentId,YBSId);
		if(sam != null) {
			
			int x = samDao.updateQuizMarks(studentId, YBSId, examType, count);
		}
		RequestDispatcher rd = request.getRequestDispatcher("StudentDashboard.jsp");
		rd.forward(request, response);
		}
        catch (Exception e) {
            e.printStackTrace();
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
