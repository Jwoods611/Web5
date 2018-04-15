<%-- 
    Document   : Logout
    Created on : May 7, 2017, 8:34:47 PM
    Author     : Sean O'Neil
    Edited by  : James Woods

    Navigated to when a user clicks the "Logout" link on the left side navigation bar.
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log out</title>
    </head>
    <body>
        
        <%
         /**
          * Need to set the username, id, and name to empty, then redirect
          * the user to the main page--homePage.jsp
          */
            
        session.setAttribute("user","");
        session.setAttribute("id","");
        session.setAttribute("name","");
        response.sendRedirect("homePage.jsp");
        %>
    </body>
</html>