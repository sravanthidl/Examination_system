package com.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.DescriptiveDao;
import com.dao.SAMDao;
import com.dto.Descriptive;
import com.dto.ScriptsAndMarks;


@WebServlet("/StudentDescriptive")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 20)
public class StudentDescriptive extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String studentId = (String)session.getAttribute("studentId");
		System.out.println(studentId);
		String YBSId = (String)request.getParameter("YBSId");
		String examType = (String)request.getParameter("examType");
		System.out.println(YBSId+" "+examType);
		/*String asgnOpenDate = "", asgnCloseDate = "";
		if(examType.equals("asgn1") || examType.equals("asgn2")) {
			asgnOpenDate = (String)request.getParameter("openDate");
			asgnCloseDate = (String)request.getParameter("closeDate");
		}*/
		Part part = request.getPart("file");
		System.out.println("part:" + part);
		String paperPath = extractFileName(part);
        String saveDir = "pics";
        imageUpload(request, paperPath, saveDir);
        System.out.println(paperPath);
        SAMDao samDao = new SAMDao();
        System.out.println("here:" + samDao.getSam(studentId, YBSId));
        if(examType.equals("mid1") || examType.equals("mid2") || examType.equals("sem")||examType.equals("asgn1")||examType.equals("asgn2")){
        	//ScriptsAndMarks sam = samDao.getDescriptive(studentId,YBSId);
        		int status = samDao.updateAPaperPath(YBSId, examType, studentId, paperPath);
        		System.out.println("here:" + samDao.getSam(studentId, YBSId));
        }/*else{
        	if(examType.equals("asgn1")) examType = "mid1";
        	else examType = "mid2";
        	Descriptive descriptiveExists = descriptiveDao.getDescriptive(YBSId, examType);
        	if(descriptiveExists == null) {
        		Descriptive  descriptive = new Descriptive();
        		descriptive.setYBSId(YBSId);
        		descriptive.setExamType(examType);
        		descriptive.setTeacherId(teacherId);
        		descriptive.setAsgnPaperPath(paperPath);
        		descriptive.setAsgnOpenDate(asgnOpenDate);
        		descriptive.setAsgnCloseDate(asgnCloseDate);
        		descriptiveDao.addDescriptive(descriptive);
        	}else {
        		int status = descriptiveDao.updateAsgnPaperPath(YBSId, examType, teacherId, paperPath, asgnOpenDate, asgnCloseDate);
        	}
        }*/
        RequestDispatcher rd = request.getRequestDispatcher("StudentDashboard.jsp");
		rd.forward(request, response);
        
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void imageUpload(HttpServletRequest request, String fname, String saveDir) throws ServletException, IOException {
		
		String savePath = "/Users/sravanthi/Desktop/Workspace/Examination_system/WebContent/" + saveDir;	 
		File fileSaveDir = new File(savePath);	 
		if(!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		Part part = request.getPart("file");
		String fileName = extractFileName(part);
		System.out.println(fileName);
	    fileName = new File(fileName).getName();
		System.out.println(fileName);
		part.write(savePath + "/" + fname);
		System.out.print("File Uploaded Successfully ");		
	}	
		
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for(String s : items) {
			if(s.trim().startsWith("filename")){
				return s.substring(s.indexOf("=") + 2, s.length()-1);
		    }
		}
		return "";
	}

}
