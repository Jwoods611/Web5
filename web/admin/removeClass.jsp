<%-- 
    Document   : removeClass
    Created on : Feb 6, 2017, 11:44:10 PM
    Author     : James Woods
 
    Allows an admin user to remove a class from the database. 
    Database query is driven by the CRN--course registration number--field,
    and deletes all courses with the CRN entered.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Class</title>
    </head>
    <body>
        <center>
        <table border="1" cellpadding="30">
            <form name="getForm" action="updateRemoveClass.jsp" method="get">
                <tr>
                    <td>CRN</td>
                    <td><input type="text" name="inputCRN"></td>
                </tr>
                    <td colspan="2">
                        <input type="submit" value="Remove Course">
                    </td>
                </tr>
            </form>
        </table>
    </center>
    </body>
</html>