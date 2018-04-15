<%-- 
    Document   : sessionControl
    Created on : May 9, 2017, 10:37:31 AM
    Author     : Ryan Child
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Session Control</title>
  </head>
  <body>
    <%
      if(session.getAttribute("user")==null ||session.getAttribute("name")==null||session.getAttribute("status")==null ||session.getAttribute("user")==""){
          Thread.sleep(5000);
          response.sendRedirect("../index.jsp");
      }
      %>
  </body>
</html>