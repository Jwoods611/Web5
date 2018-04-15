<%-- 
    Document   : viewClasses
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
    <title>View classes</title>
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
    <div style="margin-left:200px;">
      <%
        String term = request.getParameter("semester");
        String teacher = session.getAttribute("name").toString();
        String sql = "select name, number, time, crn, room, term from courses where term = '" + term + "' and instructor = '" + teacher + "'";
   
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Web5", "root", "");
        PreparedStatement state = con.prepareStatement(sql);
        ResultSet result = state.executeQuery();
        if (result.next() == false) {
      %>
      <h1><div class="w3-center">Oops! no result set.</div></h1>
      <%
      } else {
        result.beforeFirst();
      %>
      <table class="w3-table">
        <tr>
          <th>Class</th>
          <th>Course Number</th>
          <th>Time</th>
          <th>Term</th>
          <th>Room</th>
          <th>CRN</th>
          <th>View</th>
        </tr>
        <%
          int id;
          String name;
          String time;
          String terms;
          String courseNumber;
          String room;
          int CRN;
          while (result.next()) {
            name = result.getString(1);
            time = result.getString(3);
            CRN = result.getInt(4);
            terms = result.getString(6);
            courseNumber = result.getString(2);
            room = result.getString(6);
        %>
        <tr>
          <td><%=name%></td>
          <td><%=courseNumber%></td>
          <td><%=time%></td>
          <td><%=terms%></td>
          <td><%=room%></td>
          <td><%=CRN%></td>
          <td><form name="classview" action="classView.jsp" method="post">
              <button class="w3-button" type="submit" name="CRN" value="<%=CRN%>">View Class</button>
            </form></td>
        </tr>
        <%        }
          }
        %>

      </table>
    </div>
  </body>
</html> 