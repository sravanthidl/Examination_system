<%@page import="com.dto.Descriptive"%>
<%@page import="com.dao.DescriptiveDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
  <style>
    .card {
    border: 1px solid #d3d3d3;
    border-radius: .75rem;
    background-color: #f1f1f1;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    }
    .content {
    height:100%;
    width:100%;
    text-align: center;
    }
    .button {
      background-color: #a9c4f9;
      border: 1px solid #2196F3;
      padding: .5rem 1rem;
      cursor: pointer;
      color: #000000;
      border-radius: .25rem;
     }
  </style>
  </head>
  <body>
  <%		String studentId = (String)session.getAttribute("studentId");
			String YBSId = (String)request.getParameter("YBSId");
			String examType = (String)request.getParameter("examType");
			session.setAttribute("YBSId", YBSId);
			session.setAttribute("examType", examType);
			session.setAttribute("studentId", studentId);
			System.out.println("studentId:" + studentId);
			System.out.println("YBSId:" + YBSId);
			System.out.println("examType:" + examType);
			%>
  
    <div class="card">
      <div class="content">
        <h3>Question Paper</h3>
        <form action="StudentDescriptive" method="post" enctype="multipart/form-data">
        <%DescriptiveDao dDao=new DescriptiveDao();
        String x=null;
        if(examType.equals("mid1")||examType.equals("asgn1")){x="mid1";}
        if(examType.equals("mid2")||examType.equals("asgn2")){x="mid2";}
        Descriptive d=dDao.getDescriptive(YBSId, x);
        System.out.println(d);
       if(examType.equals("asgn1")||examType.equals("asgn2")){
        %>
        <iframe src="pics/<%=d.getAsgnPaperPath()%>" name="iframe_a" HEIGHT="70%" WIDTH="100%"></iframe>
		<%}else if(examType.equals("mid1")||examType.equals("mid2")){%>
		<iframe src="pics/<%=d.getQPaperPath()%>" name="iframe_a" HEIGHT="70%" WIDTH="100%"></iframe>
		<%} %>
        <br/><br/>
          <input type="file" class="button" name="file" required><br><br><br><br>
          <input type="hidden" name="YBSId" value="<%=YBSId%>">
			<input type="hidden" name="examType" value="<%=examType%>">
			<input type="submit" class="button" value="final submit">
        </form>
      </div>
    </div>
  </body>
</html>
