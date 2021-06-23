<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.dao.StudentDao" import="com.dto.Student" %>
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
	height:120%;
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
	top:15.5%;
	left:14%;
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
}  .menu_bar{
	position:absolute;
	background-color:#b9c4f9;
	height:50px;
	width:100%;
	text-decoration:none;
	font-size:17px;
}
.body_bar{
	background-color:#f0f0f0;
	height:650px;
	width:90%;
	position:absolute;
	top:180px;
	left:5%;
}
  
  .card {
  border: 1px solid #d3d3d3;
  border-radius: .75rem;
  background-color: #b9c4f9;
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
  background-color: #0000dd;
  border: 1px solid #2196F3;
  padding: .5rem 1rem;
  cursor: pointer;
  color: #000000;
  border-radius: .25rem;
 }
 .grid-container .card:nth-child(4) {
   grid-column: 4;
   grid-row:1/3;
   background-color: #dda9a9;
}
.td{
  text-align: center;
}.dropdown {
	position:absolute;
	padding:12.5px 50px;
	display: inline-block;
}
.dropdown:hover{
	background-color: #0a2081;
	color:white;
}
.dropdown_content_box {
	display: none;
	color:black;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	top:50px;
}
.dropdown:hover .dropdown_content_box {
	position:absolute;
	display: block;
}
.dropdown_content_options{
	position:absolute;
	background-color:#b9c4f9;
  	min-width:284px;
  	min-height:40px;
	top:0px;
	padding-top:7px;
	text-align:center;
	font-size:15px;
	text-decoration:none;
}
.dropdown_content_options:hover{
	background-color:#a1aff7;
}

  </style>
</head>
<body>
  <div class="top1">
		<p style="margin-left:30px;color:#e7e9f4">Home</p>
	</div>
	
	<div class="top2">
		
	</div>
	
	<div class="vertical_menu_bar">
		<a href="TeacherHome.jsp"><div>
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

  <%  String studentId = (String)session.getAttribute("studentId"); 
		StudentDao studentDao = new StudentDao();
		Student student = studentDao.getStudent(studentId);
		System.out.println(studentId);
	%>
		
		<div style="height:600px;width:40%;position:absolute;top:40px;left:15%;background-color:#d0d7fb;border-radius:10px;">
			<img src="pics/profile_pic.png" style="width:150px;height:150px;left:180px;top:20px;position:absolute">
			
			<hr style="height:2px;width:80%;left:50px;top:170px;position:absolute;background-color:grey;border:none">
			<p style="left:100px;top:190px;position:absolute">Name<p>
			<p style="left:250px;top:190px;position:absolute;color:grey"><%=student.getName()%><p>
			<hr style="height:2px;width:80%;left:50px;top:220px;position:absolute;background-color:grey;border:none">
			
			<p style="left:80px;top:240px;position:absolute">Student Id<p>
			<p style="left:250px;top:240px;position:absolute;color:grey"><%=studentId%><p>
			<hr style="height:2px;width:80%;left:50px;top:270px;position:absolute;background-color:grey;border:none">
			
			<p style="left:80px;top:290px;position:absolute">Branch<p>
			<p style="left:250px;top:290px;position:absolute;color:grey"><%=student.getBranch()%><p>
			<hr style="height:2px;width:80%;left:50px;top:320px;position:absolute;background-color:grey;border:none">
			
			<p style="left:80px;top:340px;position:absolute">Batch<p>
			<p style="left:250px;top:340px;position:absolute;color:grey"><%=student.getBatch()%><p>
			<hr style="height:2px;width:80%;left:50px;top:370px;position:absolute;background-color:grey;border:none">
			
			<p style="left:80px;top:390px;position:absolute">Email<p>
			<p style="left:250px;top:390px;position:absolute;color:grey"><%=student.getEmail()%><p>
			<hr style="height:2px;width:80%;left:50px;top:420px;position:absolute;background-color:grey;border:none">
			
			<p style="left:80px;top:440px;position:absolute">Phone<p>
			<p style="left:250px;top:440px;position:absolute;color:grey"><%=student.getMobile()%><p>
			<hr style="height:2px;width:80%;left:50px;top:470px;position:absolute;background-color:grey;border:none">
		
			<p style="left:80px;top:490px;position:absolute">Current Semester<p>
			<p style="left:250px;top:490px;position:absolute;color:grey"><%=student.getCurrentYear()%><p>
			<hr style="height:2px;width:80%;left:50px;top:520px;position:absolute;background-color:grey;border:none">
			
			<p style="left:80px;top:540px;position:absolute">CGPA<p>
			<p style="left:250px;top:540px;position:absolute;color:grey"><%=student.getCgpa()%><p>
			<hr style="height:2px;width:80%;left:50px;top:570px;position:absolute;background-color:grey;border:none">
		
		</div>
	
		<div style="min-height:180px;width:100%;position:absolute;top:180px;left:300px"><!-- bluepatch -->
		
			<p style="font-size:23px;top:-90px;left:540px;position:absolute"><strong>Password Reset</strong></p>
			
			<div style="height:300px;width:30%;position:absolute;top:-10px;left:35%;background-color:#d0d7fb;border-radius:10px;">
				<form action="PasswordReset">
					<input type="hidden" name="user" value="student">
					<p style="left:80px;top:32px;position:absolute">New Password<p>
					<input style="left:80px;top:76px;position:absolute" type="password" size="25" name="password">
					<p style="left:80px;top:106px;position:absolute">Confirm Password<p>
					<input style="left:80px;top:150px;position:absolute" type="password" size="25" name="rePassword">
					<input style="left:160px;top:215px;position:absolute" type="submit" value="Submit">
				</form>
			</div>
		
		</div>
	
	</div>
</body>
</html>