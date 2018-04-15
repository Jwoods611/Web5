<%-- 
    Document   : updateAddFaculty
    Created on : Mar 1, 2017, 5:59:06 PM
    Author     : James

    Updates the database with the information entered by the user on the previous
    page, addFaculty.jsp.

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating Faculty...</title>
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src ="showAdminOptions.js"></script>
    </head>
    <body>
        <%-- dynamically display the username of the admin logged in by fetching
        the username that was entered when logging in. --%>
        <h1>Welcome, <%out.println(session.getAttribute("name"));%></h1>
        <nav class="w3-sidenav w3-collapse w3-teal w3-card-2 w3-animate-left" style="width:200px;" id="mySidenav">
            <a href="javascript:void(0)" onclick="w3_close()" 
               class="w3-closenav w3-large w3-hide-large">Close &times;</a>

            <a href="#" id = rcAddClass>Add Class</a>
            <a href="#" id = rcRemoveClass>Remove Class</a>
            <a href="#" id = rcAddFaculty>Add Faculty</a>
            <a href="#" id = rcRemoveFaculty>Remove Faculty</a>
            <a href="#" id = rcAddStudent>Add Student</a>
            <a href="#" id = rcRemoveStudent>Remove Student</a>
            <%-- Only want to redirect when the logout option is selected. Otherwise,
            the corresponding input fields are displayed on the same page--%>
            <a href="../Logout.jsp" id = logout>Logout</a>
        </nav>


        <div class="w3-main" style="margin-left:200px" id ="AddClass">
            <header class="w3-container">
                <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
                <%@include file ="addClass.jsp" %>
            </header>
        </div>
        <div class="w3-main" style="margin-left:200px" id ="RemoveClass">
            <header class="w3-container">
                <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
                <%@include file ="removeClass.jsp" %>
            </header>
        </div>    
            
        <div class="w3-main" style="margin-left:200px" id ="AddFaculty">
            <header class="w3-container">
                <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
                <%@include file ="addFaculty.jsp" %>
            </header>
        <div class="w3-main" style="margin-left:200px" id ="RemoveFaculty">
            <header class="w3-container">
                <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
                <%@include file ="removeFaculty.jsp" %>
            </header>
        </div>  
            
        </div>
            <div class="w3-main" style="margin-left:200px" id ="AddStudent">
            <header class="w3-container">
                <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
                <%@include file ="addStudent.jsp" %>
            </header>
        </div>
            <div class="w3-main" style="margin-left:200px" id ="RemoveStudent">
            <header class="w3-container">
                <span class="w3-opennav w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</span>
                <%@include file ="removeStudent.jsp" %>
            </header>
        </div>
        <%
        
        //Fetch the information entered by the user on addFaculty.jsp
        String id = request.getParameter("inputID");
        String name = request.getParameter("inputName");
        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword");
        String username = request.getParameter("inputUsername");
        
        
        Statement st1=null;
        Class.forName("com.mysql.jdbc.Driver");
        //Establish a connection to the database
        conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
        
        //Construct the SQL command
        String sql="insert into accounts values('"+id+"','"+name+"','"+email+"','"+password+"','1','"+username+"')";
        st1 = conn.createStatement();
        //Update the database using the SQL command
        st1.executeUpdate(sql);
        //Finally, bring the user back to the admin home page.
        response.sendRedirect("admin.jsp");
        %>
    </body>
</html>