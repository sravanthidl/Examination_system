<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@page import="com.dao.QuizDao"%>
<%@page import="com.dto.Quiz" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <style>
    .card {
  border: 1px solid #d3d3d3;
  border-radius: .75rem;
  background-color: #b9c4f9;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  }
label {
    width: 100%;
}

.card1-input-element {
    display: none;
}

.card1-input {
    padding: 5px 10px;
}

.card1-input:hover {
    cursor: pointer;
}

.card1-input-element:checked + .card1-input {
  border: 1px solid #d3d3d3;
  border-radius: .75rem;
  background-color: #3333dd;
  color:#fff;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
  .card1 {
  border: 1px solid #d3d3d3;
  border-radius: .75rem;
  background-color: #ffffff;
  display: flex;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  }
  
  .content {
  padding: 15px;
  text-align: center;
}
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
  margin-top: 100px;
}
.button {
  background-color: #0000dd;
  border: 1px solid #2196F3;
  padding: .5rem 1rem;
  cursor: pointer;
  color: #ffffff;
  border-radius: .25rem;
 }
.button1 {
  background-color: #b9c4f9;
  border: 1px solid #2196F3;
  padding: .5rem 1rem;
  cursor: pointer;
  color: #000000;
  border-radius: .95rem;
 }
 .grid-container .card:first-child {
   grid-column:1/3;
   background-color: #a9c4f9;
}
 </style>
</head>
<body onload="examTimer()">
<%			String studentId = (String)session.getAttribute("studentId");
			String YBSId = (String)request.getParameter("YBSId");
			String examType = (String)request.getParameter("examType");
			session.setAttribute("YBSId", YBSId);
			session.setAttribute("examType", examType);
			session.setAttribute("studentId", studentId);
			System.out.println("studentId:" + studentId);
			System.out.println("YBSId:" + YBSId);
			System.out.println("examType:" + examType);
			%>
			<%
int minute=0,second=0;
if(request.getParameter("minute")!=null){		
			System.out.println(request.getParameter("minute"));
			System.out.println(request.getParameter("second"));
			minute=Integer.parseInt(request.getParameter("minute"));
			second=Integer.parseInt(request.getParameter("second"));
			request.getSession().setAttribute("min",request.getParameter("minute"));
			request.getSession().setAttribute("sec",request.getParameter("second"));
}%>
  <div class="grid-container">
  <div class="card">
  <div class="content">
<form name="formQ" action="./StudentQuizAttempt.jsp" method="post">
<%
String answer=" ";
if(request.getParameter("correctAns")!=null)
{
answer=request.getParameter("correctAns").toString();
}
try {
int current=1;
if(request.getParameter("hidden")!=null){
	current=Integer.parseInt(request.getParameter("hidden"));
}
QuizDao quizDao = new QuizDao();
List<Quiz> quiz = quizDao.getQuizList(YBSId,examType);
Quiz q=new Quiz();
if(current<1){
	current=1;
}
int rows=quiz.size();
if(current<=rows){
	q=quiz.get(current-1);
}
%>
<%int qNo=q.getQuestionNo() ;%>
    <h4><%=q.getQuestion()%></h4>
    <div class="card1">
    <label>
            <input type="radio" name="opted" class="card1-input-element" value="A<%=qNo%>"><div class="card1-input"><%=q.getOptionA()%></div></label>
    </div><br/>
    <div class="card1">
        <label>
            <input type="radio" name="opted" class="card1-input-element" value="B<%=qNo%>"><div class="card1-input"><%=q.getOptionB()%></div></label>
    </div><br/>
    <div class="card1">
          <label>
            <input type="radio" name="opted" class="card1-input-element" value="C<%=qNo%>"><div class="card1-input"><%=q.getOptionC()%></div></label>
    </div><br/>
    <div class="card1">
        <label>
            <input type="radio" name="opted" class="card1-input-element" value="D<%=qNo%>"><div class="card1-input"><%=q.getOptionD()%></div></label>
    </div><br/>
    
    <input type="hidden" name="correctAns" value="<%=q.getAnswerOption()%>" />
	<input type="hidden" name="hidden" value="<%=current%>">
	<input type="hidden" name="YBSId" value="<%=YBSId%>">
	<input type="hidden" name="examType" value="<%=examType%>">
	<input type="hidden" name="minute" /> 
	<input type="hidden" name="second" />
	<%if(current > 1)
   {
 %>
    <input class="button" type="button" value="save and previous" onclick="movePrevious(); customSubmit();">
    <%} %>
 
 <%
   if(current < rows)
   {
 %>
    <input class="button" type="button" value="save and next" onclick="moveNext(); customSubmit();">
     <%} %>
   <%if(current == rows)
   {
 %>
    <input class="button" type="button" value="save answer" onclick="move(<%=current%>); customSubmit();">
     <%} %>
     </form>
    </div>
  </div>
  <div class="card1">
  <div class="content">
  <h1 style="color:#0000cc;"><div id="showtime"></div></h1>
    <h4>Questions</h4>
    <% for(int i=0;i<rows;i++){ %>
		<input class="button1" type="button" value=<%=i+1%> onclick="move(<%=i+1%>); customSubmit();">&nbsp;
<%} %>
<br/><br/><br/><br/>
    <br/><br/><br/><br/>
    <input class="button" type="submit" value="finish" form="fs">
 </div>
</div>
</div>
<%
HashMap<String,String> qos= (HashMap<String,String>) session.getAttribute("QA");
String g=request.getParameter("opted");
qos.put(g.substring(1),g.substring(0,1));
session.setAttribute("QA",qos);
}
catch (Exception ex) {
ex.printStackTrace();
}%>
</form>
<form id="fs" action="./QuizResult" method="post">
</form>
<script>
function getFullscreenElement() {
      return document.fullscreenElement   //standard property
      || document.webkitFullscreenElement //safari/opera support
      || document.mozFullscreenElement    //firefox support
      || document.msFullscreenElement;    //ie/edge support
   }

   function toggleFullscreen() {
      if(getFullscreenElement()) {
         document.exitFullscreen();
      }else {
    document.documentElement.requestFullscreen().catch(console.log);
      }
   }document.addEventListener('dblclick',() => {
      toggleFullscreen();
   });
   function moveNext(){
	   var count=0
	   count=parseInt(document.formQ.hidden.value)+1
	   document.formQ.hidden.value=count
	   //formQ.submit()
   }
   function movePrevious(){
	   var count=0
	   count=parseInt(document.formQ.hidden.value)-1
	   document.formQ.hidden.value=count
	   //formQ.submit()
   }
   function move(i)
   {
       var counter = 0
       document.formQ.hidden.value = i
       //formQ.submit()
   }
   var tim;       
   var min = '${sessionScope.min}';
   var sec = '${sessionScope.sec}';
   var f = new Date();

   function customSubmit(someValue){  
   	 document.formQ.minute.value = min;   
   	 document.formQ.second.value = sec; 
   	 document.formQ.submit();  
   	 }  

   function examTimer() {
       if (parseInt(sec) >0) {

   	    document.getElementById("showtime").innerHTML = ""+min+":" + sec+"";
           sec = parseInt(sec) - 1;                
           tim = setTimeout("examTimer()", 1000);
       }
       else {

   	    if (parseInt(min)==0 && parseInt(sec)==0){
   	    	document.getElementById("showtime").innerHTML = ""+min+":" + sec+"";
   		     alert("Time Up");
   		  	 location='./QuizResult';
   		     document.formQ.minute.value=0;
   		     document.formQ.second.value=0;
   		     document.fs.submit();

   	     }

           if (parseInt(sec) == 0) {				
   		    document.getElementById("showtime").innerHTML = ""+min+":" + sec+"";					
               min = parseInt(min) - 1;
   			sec=59;
               tim = setTimeout("examTimer()", 1000);
           }

       }
   }


 </script>

</body>
</html>