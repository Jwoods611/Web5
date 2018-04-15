<%-- 
    Document   : viewRedCards
    Created on : Feb 2, 2017, 10:11:02 AM
    Author     : Ryan Child
    Edited by  : James Woods
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@page import="java.sql.*"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View red cards</title>
  </head>
  <body>

    <%
      if (session.getAttribute("name") != null) {
        boolean flag = false;
        String teachers = session.getAttribute("name").toString();
        String sqls = "select name, number, time, instructor, crn, room, cap, term from courses where instructor = '" + teachers + "'";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con_red = DriverManager.getConnection("jdbc:mysql://localhost:3306/Web5", "root", "");
        PreparedStatement states = con_red.prepareStatement(sqls);
        ResultSet results = states.executeQuery();
        if (results.next() == false) {
    %>
    <h1><div class="w3-center">You have no classes</div></h1>
    <%
      flag = true;
    } else {
    %>
    <div style="margin-left:200px;">
      <table class="w3-table">
        <tr>
          <th>School ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Accept</th>
          <th>Deny</th>
        </tr>
        <%
          int CRN = 0;
          int red_init = 0;
          String classSql;
          int id = 0;
          String name = "";
          String email = "";
          results.beforeFirst();
          while (results.next()) {
            CRN = results.getInt(5);
            String get_sql = "select registerId, redCard from courses_accounts where crn = '" + CRN + "'";
            states = con_red.prepareStatement(get_sql);
            ResultSet result_red = states.executeQuery();
            result_red.beforeFirst();
            if (result_red.next() == false) {
        %>
        <h1><div class="w3-center">You have no students signed up for your classes </div></h1>
        <%
          flag = true;
        } else {
          result_red.beforeFirst();
          while (result_red.next()) {
            red_init = result_red.getInt(2);
            id = result_red.getInt(1);
            if (red_init == 1) {
              classSql = "select name, email from accounts where id = '" + id + "'";
              states = con_red.prepareStatement(classSql);
              ResultSet result_account = states.executeQuery();
              result_account.next();
              name = result_account.getString(1);
              email = result_account.getString(2);
              flag = true;
        %>
        <tr>
          <td><%=id%></td>
          <td><%=name%></td>
          <td><%=email%></td>
        <form name="redCardSubmit" action="redCardSubmit.jsp" method="post">
          <input type="hidden" name="student_id" value="<%=id%>">
          <td><button class="w3-btn w3-Blue w3-round-xlarge" type="submit" name="CRN" value="<%=CRN%>">Accept</button>
        </form>
        <form name="redCardDeny" action="redCardDeny.jsp" method="post">
          <input type="hidden" name="student_id" value="<%=id%>">
          <td><button class="w3-btn w3-Blue w3-round-xlarge" type="submit" name="CRN" value="<%=CRN%>">Deny</button>
        </form>
        </td>
        </tr>
        <%
                  }
                }
              }
            }
          }
          if (flag == false) {
        %>
        <h1><div class="w3-center">You have no red card requests</div></h1>
        <%
            }
          }
        %>
        </body>
        </html>