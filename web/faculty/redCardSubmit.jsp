<%-- 
    Document   : redCardSubmit
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
    <title>Submit a red card</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel ="stylesheet" href ="styleSheets\hPStyle.css">
  </head>
  <body>
    <%
      int CRN = Integer.parseInt(request.getParameter("CRN"));
      int id = Integer.parseInt(request.getParameter("student_id"));
      String sql = "UPDATE courses_accounts SET redCard ='" + 0 + "' WHERE CRN = '" + CRN + "' AND registerId = '" + id + "'";
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Web5", "root", "");
      PreparedStatement state = con.prepareStatement(sql);
      state.executeUpdate();
      sql = "select numStudents from courses WHERE CRN = '" + CRN + "'";
      state = con.prepareStatement(sql);
      ResultSet result = state.executeQuery();
      result.next();
      int students = result.getInt(1);
      students = students + 1;
      sql = "UPDATE courses SET numStudents ='" + students + "' WHERE CRN = '" + CRN + "'";
      state = con.prepareStatement(sql);
      state.executeUpdate();
      response.sendRedirect("faculty.jsp");
    %>
  </body>
</html> 