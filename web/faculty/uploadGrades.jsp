<%-- 
    Document   : uploadGrades
    Created on : Feb 2, 2017, 10:11:12 AM
    Author     : Ryan Child
    Edited by  : James Woods
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Upload Grades</title>
  </head>
  <body>

    <%
      if (session.getAttribute("name") != null) {
        String teacher = session.getAttribute("name").toString();
        String sql = "select name, number, time, instructor, crn, room, cap, term from courses where instructor = '" + teacher + "'";
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
        <th>Room</th>
        <th>Term</th>
        <th>CRN</th>
        <th>View</th>
      </tr>
      <%
        int id;
        String name;
        String time;
        String terms;
        String room;
        String courseNumber;
        int CRN;
        while (result.next()) {
          name = result.getString(1);
          time = result.getString(3);
          CRN = result.getInt(5);
          room = result.getString(6);
          terms = result.getString(8);
          courseNumber = result.getString(2);
      %>
      <tr>
        <td><%=name%></td>
        <td><%=courseNumber%></td>
        <td><%=time%></td>
        <td><%=room%></td>
        <td><%=terms%></td>
        <td><%=CRN%></td>
        <td><form name="classview" action="classGradeUpload.jsp" method="post">
            <button class="w3-button" type="submit" name="CRN" value="<%=CRN%>">View Class</button>
          </form></td>
      </tr>
      <%        }
          }
        }
      %>

    </table>

  </body>
</html>