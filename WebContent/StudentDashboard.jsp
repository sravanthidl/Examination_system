<%@page import="com.dto.LabMarks"%>
<%@page import="com.dao.LabMarksDao"%>
<%@page import="com.dao.Today"%>
<%@page import="com.dto.Descriptive"%>
<%@page import="com.dao.DescriptiveDao"%>
<%@page import="com.dto.ScriptsAndMarks"%>
<%@page import="com.dao.SAMDao"%>
<%@page import="com.dto.Student"%>
<%@page import="com.dto.Subject"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SubjectDao"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>ABIT EC - My Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

body{font-family:arial;}
.vertical_menu_bar{
	position:absolute;
	background-color:#30333d;
	height:150%;
	width:14%;
	text-decoration:none;
	font-size:17px;
	top:0px;
	left:0px;
	z-index:1;
}
.clgName{
	font-size:35px;
	color:#b3b3b3;
	top:-10px;
	padding-left:57px;
	position:absolute;
}
.tag{
	font-size:15px;
	color:#b3b3b3;
	padding-left:42px;
	padding-top:55px;
	position:absolute;
}
.options{
	
	position:absolute;
	background-color:#30333d;
	color:#cccccc;
	font-size:18px;
	text-decoration:none;
}
.options:hover{
	background-color:#16181d;
	color:#80b5eb;
}
.top1{
	position:absolute;
	background-color:#5a6bbc;
	height:57px;
	width:86%;
	text-decoration:none;
	font-size:17px;
	top:0px;
	left:202px;
}
.top2{
	position:absolute;
	background-color:#7382c8;
	height:67px;
	width:86%;
	text-decoration:none;
	font-size:17px;
	top:57px;
	left:202px;
}
.subs{
	position:absolute;
	top:0px;
	padding:20px 80px 20px 80px;
	border:none;
	cursor:pointer;
	background-color:#7382c8;
	color:#f7f7f7;
}
.subs:hover{background-color:#5a6bbc;}
.body_bar{
	position:absolute;
	height:84.5%;
	width:88%;
	top:20%;
	left:15%;
}
#tb {
  border-collapse: collapse;
  width:35%;
}
#tb td, #tb th {
  white-space: nowrap;
  border: 0px solid #e4e4e4;
  padding: 12px;
  color:#585858;
  column-width:100px;
  text-align:center;
}
#tb th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #f7f7f7;
  color: #4a4a4a;
  text-align: center;
}

  .card {
  border: 2px solid #b9c4f9;
  border-radius: .75rem;
  border-color: #5a6bbc;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  }
  .content {
  padding: 15px;
  height:100%;
  width:100%;
  text-align: center;
}
.grid-container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 20px;
}
.button {
  background-color: #5a6bbc;
  border: 1px solid #2196F3;
  padding: .5rem 1rem;
  cursor: pointer;
  color: #ffffff;
  border-radius: .25rem;
 }
 
.td{
  text-align: center;
}

.card-columns :@include media-breakpoint-only(lg) {
    column-count: 4;
  }
 .card-columns :@include media-breakpoint-only(xl) {
    column-count: 5;
  }

  </style>
</head>
<body>
		<% String studentId = (String)session.getAttribute("studentId"); 
		System.out.println(studentId);
		StudentDao studentDao=new StudentDao();
		Student student= studentDao.getStudent(studentId);
		int year=student.getCurrentYear();
		int sem=student.getCurrentSem();
		String branch=student.getBranch();
		SubjectDao subjectDao = new SubjectDao();
		List<Subject> subject=subjectDao.getSubjects(year, branch,"Theory");
		List<Subject> subjects = subjectDao.getSubjects(year, branch, "Lab");
		List<String> ids = subjectDao.getAllSubjectIdByYearAndBranch(year,branch);
		float Y=0;
		String today = new Today().getToday();
		String time = new Today().getTime();
		if(year==1 && sem==1){Y=student.getSgpa1();}
		if(year==1 && sem==2){Y=student.getSgpa2();}
		if(year==2 && sem==1){Y=student.getSgpa3();}
		if(year==2 && sem==2){Y=student.getSgpa4();}
		if(year==3 && sem==1){Y=student.getSgpa5();}
		if(year==3 && sem==2){Y=student.getSgpa6();}
		if(year==4 && sem==1){Y=student.getSgpa7();}
		if(year==1 && sem==2){Y=student.getSgpa8();}
	%>	
  <div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Home</p>
	</div>
	
	<div class="top2">
		<p style="position:absolute;color:#f7f7f7;left:30px;top:0px;font-size:20px">Hi, <%=studentId%> !</p>
	</div>
	
	<div class="vertical_menu_bar">
		<a href="StudentDashboard.jsp"><div>
		<p class="clgName"><strong>ABIT</strong></p>
		<hr width="90px"  style="position:absolute;left:50px;top:48px;border:1px solid;color:#b3b3b3">
		<p class="tag"> EXAM CORNER</p>
		</div></a>
		<i class='fas fa-book-reader' style="position:absolute;top:217px;left:30px;color:#cccccc;z-index:1"></i>
		<a class="options" style="top:200px;padding:17px 69px 17px 65px;border:none;cursor:pointer" href="StudentDashboard.jsp">Dashboard</a></br>
		
		<i class='fas fa-user-circle' style="position:absolute;top:417px;left:30px;color:#cccccc;z-index:1"></i>
		<a class="options" style="top:400px;padding:17px 85px 17px 65px" href="StudentViewProfile.jsp">Profile</a></br>
		
		<i class='fa fa-sign-out' style="position:absolute;top:617px;left:30px;color:#cccccc;z-index:1;font-size:23px"></i>
		<a class="options" style="top:600px;padding:17px 82px 17px 65px" href="AllLoginPage.html">Logout</a></br>
	</div>

<div class="body_bar">
  <div class="grid-container">
  <%for(int i=0;i<subject.size();i++){%>
  <div class="card">
  <div class="content">
    <h4><%=subject.get(i).getSubjectName() %></h4>
    <table>
      <tbody>
      <tr>
      <form action="./StudentQuizAttempt.jsp" method="post">
        <td>Quiz1</td>
        <input type="hidden" name="examType" value="mid1" />
        <input type="hidden" name="YBSId" value="<%=subject.get(i).getYBSId() %>" />
        <input type="hidden" name="minute" value="30">
		<input type="hidden" name="second" value="00">
        <%HashMap hm01 = new HashMap<String,String>();
        session.setAttribute("QA",hm01);
        session.setAttribute("answerOpted","");
        %>
        <%SAMDao samDao=new SAMDao();
        int s=0;
        ScriptsAndMarks sam0=samDao.getSam(studentId, subject.get(i).getYBSId());
        if(sam0 == null) {
			sam0 = new ScriptsAndMarks(studentId,subject.get(i).getYBSId(),"NA",0,0,"NA",0, 0,"NA",0,0,"NA",0, 0,0,"NA",0,0,"NA",0) ; 
			int x = samDao.add(sam0);
			s=x;
		}
        %>
        <%DescriptiveDao dDao=new DescriptiveDao();
        Descriptive d=dDao.getDescriptive(subject.get(i).getYBSId(),"mid1");
        if(d!=null&&d.getExamDate()!=null&&d.getExamOpenTime()!=null&&d.getExamCloseTime()!=null){
        if(d.getExamDate().compareTo(today)==0 &&time.compareTo(d.getExamOpenTime())>=0&&time.compareTo(d.getExamCloseTime())<=0){
        if(sam0.getQuiz1Marks()==0&&s==1){
        %>
        <td><input class="button" type="submit" name="examType" value="start"></td>
        <%}else{ %>
        <td><input class="button" type="submit" name="examType" value="submitted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getQuiz1Marks()); %></td>
        <%}
        }
        else if(d.getExamDate().compareTo(today)<0||(d.getExamDate().compareTo(today)==0 &&time.compareTo(d.getExamCloseTime())>0)){
        if(sam0.getQuiz1Marks()!=null){%>
        <td><input class="button" type="submit" name="examType" value="attempted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getQuiz1Marks()); %></td>
        <%}
        else{%>
        <td><input class="button" type="submit" name="examType" value="not attempted" disabled></td>
        <%}
        }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} %>
       </form>
      </tr>
      <tr>
      <form action="StudentScripts.jsp" method="post">
      <td>Assignment1</td>&nbsp;
      <input type="hidden" name="examType" value="asgn1" />
      <input type="hidden" name="YBSId" value="<%=subject.get(i).getYBSId() %>" />
      <%if(d!=null&& d.getAsgnOpenDate()!=null &&d.getAsgnCloseDate()!=null){
      if(d!=null&&today.compareTo(d.getAsgnOpenDate())>=0&&today.compareTo(d.getAsgnCloseDate())<=0){
        if(sam0.getAsgn1Script().equals("NA")){
        %>
        <td><input class="button" type="submit" name="examType" value="start"></td>
        <%}else{ %>
        <td><input class="button" type="submit" name="examType" value="submitted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getAsgn1Marks()); %></td>
       <%}
        }
        else if(today.compareTo(d.getAsgnCloseDate())>0){
        if(sam0.getAsgn1Marks()!=null){%>
        <td><input class="button" type="submit" name="examType" value="attempted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getAsgn1Marks()); %></td>
        <%}
        else{%>
        <td><input class="button" type="submit" name="examType" value="not attempted" disabled></td>
        <%}
        }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} %>
       </form>
      </tr>
        <tr>
      <form action="StudentScripts.jsp" method="post">
      <td>MID1</td>
      <input type="hidden" name="examType" value="mid1" />
      <input type="hidden" name="YBSId" value="<%=subject.get(i).getYBSId() %>" />
      <%if(d!=null&&d.getExamDate()!=null&&d.getExamOpenTime()!=null&&d.getExamCloseTime()!=null){
          if(d!=null&&today.compareTo(d.getExamDate())==0&&time.compareTo(d.getExamOpenTime())>=0&&time.compareTo(d.getExamCloseTime())<=0){
        if(sam0.getDesc1Script().equals("NA")){
        %>
        <td><input class="button" type="submit" name="examType" value="start"></td>
        <%}else{ %>
        <td><input class="button" type="submit" name="examType" value="submitted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getMid1NetMarks()); %></td>
        <%}
        }
        else if(d.getExamDate().compareTo(today)<0||(d.getExamDate().compareTo(today)==0 &&time.compareTo(d.getExamCloseTime())>0)){
        if(sam0.getMid1NetMarks()!=null){%>
        <td><input class="button" type="submit" name="examType" value="attempted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getMid1NetMarks()); %></td>
        <%}
        else{%>
        <td><input class="button" type="submit" name="examType" value="not attempted" disabled></td>
        <%}
        }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} %>
       </form>
      </tr>
      <tr>
      <form action="./StudentQuizAttempt.jsp" method="post">
        <td>Quiz2</td>
        <input type="hidden" name="examType" value="mid2" />
        <input type="hidden" name="YBSId" value="<%=subject.get(i).getYBSId() %>" />
        <%HashMap hm02 = new HashMap<String,String>();
        session.setAttribute("QA",hm02);
        session.setAttribute("answerOpted","");
        %>
        <%Descriptive d1=dDao.getDescriptive(subject.get(i).getYBSId(),"mid2");
        if(d1!=null&&d1.getExamDate()!=null&&d1.getExamOpenTime()!=null&&d1.getExamCloseTime()!=null){
        if(d1!=null&&d1.getExamDate().compareTo(today)==0&&time.compareTo(d1.getExamOpenTime())>=0&&time.compareTo(d1.getExamCloseTime())<=0){
        if(sam0.getQuiz2Marks()==0&&s==1){
        %>
        <td><input class="button" type="submit" name="examType" value="start"></td>
        <%}else{ %>
        <td><input class="button" type="submit" name="examType" value="submitted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getQuiz2Marks()); %></td>
        <%}
        }
        else if(d1.getExamDate().compareTo(today)<0||(d1.getExamDate().compareTo(today)==0 &&time.compareTo(d1.getExamCloseTime())>0)){
        if(sam0.getQuiz2Marks()!=null){%>
        <td><input class="button" type="submit" name="examType" value="attempted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getQuiz2Marks()); %></td>
        <%}
        else{%>
        <td><input class="button" type="submit" name="examType" value="not attempted" disabled></td>
        <%}
        }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} %>
       </form>
      </tr>
        <tr>
      <form action="StudentScripts.jsp" method="post">
      <td>Assignment2</td>
      <input type="hidden" name="examType" value="asgn2" />
      <input type="hidden" name="YBSId" value="<%=subject.get(i).getYBSId() %>" />
      <%if(d1!=null&&d1.getAsgnOpenDate()!=null&&d1.getAsgnCloseDate()!=null){
          if(d1!=null&&today.compareTo(d1.getAsgnOpenDate())>=0&&today.compareTo(d1.getAsgnCloseDate())<=0){
        if(sam0.getAsgn2Script().equals("NA")){
        %>
        <td><input class="button" type="submit" name="examType" value="start"></td>
        <%}else{ %>
        <td><input class="button" type="submit" name="examType" value="submitted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getAsgn2Marks()); %></td>
        <%}
        }
        else if(today.compareTo(d1.getAsgnCloseDate())>0){
        if(sam0.getAsgn2Marks()!=null){%>
        <td><input class="button" type="submit" name="examType" value="attempted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getAsgn2Marks()); %></td>
        <%}
        else{%>
        <td><input class="button" type="submit" name="examType" value="not attempted" disabled></td>
        <%}
        }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} %>
       <form>
      </tr>
        <tr>
      <form action="StudentScripts.jsp" method="post">
      <td>MID2</td>
      <input type="hidden" name="examType" value="mid2" />
      <input type="hidden" name="YBSId" value="<%=subject.get(i).getYBSId() %>" />
      <%if(d1!=null&&d1.getExamDate()!=null&&d1.getExamOpenTime()!=null&&d1.getExamCloseTime()!=null){
          if(d1!=null&&today.compareTo(d1.getExamDate())==0&&time.compareTo(d1.getExamOpenTime())>=0&&time.compareTo(d1.getExamCloseTime())<=0){
        if(sam0.getDesc2Script().equals("NA")){
        %>
        <td><input class="button" type="submit" name="examType" value="start"></td>
        <%}else{ %>
        <td><input class="button" type="submit" name="examType" value="submitted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getMid2NetMarks()); %></td>
        <%}
        }
        else if(d1.getExamDate().compareTo(today)<0||(d1.getExamDate().compareTo(today)==0 &&time.compareTo(d1.getExamCloseTime())>0)){
        if(sam0.getMid2NetMarks()!=null){%>
        <td><input class="button" type="submit" name="examType" value="attempted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getMid2NetMarks()); %></td>
        <%}
        else{%>
        <td><input class="button" type="submit" name="examType" value="not attempted" disabled></td>
        <%}
        }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} %>
       </form>
      </tr>
      <tr>
      <form action="StudentScripts.jsp" method="post">
      <td>Semester</td>
      <input type="hidden" name="examType" value="sem" />
      <input type="hidden" name="YBSId" value="<%=subject.get(i).getYBSId() %>" />
      <%Descriptive d2=dDao.getDescriptive(subject.get(i).getYBSId(),"sem");
      if(d2!=null&&d2.getExamDate()!=null&&d2.getExamOpenTime()!=null&&d2.getExamCloseTime()!=null){
          if(d2!=null&&d2.getExamDate().compareTo(today)==0&&time.compareTo(d2.getExamOpenTime())>=0&&time.compareTo(d2.getExamCloseTime())<=0){
      if(sam0.getSemScript().equals("NA")){
        %>
        <td><input class="button" type="submit" name="examType" value="start"></td>
        <%}else{ %>
        <td><input class="button" type="submit" name="examType" value="submitted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getSemMarks()); %></td>
        <%}
        }
        else if(d2.getExamDate().compareTo(today)<0||(d2.getExamDate().compareTo(today)==0 &&time.compareTo(d2.getExamCloseTime())>0)){
        if(sam0.getSemMarks()!=null){%>
        <td><input class="button" type="submit" name="examType" value="attempted" disabled></td>
        &nbsp;&nbsp;
        <td><%out.println(sam0.getSemMarks()); %></td>
        <%}
        else{%>
        <td><input class="button" type="submit" name="examType" value="not attempted" disabled></td>
        <%}
        }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} }
        else{%>
        <td><input class="button" type="submit" name="examType" value="not yet started" disabled></td>
        <%} %>
       </form>
      </tr>
      </tbody>
    </table>
  </div>
  </div>
  <%} %>
  <%for(int i=0;i<subjects.size();i++){%>
  <div class="card">
  <div class="content">
  <h4><%=subjects.get(i).getSubjectName()%></h4>
  <table>
  <tbody>
  <tr>
  <input type="hidden" name="examType" value="lab" />
  <input type="hidden" name="YBSId" value="<%=subjects.get(i).getYBSId() %>" />
    <%LabMarksDao labDao=new LabMarksDao();
    LabMarks l=labDao.getLabMarks(studentId,subjects.get(i).getYBSId() );
    if(l==null){
    l=new LabMarks(studentId,subjects.get(i).getYBSId(),0,0,0,null,0);
    int x=labDao.add(l);}
    %>  
  <td>Lab Internal Marks</td>&nbsp;
  <TD></TD>
  <td><%out.println(l.getInternalMarks());%></td>
  </tr><TR>
  <td>Lab External Marks</td>&nbsp;
  <TD></TD>
  <td><%out.println(l.getExternalMarks());%></td>
  </TR>
  </tbody>
  </table>
  </div>
  </div>
  <%} %>
    
  </div>
  </div>
    <script>
    function createPDF() {
        var sTable = document.getElementById('downloadPrint').innerHTML;

        var style = "<style>";
        style = style + "table {width: 100%;font: 17px Calibri;}";
        style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
        style = style + "padding: 2px 3px;text-align: center;}";
        style = style + "</style>";

       
        var win = window.open('', '', 'height=700,width=700');

        win.document.write('<html><head>');
        win.document.write('<title>Semester Score</title>');   
        win.document.write(style);      
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(sTable);       
        win.document.write('</body></html>');

        win.document.close(); 	

        win.print();    
    }
    </script>
</body>
</html>