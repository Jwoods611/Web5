<%-- 
    Document   : loginPage
    Created on : Feb 5, 2017, 1:02:19 PM
    Author     : Sean O'Neil
    Edited by  : James Woods

    The page displayed when a user clicks "login". Takes input fields of
    username and password, and sends the parameters through to loginAction.jsp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel ="stylesheet" href ="styleSheets\login.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body style=";background-repeat:no-repeat;background-size:cover;">
        <%@include file = "header.jsp"%>
        <div class="container">
            <div style="position:relative;left:80px;top:200px;">
            <div class="row">
                <div class="Absolute-Center is-Responsive">
                    <div id="logo-container"></div>
                    
                    <div class="col-sm-20 col-md-10 col-md-offset-1">
                        
                        <form action="loginAction.jsp" id="loginForm">
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input class="form-control" type="text" name='username' placeholder="Username"/>          
                            </div>
                            
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input class="form-control" type="password" name='password' placeholder="Password"/>     
                            </div>

                            <div class="form-group">
                                <input type="submit" class="btn btn-info" value="Login">
                            </div>
                    </div>
                        </form>        
                    </div>  
                </div>    
            </div>
        </div>

    </body>
</html>