<%-- 
    Document   : redCard
    Created on : Apr 11, 2018, 10:08:47 AM
    Author     : James Woods
--%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Red card</title>
    </head>
    <body>
        <h3>To red card into a course, first submit a request by entering the CRN. The teacher will
        either approve or deny the red card.</h3>
        <br>
       <form action = "submitRedCard.jsp">
            <input type="text" name="redCardCRN" ><br>
            <form>
                <button name ="AddClass" type ="submit">Submit Request</button>
            </form>
            <br><br>
            <h1>Pending Red Card Requests:</h1>
            <table class="w3-table w3-striped">
            <tr>
                <td>Course</td>
                <td>Instructor</td>
                <td>CRN</td>
            </tr>
                <%
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Web5", "root", "");
                Statement redCardStatement = con.createStatement();
                String getRedCards = "select crn from courses_accounts where registerId = '" + session.getAttribute("id") + "' and semester = '" + session.getAttribute("theSemester") + "' and redCard = 1";
                ResultSet redCardsResult =  redCardStatement.executeQuery(getRedCards);
                /**
                 * Now that we have the CRNs for the student's red cards, we need to
                 * concatenate them into a single String so they can be split into
                 * an array. The delimiting character for doing so will be a comma
                 */
                
                String concatCards = "";
                //Loop through the result set, concatenating the String with CRNs.
                while(redCardsResult.next())
                {
                    concatCards += redCardsResult.getString(1) + ",";
                }
                
                String [] crnArray = concatCards.split(",");
                Statement redCardname = con.createStatement();
                String redCardCourseName = "";
                String redCardCrn = "";
                String redCardInstructor = "";
                
                for (int k = 0; k < crnArray.length; k++)
                {
                String redCardNames = "select name, crn, instructor from courses where crn = '" + crnArray[k] + "'";
                ResultSet nameResults = redCardStatement.executeQuery(redCardNames);
                if(nameResults.next())
                {
                redCardCourseName = nameResults.getString(1);
                redCardCrn = nameResults.getString(2);
                redCardInstructor = nameResults.getString(3);
                }
                
                
                
                %>
                 <tr>
                 <td><%=redCardCourseName%></td>
                 <td><%=redCardInstructor%></td>
                 <td><%=redCardCrn%></td>
                 </tr>
                 
                <%
                
                }
                    
                    %>
            </table>
       </html>
