<%-- 
    Document   : studentAddClass
    Created on : Apr 11, 2018, 2:59:50 PM
    Author     : Sean O'Neil
    Edited by  : James Woods

     Adds a course to the courses_accounts table in the database, corresponding
     with the CRN entered by the user.
--%>
<%@page import = "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class added!</title>
    </head>
    <body>
        <%
           String termSet = "";
           String userCRN = request.getParameter("addCRN");
           Class.forName("com.mysql.jdbc.Driver");
           //Establish a connection to the database
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
           
           //Get the semester for the course with the corresponding CRN
           String termQuery = "select term from courses where crn = '"  +userCRN+ "'";
           PreparedStatement termStmt = connection.prepareStatement(termQuery);
           ResultSet termResult = termStmt.executeQuery();
           if(termResult.next())
            termSet = termResult.getString(1);
           String addQuery = "insert into courses_accounts values ('" + session.getAttribute("id")+ "','"+userCRN+"','" + 0 + "','" + 0+ "','" + termSet + "')";
           PreparedStatement addStmt = connection.prepareStatement(addQuery);
           addStmt.executeUpdate();
           //Finally, redirect back to student home
           response.sendRedirect("studentHome.jsp");
         
        %>
    </body>
</html>
