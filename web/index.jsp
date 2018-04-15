<%-- 
    Document   : index
    Created on : Apr 9, 2018, 6:23:05 PM
    Author     : jcwoo
--%>
<%@page import = "java.util.Date" %>
<%@page import = "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
    </head>
    
    
    <body>
        
        <p>
         
        </p>
        
        <%
            String URL = "jdbc:mysql://localhost:3306/web5";
            String userName = "root";
            String password = "";
            
            Connection connection = null;
            Statement st = null;
            ResultSet result = null;
            
            try 
            {
             connection = DriverManager.getConnection(URL, userName, password);
             String sql = "insert into students "
                     + "(id, name)"
                     + "values (0, 'James')";
             
             st = connection.createStatement();
             st.executeUpdate(sql);
             
            } catch(SQLException e)
            {
                e.printStackTrace();
            }
        %>
    </body>
</html>
