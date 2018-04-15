<%-- 
    Document   : addStudent
    Created on : Feb 6, 2017, 11:44:00 PM
    Author     : James Woods
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a student</title>
    </head>
    <body>
    
    <center>
        <table border="1" cellpadding="30">
            <form name="getForm" action="updateAddStudent.jsp" method="get">
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="inputID"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="inputName"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="inputEmail"></td>
                </tr>
                <tr>
                    <tr>
                    <td>Password</td>
                    <td><input type="text" name="inputPassword"></td>
                </tr>
                    <td>Username</td>
                    <td><input type="text" name="inputUsername"></td>
                </tr>
                    <td colspan="2">
                        <input type="submit" value="Add Student">
                    </td>
                </tr>
            </form>
        </table>
    </center>
    </body>
</html>