<%-- 
    Document   : uploadClassGrade
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
    <title>Upload class grade</title>
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
        int CRN = Integer.parseInt(request.getParameter("CRN"));
        String sql = "select Schoolid, Grade from courses_accounts where CRN = '" + CRN + "'";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Web5", "root", "");
        PreparedStatement state = con.prepareStatement(sql);
        ResultSet result = state.executeQuery();
        if (result.next() == false) {
      %>
      <h1><div class="w3-center">Oops! no result set. 1 </div></h1>
      <%
      } else {
        result.beforeFirst();
      %>
      <div style="margin-left:200px;">
        <table class="w3-table">
          <tr>
            <th>School ID</th>
            <th>Name</th>
            <th>Current Grade</th>
            <th>New Grade</th>
            <th>Email</th>
            <th>Submit</th>
          </tr>
          <%
            int tracker = 0;
            int id;
            String name;
            float grade;
            String email;
            while (result.next()) {
              //set each term = result part
              id = result.getInt(1);
              grade = result.getFloat(2);
              //another pull for name and email
              sql = "select name, email from accounts where id = '" + id + "'";
              state = con.prepareStatement(sql);
              ResultSet schoolResult = state.executeQuery();
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
          <form name="uploadStudentGrade" action="uploadStudentGrade.jsp" method="post">
            <td><%=id%></td>
            <input type="hidden" name="student_id" value="<%=id%>">
            <td><%=name%></td>
            <td><%=grade%></td>
            <td><input class="w3-input w3-border" type="text" name="grade"></td>
            <td><%=email%></td>
            <td><button class="w3-btn w3-Blue w3-round-xlarge" type="submit" name="CRN" value="<%=CRN%>">Submit Grade</button>
            </td></form>
          </tr>

          <%        }
              }
            }
          %>
        </table>
      </div>
    </div>
  </body>
</html> 