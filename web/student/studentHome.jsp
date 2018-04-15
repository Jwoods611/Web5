<%--
    Document   : studentHome
    Created on : Apr 11, 2018, 9:56:25 AM
    Author     : James Woods
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Home</title>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src ="showStudentOptions.js"></script>
  </head>
  <body>
    <%@include file = "../sessionControl.jsp" %>
    <%  /* In order to query the database for the correct courses, we need to first determine the
         * student user's id in the database, and session.setAttribute() accordingly.
         *
         */
        String idQuery = "select id from accounts where username = '" + session.getAttribute("user") + "'";
        Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
        PreparedStatement statement = connect.prepareStatement(idQuery);
        ResultSet results = statement.executeQuery();
        if(results.next())
        {
        results.beforeFirst();
        results.next();
        int studentId = results.getInt(1);
        session.setAttribute("id", studentId);
        }
        %>
    
    <h1>Welcome, <%out.println(session.getAttribute("name"));%></h1>
    <nav class="w3-sidenav w3-collapse w3-teal w3-card-2 w3-animate-left" style="width:200px;" id="mySidenav">
      <a href="javascript:void(0)" onclick="w3_close()" 
         class="w3-closenav w3-large w3-hide-large">Close &times;</a>


      <div class="w3-dropdown-hover">
        <a href="#" id = rcTerm>Select Term</a>
        
        <form action = "semester.jsp">
          <div class="w3-dropdown-content w3-white w3-card-4" >
            <ul>
              <a><button type ="submit" value="Spring" name="semester" style = "padding: 0;border: none;background: none;visited,link{text-decoration: none}">Spring</button></a>
              <a><button type ="submit" value="Summer" name="semester" style = "padding: 0;border: none;background: none;visited,link{text-decoration: none}">Summer</button></a>
              <a><button type ="submit" value="Fall" name="semester" style = "padding: 0;border: none;background: none;visited,link{text-decoration: none}">Fall</button></a>
              <a><button type ="submit" value="Winter" name="semester" style = "padding: 0;border: none;background: none;visited,link{text-decoration: none}">Winter</button></a>
            </ul>
          </div>
        </form>

      </div>
      <a href="#" id = rcCatalog>Course Catalog</a>
      <a href="#" id = rcADC>Add/drop Classes</a>
      <a href="#" id = rcDS>Student Detail Schedule</a>
      <a href="#" id = rcRedCard>Red cards</a>
      <a href="#" id = rcGrade>Grades</a>
      <a href="../Logout.jsp" id = logout>Logout</a>
    </nav>
    
    
    <div class="w3-main" style="margin-left:200px" id ="redcard">
      <header class="w3-container">
        <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
        <%@include file ="redCard.jsp" %>
      </header>
    </div>

    <div class="w3-main" style="margin-left:200px" id ="grade">
      <header class="w3-container">
        <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
        <%@include file ="studentGrades.jsp" %>
      </header>
    </div>
    <div class="w3-main" style="margin-left:200px" id ="coursecatalog">
      <header class="w3-container">
        <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
        <%@include file ="courseCatalog.jsp" %>
      </header>
    </div>
    <div class="w3-main" style="margin-left:200px" id ="AddDrop">
      <header class="w3-container">
        <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
        <%@include file ="addDrop.jsp" %>
      </header>
    </div>
    <div class="w3-main" style="margin-left:200px" id ="courseschedule">
      <header class="w3-container">
        <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
        <%@include file ="studentSchedule.jsp" %>
      </header>
    </div>

  </body>
</html>