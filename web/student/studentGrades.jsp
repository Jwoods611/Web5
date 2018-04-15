<%-- 
    Document   : studentGrades
    Created on : Apr 11, 2018, 10:08:24 AM
    Author     : Sean O'Neil
    Edited by  : James Woods

    Displays the user's grades for each course they're enrolled in
--%>
<%@page import = "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Grades</title>
    </head>
    <body>
         <h1>Here are the final grades of the semester</h1>

    <table class="w3-table w3-striped">
      <tr>
        <td>Course</td>
        <td>Grade</td>                
      </tr>
      
      <%
            Class.forName("com.mysql.jdbc.Driver");
            //Establish a connection to the database
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
            String gradeQuery = "select crn from courses_accounts where registerId = '" + session.getAttribute("id") + "' and redCard = 0 and semester = '" + session.getAttribute("theSemester") + "'";
            PreparedStatement gradeStmt = connection.prepareStatement(gradeQuery);
            ResultSet resultGrades = gradeStmt.executeQuery();
            
            /**
             * In order to display each enrolled course and the corresponding grades
             * on a separate table row, we want to concatenate all the CRNs returned from the
             * query and concatenate them into a string. Then, we want to split the string
             * at the delimiting character and display the corresponding courses and grades
             * for those courses.
             */
           String concatCrn = "";
           
           while(resultGrades.next())
           {   //Set the delimiter to a comma
               concatCrn += resultGrades.getString(1) + ",";
           }
           //Split each CRN at the comma and put them into an array
           String allCrn [] = concatCrn.split(",");
           
           /*
            *Now, in order to display the grades in a dynamic fashion, we
            *we want to loop through the array and create a table row for each
            *course and its corresponding grade.
            */
            
            String courseName = "";
            String courseGrade = "";
            for (int j = 0; j < allCrn.length; j++)
            {
              %>
              <tr>
                  <th>
                      
                      <%
                          String nameQuery = "select name from courses where crn = '" + allCrn[j] + "'";
                          
                          Statement nameStmt = connection.createStatement();
                          ResultSet resultNames = nameStmt.executeQuery(nameQuery);
                          if(resultNames.next())
                          courseName = resultNames.getString(1);
                          %>
                          <%=courseName%>
                  </th>
                  <th>
                      <%
                         String queryGrades = "select grade from courses_accounts where crn = '" + allCrn[j] + "'";
                         Statement gradesStmt = connection.createStatement();
                         ResultSet resultingGrades = gradesStmt.executeQuery(queryGrades);
                         if(resultingGrades.next())
                             if(courseName != "")
                                courseGrade = resultingGrades.getString(1);
                         

                          %>
                          <%=courseGrade%>
                  </th>
              <%
            }

      %>
            </tr>
    </table>
    </body>
</html>
