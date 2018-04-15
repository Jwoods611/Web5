<%-- 
    Document   : loginAction
    Created on : Nov 14, 2016, 2:29:19 PM
    Author     : Ryan Child
    Edited by  : James Woods
    Description: Logs the user in if there is a username and password for an 
                 account matching what was entered in the loginPage.jsp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" 
        import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Login</title>
  </head>
  <body>
    <%
        
       //Fetch the password and username the user entered on loginPage.jsp
      String user = request.getParameter("username");
      String pwd = request.getParameter("password");
      //Query the database for an account matching what was entered, using placeholder values
      String sql = "select * from accounts where username = ?"
              + " and password = ?";
      Class.forName("com.mysql.jdbc.Driver");
      //Establish a connection to the database
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
      PreparedStatement state = con.prepareStatement(sql);
      //Need to set the fields of the prepared statement to what the user entered on loginPage.jsp
      state.setString(1, user);
      state.setString(2, pwd);
      ResultSet result = state.executeQuery();
      if (result.next()) {
          //If there are no matching accounts in the database, redirect to the home page.
        if (result.getString(1) == null) {
          response.sendRedirect("homePage.jsp");
          return;
        }
        /**
         * Username is the sixth column in the 'accounts' table of the database,
         * and name is the second column, so these two values need to be the arguments
         * of the getString() method. Meanwhile, status is the fifth column, and indicates
         * the type of account (i.e. admin, faculty, or student)
         */
        String username = result.getString(6);
        session.setAttribute("user", username);
        String name = result.getString(2);
        session.setAttribute("name", name);
        int status = result.getInt(5);
        session.setAttribute("status", status);
    %>
    <h1><div class="w3-center"><%=status%></div></h1>
      <%
          /**
           * Depending on the status of the account returned by the database query,
           * redirect the user to the corresponding home page. Then, set the attributes that will
           * be used for session control.
           */
          switch (status) {
            case 2:
              session.setAttribute("page", "admin");
              response.sendRedirect("admin/admin.jsp");
              break;
            case 1:
              session.setAttribute("page", "staff");
              response.sendRedirect("faculty/faculty.jsp");
              break;
            case 0:
              session.setAttribute("page", "student");
              session.setAttribute("theSemester", "Spring");              
              response.sendRedirect("student/studentHome.jsp");
              break;
            default:
              response.sendRedirect("homePage.jsp");
          }
        } else {
          response.sendRedirect("homePage.jsp");
          return;
        }
      %>
  </body>
</html>