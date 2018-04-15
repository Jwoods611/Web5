<%-- 
    Document   : courseCatalog
    Created on : Apr 11, 2018, 10:08:59 AM
    Author     : James Woods

    Dynamically displays all the courses in the 'courses' table of the database
    to a student user.
--%>

<%@page import = "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Catalog</title>
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    </head>
    <body>
        
        <h1>Here are the courses offered by our college</h1>
        
        <table class="w3-table w3-striped">
            <tr>
                <td>Name</td>
                <td>Course Number</td>
                <td>Instructor</td>
                <td>Time</td>
                <td>Room Location</td>
                <td>CRN</td>
            </tr>
        
            
     <%
                
        
        
        /**
         * In order to loop through the resultset without calling resultingInfo.next()
         * twice, we need to get a count on the number of rows in the 'courses' table.
         * Otherwise, the cursor will move twice per while loop and only 
         * every other course will be displayed.
         */
        
        Class.forName("com.mysql.jdbc.Driver");
        
        //Establish a connection with the database
        Connection cnct = DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
        String getCourses = "select * from courses";       
        PreparedStatement getCourseNumber = cnct.prepareStatement(getCourses);
        ResultSet resultingInfo = getCourseNumber.executeQuery();
        
        
        
       //Init String/int variables to hold each column value
        String catalogCourseName = "";
        String catalogCourseNumber = "";
        String catalogCourseInstructor = "";
        String catalogCourseTime = "";
        String catalogCourseRoom = "";
        int catalogCourseCRN = 0;
        
           resultingInfo.beforeFirst();
           while(resultingInfo.next())
           {
               /*Fetch the data at the current row for each column 
                 *in the query. Don't need to move the cursor
                 *to the next row because the condition in the
                 * while loop does so already.
                 */
                catalogCourseName = resultingInfo.getString(1);
                catalogCourseNumber = resultingInfo.getString(2);
                catalogCourseInstructor = resultingInfo.getString(4);
                catalogCourseTime = resultingInfo.getString(3);
                catalogCourseRoom = resultingInfo.getString(6);
                catalogCourseCRN = resultingInfo.getInt(5);
                
                
                //Finally, create a table to display the data.
            %>
            
          <tr>
          <td><%=catalogCourseName%></td>
          <td><%=catalogCourseNumber%></td>
          <td><%=catalogCourseInstructor%></td>
          <td><%=catalogCourseTime%></td>
          <td><%=catalogCourseRoom%></td>
          <td><%=catalogCourseCRN%></td>
          </tr>
          
            <%
           }
                %>
                </table>
    </body>
</html>