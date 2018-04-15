<%-- 
    Document   : submitRedCard
    Created on : Apr 12, 2018, 6:38:38 PM
    Author     : Sean O'Neil
    Edited by  : James Woods

    Takes the CRN submitted by the student user on the redCard.jsp page
    and updates the database accordingly to show the corresponding faculty member
    that they have a red card request.
--%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Red card request submitted!</title>
        
        <%
            /*
             *First, we need to retrieve the CRN the student user entered on
             *redCard.jsp. Then, we use that CRN to query the database for the corresponding
             *course, and set the redCard column to 1, indicating there's a request
             *waiting to process.
             */
            
             String courseCRN = request.getParameter("redCardCRN");
             
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/web5", "root", "");
             Statement st = conn.createStatement();
             String sem = "";
             String termQuery = "select term from courses where crn = '" + courseCRN + "'";
             ResultSet termResults = st.executeQuery(termQuery);
             if(termResults.next())
                sem = termResults.getString(1);
             
             /*
              *Next, we want to update the database so the corresponding course has a 
              * '1' under the redCard column in the courses_accounts table,
              *  making sure it has the semester we queried for above. 
              */
             
              Statement updateSt = conn.createStatement();
              String updateString = "insert into courses_accounts values('"+session.getAttribute("id")+"','" +courseCRN + "','" + 0.0 + "','" + 1 +"','"+sem+"')";
              
              updateSt.executeUpdate(updateString);
              
             
             //Finally, redirect the student user to the student home page.
             response.sendRedirect("studentHome.jsp");
            %>
    </head>
    <body>
    </body>
</html>
