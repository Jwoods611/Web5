<%-- 
    Document   : classView
    Created on : Feb 2, 2017, 10:10:24 AM
    Author     : Ryan Child
    Edited by  : James Woods
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Classes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel ="stylesheet" href ="styleSheets\hPStyle.css">
  </head>
  <body>
    <h1>Welcome, <%out.println(session.getAttribute("name"));%></h1>
    <nav class="w3-sidenav w3-collapse w3-teal w3-card-2 w3-animate-left" style="width:200px;" id="mySidenav">
      <a href="faculty.jsp">Return</a>
    </nav>
    <%
      int CRN = Integer.parseInt(request.getParameter("CRN"));
      String classSql = "select Schoolid, Grade from courses_accounts where CRN = '" + CRN + "'";
      Class.forName("com.mysql.jdbc.Driver");
      Connection classcon = DriverManager.getConnection("jdbc:mysql://localhost:3306/Web5", "root", "");
      PreparedStatement classState = classcon.prepareStatement(classSql);
      ResultSet classResult = classState.executeQuery();
      if (classResult.next() == false) {
    %>
    <h1><div class="w3-center">Oops! no result set.  </div></h1>
    <%
    } else {
      classResult.beforeFirst();
    %>


    <div style="margin-left:200px;">
      <table class="w3-table">
        <tr>
          <th>School ID</th>
          <th>Name</th>
          <th>Grade</th>
          <th>Email</th>
        </tr>
        <%
          int id;
          String name;
          float grade;
          String email;
          while (classResult.next()) {
            //set each term = result part
            id = classResult.getInt(1);
            grade = classResult.getFloat(2);
            //another pull for name and email
            classSql = "select name, email from accounts where id = '" + id + "'";
            classState = classcon.prepareStatement(classSql);
            ResultSet schoolResult = classState.executeQuery();
            if (schoolResult.next() == false) {
        %>
        <h1><div class="w3-center">Oops! no result set. <%=id%></div></h1>
        <%
        } else {
          schoolResult.beforeFirst();
          schoolResult.next();
          name = schoolResult.getString(1);
          email = schoolResult.getString(2);
        %>
        <tr>
          <td><%=id%></td>
          <td><%=name%></td>
          <td><%=grade%></td>
          <td><%=email%></td>
        </tr>

        <%        }
            }
          }
        %>

      </table>
    </div>
  </body>
</html> 