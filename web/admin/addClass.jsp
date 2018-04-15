<%-- 
    Document   : addClass
    Created on : Feb 6, 2017, 11:44:00 PM
    Author     : Sean O'Neil
    Edited by  : James Woods

    Provides input fields for an administrator to add a course to the database.
    When the administrator submits the data, the program redirects to updateAddClass.jsp,
    where the SQL query is processed and the database is updated.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Class</title>
    </head>
    <body>
        <%
        Connection conn=null;
        Statement st=null;
        Class.forName("com.mysql.jdbc.Driver");
        /**
         * Only need to establish a connection with the database in order to dynamically display available instructors,
         *  which are drawn from the accounts table of the database.
         */
        conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
        ResultSet choiceSet = null;
        st = conn.createStatement();
        /**
         * 'status' is a column in the 'accounts' table of the database. It's used to differentiate
         * between types of accounts; '2' for administrator, '1' for faculty, and '0' for student.
         */
        choiceSet = st.executeQuery("SELECT * FROM `accounts`WHERE `status` = 1 AND NOT name = 'Faculty'");
        %>

    <center>
        <table border="1" cellpadding="30">
            <form name="getForm" action="updateAddClass.jsp" method="get">
                <tr>
                    <td>Course Name</td>
                    <td><input type="text" name="inputName"></td>
                </tr>
                <tr>
                    <td>Course Number</td>
                    <td><input type="text" name="inputNumber"></td>
                </tr>
                <tr>
                    <td>Time</td>
                    <td><input type="time" name="inputTime"></td>
                </tr>
                <tr>
                    <tr>
                    <td>Instructor</td>
                    <td><select name="inputInstructor">
  <option>Select...</option>
  <%-- Dynamically display available instructors
  "name" has a column index of 2 in the 'accounts' table, so
  2 needs to be the argument of getString()
  --%>
  <%  while(choiceSet.next()){ %>
            <option><%= choiceSet.getString(2)%></option>
        <% } %>
                    </select></td>
                </tr>
                <tr>
                    <td>CRN</td>
                    <td><input type="text" name="inputCRN"></td>
                </tr>
                <tr>
                    <td>Room</td>
                    <td><input type="text" name="inputRoom"></td>
                </tr>
                <tr>
                    <td>Student Cap</td>
                    <td><input type="text" name="inputCap"></td>
                </tr>
                <tr>
                    <td>Semester</td>
                            <td><select name="inputSemester">
                                    <option>Select..</option>
                                    <option>Spring</option>
                                    <option>Summer</option> 
                                    <option>Fall</option> 
                                    <option>Winter</option> 
                        </select></td>
                </tr>
                    <td colspan="2">
                        <input type="submit" value="Add Course">
                    </td>
                </tr>
            </form>
        </table>
    </center>
    </body>
</html>