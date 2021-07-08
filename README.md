**Steps to execute**
1. Export the code
2. Open AllLoginPage.html in Examination_system/WebContent
3. Run the html page to use the project

**Examination_system/Java Resources/src/com.dao**  
AcadYearDao.java  
Contains all the methods to process/query AcadYear table data.  
ControllerDao.java  
Contains all the methods to process/query Controller table data.  
DescriptiveDao.java  
Contains all the methods to process/query Descriptive table data.  
ExamTaskDao.java  
Contains all the methods to process/query ExamTask table data.  
ExtTeacherDao.java  
Contains all the methods to process/query ExtTeacher table data  
LabMarksDao.java  
Contains all the methods to process/query LabMarks table data  
QuizDao.java  
Contains all the methods to process/query Quiz table data  
SAMDao.java  
Contains all the methods to process/query ScriptsAndMarks table data  
StudentDao.java  
Contains all the methods to process/query Student table data  
TeacherDao.java  
Contains all the methods to process/query Teacher table data  
Today.java  
Contains the methods to get current date and time  

**Examination_system/Java Resources/src/com.db**  
HibernateTemplate.java  
Contains methods to query the data base tables. The methods directly access the database and are used by the DAO.  

**Examination_system/Java Resources/src/com.dto**  
AcadYear.java  
Contains constructors,getters and setters for AcadYear table.  
ontroller.java  
Contains constructors,getters and setters for Controller table.  
Descriptive.java  
Contains constructors,getters and setters for Descriptive table.  
ExamTask.java  
Contains constructors,getters and setters for ExamTask table.  
ExtTeacher.java  
Contains constructors,getters and setters for ExtTeacher table.  
LabMarks.java  
Contains constructors,getters and setters for LabMarks table.  
Quiz.java  
Contains constructors,getters and setters for Quiz table.  
SAM.java  
Contains constructors,getters and setters for ScriptsAndMarks table.  
Student.java  
Contains constructors,getters and setters for Student table.  
Teacher.java  
Contains constructors,getters and setters for Teacher table.  

**Examination_system/Java Resources/src/com.web**  
ControllerEvaluationScheduling.java  
Gets data from ControllerEvaluationScheduling.jsp and updates evaluation dates by calling ExamTaskDao methods.  
ControllerExamScheduling.java  
Gets data from ControllerExamScheduling.jsp and updates exam dates by calling DescriptiveDao methods.  
ControllerExtTeacherMap.java  
Gets data from ControllerExtTeacherMap.jsp and maps scripts to external teachers by calling ExtTeacherDao methods.  
ControllerLogin.java  
Gets data from AllLoginPage.jsp and logs in to Controller account.  
ControllerRegister.java  
Gets data from ControllerRegister.html and adds a new Controller by calling ControllerDao methods.  
ControllerRegisterSubjects.java  
Gets data from ControllerRegisterSubjects.jsp and adds new subjects by calling SubjectDao methods.  
ControllerRenewSemester.java  
Gets data from ControllerNewSemester.jsp and updates semesters by calling AcadyearDao methods.  
ControllerRenewYear.java  
Gets data from ControllerNewSemester.jsp and updates academic years by calling AcadyearDao methods.  
ControllerResultScheduling.java  
Gets data from ControlleResultScheduling.jsp and updates result dates by calling ExamTaskDao methods.  
ControllerSettingScheduling.java  
Gets data from ControllerSettingScheduling.jsp and updates paper setting dates by calling ExamTaskDao methods.  
ExtTeacherLogin.java  
Gets data from AllLoginPage.jsp and logs in to External Teacher account.  
ExtTeacherRegister.java  
Gets data from ExtTeacherRegister.jsp and adds a new External Teacher by calling ExtTeacherDao methods.  
ExtTeacherScriptEvaluation.java  
Gets data from ExtTeacherScriptEvaluation.jsp and updates marks by calling SAMDao methods.  
PasswordReset.java  
Gets data from viewProfile jsp pages and updates password for a user.  
TeacherDescSetting.java  
Gets data from TeacherPaperSetting.jsp and updates question papers by calling SAMDao methods.  
TeacherLabMarksEntry.java  
Gets data from TeacherLabMarksEntry.jsp and updates lab marks by calling LabMarksDao methods.  
TeacherLogin.java  
Gets data from AllLoginPage.jsp and logs in to Teacher account.  
TeacherQuizSetting.java  
Gets data from TeacherQuizSetting.jsp and updates quiz questions by calling QuizDao methods.  
TeacherRegister.java  
Gets data from TeacherRegister.jsp and adds a new Teacher by calling TeacherDao methods.  
TeacherRegisterSubjects.java  
Gets data from TeacherRegisterSubjects.jsp and updates teacherIds in Subject table by calling SubjectDao methods.  
TeacherScriptEvaluation.java  
Gets data from TeacherScriptEvaluation.jsp and updates marks by calling SAMDao methods.  

**Examination_system/WebContent/WEB-INF**  
AllLoginPage.html  
Any user can login/register in/through this page.  
ControllerEvaluationScheduling.jsp  
Controller can schedule paper evaluation for every year.  
ControllerExamSchedulingDashboard.jsp  
Controller can select year and exam type to schedule exams.  
ControllerExamScheduling.jsp  
Controller can schedule exams for every year.  
ControllerExtTeacherMap  
Controller can map external teachers to semester scripts for every year.  
ControllerNewSemester.jsp  
Controller can start a new Academic year and semester.  
ControllerRegister.jsp  
Signing up of a new controller.  
ControllerRegisterSubjects.jsp  
Controller can register new subjects for every year and branch at the start of every new semester.  
ControllerResultScheduling.jsp  
Controller can schedule results for every year.  
ControllerSettingScheduling.jsp  
Controller can schedule paper setting for every year.  
ControllerViewProfile.jsp  
Controller can view his details and reset password.  
ExtTeacherChooseSubject.jsp  
External Teacher can choose his expertise subject while signing up.  
ExtTeacherEvaluation.jsp  
External Teacher can view all the assigned semester scripts to evaluate.  
ExtTeacherProfile.jsp  
External Teacher can view his details and reset password.  
ExtTeacherRegister.jsp  
External Teacher can sign up with basic details entry.  
ExtTeacherScriptEvaluation.jsp  
External Teacher can award marks for the answers in the script.  
TeacherEvaluation.jsp  
Teacher can view statuses of all his subjects' evaluation dates.  
TeacherHome.jsp  
Teacher can view all his activities and has direct access to active activities.  
TeacherLabMarksEntry.jsp  
Teacher can enter lab marks for the registered lab subjects.  
TeacherPaperSetting.jsp  
Teacher can upload question papers and set quiz.  
TeacherProfile.jsp  
Teacher can view his details and reset password.  
TeacherQuizSetting.jsp  
Teacher can enter questions, options and choose answer.  
TeacherRegister.html  
Signing up of a new teacher.  
TeacherRegisterSubjects.jsp  
Teacher can take up new subjects every semester.  
TeacherScriptEvaluation.jsp  
Teacher can award marks for the answers in the script.  
TeacherViewScripts.jsp  
Teacher can view all the scripts of an year and subject and select the script for evaluation.

  
