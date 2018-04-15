<%-- 
    Document   : semester
    Created on : May 8, 2017, 9:13:37 PM
    Author     : Sean O'Neil
    Edited by  : James Woods

    When a student user clicks on a term to view on the side nagivation bar,
    they're redirected here and the semester they clicked on is set as the
    session attribute to help with further queries.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
        <%
        String semester = request.getParameter("semester");
        session.setAttribute("theSemester",semester);
        response.sendRedirect("studentHome.jsp");
        %>
    </body>
</html>