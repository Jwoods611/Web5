<%-- 
    Document   : addDrop
    Created on : Apr 11, 2018, 10:09:13 AM
    Author     : Sean O'Neil
    Edited by  : James Woods

    Provides the interface to allow students to add and drop classes
    by CRN (course registration number). In the future, would like to make
    all adds/drops approved by the corresponding faculty member

    The add and drop buttons redirect to studentAddClass.jsp and
    studentDropClass.jsp, respectively.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add/drop class</title>
    </head>
    <body>
       <form action = "studentAddClass.jsp">
            <h3>To add a new course, type in the CRN number</h3>
            <input type="text" name="addCRN" ><br>
            <form>
                <button name ="AddClass" type ="submit">Add Class</button>
            </form>
       <form action = "studentDropClass.jsp">
            <h3>To Drop a course, type in the CRN number</h3>
            <input type="text" name="dropCRN" ><br>
            <form>
                <button name ="DropClass" type ="submit">Drop Class</button>
            </form>
    </body>
</html>
