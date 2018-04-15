<%-- 
    Document   : pdateAddClass
    Created on : Mar 1, 2017, 5:59:06 PM
    Author     : James Woods

Takes the fields from addClass.jsp and uses them to input the corresponding information into the database.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating courses...</title>
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src ="showAdminOptions.js"></script>
    </head>
    <body>
        <%--
          Dynamically display the username, taking the  "name" field from loginAction.jsp
        --%>
        <h1>Welcome, <%out.println(session.getAttribute("name"));%></h1>
        <%-- Implements a side navigation bar --%>
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

         <%-- Here, including the corresponding jsp page allows the user to not navigate pages
              While still seeing the correct options and input fields --%>
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
            
        //Fetch all the necessary data from the client (data entered by the user
        //on the addClass.jsp page)
        
        String name = request.getParameter("inputName");
        String courseNumber = request.getParameter("inputNumber");
        String crn = request.getParameter("inputCRN");
        String instructor = request.getParameter("inputInstructor");
        String term = request.getParameter("inputSemester");
        String room = request.getParameter("inputRoom");
        String cap = request.getParameter("inputCap");
        String time = request.getParameter("inputTime");
        
        Class.forName("com.mysql.jdbc.Driver");
        
        //Establish a connection with the database
        conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
        
        //Construct the SQL query using the data fetched above
        String sql = "insert into courses VALUES('"+name+"', '"+courseNumber+"', '"+time+"', '"+instructor+"', '"+crn+"', '"+room+"', '"+cap+"', '"+term+"','" +0+ "')";
           
        //Try to update the database with the constructed SQL query, then redirect to admin homepage.
        //If it fails, print the stack trace
        try
        {
            st = conn.createStatement();
            st.executeUpdate(sql);
            response.sendRedirect("admin.jsp");
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        %>
        
    </body>
</html>