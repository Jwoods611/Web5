<%-- 
    Document   : studentSchedule
    Created on : Apr 11, 2018, 10:09:24 AM
    Author     : James Woods

    Displays to the student user their class schedule. Queries are dependent on
    The id of the user logged in, and the semester they selected under "select term".
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Schedule</title>
    </head>
    <body>
        <h1>Here are your current classes this semester</h1>
        <table class="w3-table w3-striped">
            <tr>
                <td>Course</td>
                <td>Course Number</td>
                <td>Instructor</td>
                <td>Time</td>
                <td>Room Location</td>
            </tr>
        <%
        Connection conn=null;
        Statement st=null;
        Class.forName("com.mysql.jdbc.Driver");
        /**
         * Only need to establish a connection with the database in order to dynamically display available instructors,
         *  which are drawn from the accounts table of the database.
         */
        conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
        ResultSet result = null;
        st = conn.createStatement();
        String sqlCommand = "select crn from courses_accounts where registerId = '" + session.getAttribute("id") + "' and semester = '" + session.getAttribute("theSemester") + "' and redCard = 0";
        result = st.executeQuery(sqlCommand);
        /*
         *Since there will be multiple rows returned, we're going to concatenate all of them and
         *put them in a String, separated by a comma. Then we're going to split the string at
         *each comma to obtain all the CRNs individually.
         */
        
        String concatCrns = "";
        
        /*Concatenate a string of CRNs to be split at the comma character,
         * then fill a String array with the resulting substrings.
         */
        while(result.next())
        {
            concatCrns += result.getString(1) + ",";
        }
        String [] allCrns = concatCrns.split(",");
        
        /*
         *Finally, we need to loop through the String array, and for each
         *CRN (substring), query the courses database for the fields that need
         *to be displayed to the student.
         */
         String courseName1 = "";
         String courseNumber = "";
         String courseInstructor = "";
         String courseTime = "";
         String courseRoom = "";
         
         String courseInfo = "";
         int numCrns = allCrns.length;
         for (int i = 0; i < numCrns; i++)
         {   
            //For each CRN, query the database for the corresponding course info
             courseInfo = "select name, number, time, instructor, room from courses where crn = '" +allCrns[i] +"'"; 
             ResultSet resultCourses = st.executeQuery(courseInfo);
            //Next, fetch all the information from the resultSet
            resultCourses.beforeFirst();
            if(resultCourses.next())
            {
            courseName1 = resultCourses.getString(1);
            courseNumber = resultCourses.getString(2);
            courseTime = resultCourses.getString(3);
            courseInstructor = resultCourses.getString(4);
            courseRoom = resultCourses.getString(5);
            resultCourses.next();
            }
            //Finally, create a table that displays all the information
            %>
          <tr>
          <td><%=courseName1%></td>
          <td><%=courseNumber%></td>
          <td><%=courseInstructor%></td>
          <td><%=courseTime%></td>
          <td><%=courseRoom%></td>
          </tr>
        
            <%
               
         }
                result.close();
                st.close();
                conn.close();
        %>
        </table>
    </body>
</html>
