<%-- 
    Document   : registerPage
    Created on : Apr 9, 2018, 7:43:27 PM
    Author     : James Woods
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
        
    </head>
    <body style=";background-repeat:no-repeat;background-size:cover;">
     <%@include file = "header.jsp"%>
        <div class="container">
            <div style="position:relative;left:50px;top:200px;">
            <div class="row">
                <div class="Absolute-Center is-Responsive">
                    <div id="logo-container"></div>
                    
                    
                    <div class="col-sm-12 col-md-10 col-md-offset-1">
                        
                        <form action="loginAction.jsp" id="loginForm">
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input class="form-control" type="text" name='username' placeholder="Student ID"/>          
                            </div>
                            
                            <div class="form-group input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input class="form-control" type="password" name='password' placeholder="password"/>     
                            </div>
<!--                            <div class ="dropdown">
                            <button type="button" class ="btn btn-default" class="dropdown-toggle" data-toggle="dropdown">
                                Meats <div class="caret"></div>
                            </button>
                            
                            <ul class ="dropdown-menu" name = "usrType">
                                <li><a href="#">Ham</a></li>
                                <li><a href="#">Sausage</a></li>
                                <li><a href="#">Spicy Chicken</a></li>
                                <li><a href="#">Salami</a></li>
                                <li><a href="#">Quorn</a></li>
                            </ul>
                        </div>-->
                            
                            </div>
                    
                            <div class="form-group">
                                <input type="submit" class="btn btn-info" value="Register">
                            </div>
                            
                        </form> 
                        
                    </div>  
                </div> 
            </div>
            </div>

    </body>
</html>