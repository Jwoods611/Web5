<%-- 
    Document   : studentDropClass
    Created on : Apr 11, 2018, 3:00:53 PM
    Author     : Sean O'Neil
    Edited by  : James Woods

    Removes a course from the courses_accounts table in the database, corresponding
    to the CRN entered by the user.
--%>
<%@page import = "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class dropped!</title>
    </head>
    <body>
        <%
            
            String userCRN = request.getParameter("dropCRN");
            String deleteQuery = "delete from courses_accounts where registerId = '" + session.getAttribute("id") + "' and crn = '" +userCRN + "'";
            Class.forName("com.mysql.jdbc.Driver");
            //Establish a connection to the database
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
            PreparedStatement deleteStmt = connection.prepareStatement(deleteQuery);
            deleteStmt.executeUpdate();
            response.sendRedirect("studentHome.jsp");
            
            %>
    </body>
</html>
