<%-- 
    Document   : homePage
    Created on : Jan 25, 2017, 8:32:22 PM
    Author     : Sean O'Neil
    Edited by  : James Woods

   The project's home page. This is the first page a user sees before they log in.

   TODO: Implement 'register a new user' functionality that inserts a new account into the database. 
         Implement dropdown menu using bootstrap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <link rel ="stylesheet" href ="styleSheets\hPStyle.css">
    </head>
    <body>
        <%@include file = "header.jsp"%>
        <div style="position:relative;left:200px;top:200px;">
            
            <a href ="loginPage.jsp"><button>Login</button></a>
            <a href ="registerPage.jsp"><button>Register new user</button></a>
            
        </div>
    </body>
</html>