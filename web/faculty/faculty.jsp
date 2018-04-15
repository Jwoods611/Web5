<%-- 
    Document   : faculty
    Created on : Feb 5, 2017, 12:24:06 PM
    Author     : Sean O'Neil
    Edited by  : James Woods
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Faculty home</title>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <%@include file="../sessionControl.jsp"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src ="showFacultyOptions.js"></script>
  </head>
  <body>
    <h1>Welcome, <%out.println(session.getAttribute("name"));%></h1>
    <nav class="w3-sidenav w3-collapse w3-teal w3-card-2 w3-animate-left" style="width:200px;" id="mySidenav">
      <a href="javascript:void(0)" onclick="w3_close()" 
         class="w3-closenav w3-large w3-hide-large">Close &times;</a>



      <div class="w3-dropdown-hover">
        <a href="#" id = viewClasses>View classes</a>
        <form action = "viewClasses.jsp">
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
      <a href="#" id = rcuploadGrades>Upload Grades</a>
      <a href="#" id = rcviewRedCards>View Red Cards</a>
      <a href="../Logout.jsp" id = logout>Logout</a>
    </nav>


    <div class="w3-main" style="margin-left:200px" id ="uploadGrades">
      <header class="w3-container">
        <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
        <%@include file ="uploadGrades.jsp" %>
      </header>
    </div>

    <div class="w3-main" style="margin-left:200px" id ="viewRedCards">
      <header class="w3-container">
        <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
        <%@include file ="viewRedCards.jsp" %>
      </header>
    </div>

  </body>
</html>