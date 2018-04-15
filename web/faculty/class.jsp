<%-- 
    Document   : Faculty
    Created on : Feb 2, 2017, 9:49:32 AM
    Author     : Ryan Child
    Edited by  : James Woods
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <div class="w3-center">
      <div class="w3-container w3-blue">
        <h1>Class list: </h1>
        <%
          for (int i = 10; i > 0; i--) { //This will be result set of students take from DB
%>
        <p>Student <%=i%> </p>
        <%
          }
        %>
      </div>
    </div>
  </body>
</html>