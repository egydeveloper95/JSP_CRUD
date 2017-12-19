<%-- 
    Document   : login
    Created on : Dec 19, 2016, 3:17:36 PM
    Author     : 7
--%>

<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <title>Registeration Page</title>
    </head>
    <body>

        <style>body{background: #f5f5f5}span{display:inline-block;padding: 15px;font-size: 20px; font-weight: bold}</style>
      
        <div class="container bg-info" style="padding-top:20px;padding-bottom: 20px">
            <h1>Register</h1>
            <hr>
            <div class="row">
                <div class="col-sm-4">
                    <form role="form" action="register_action.jsp" method="post">
                         <div class="form-group">
                            <label>First Name :</label>
                            <input type="text" class="form-control" name="firstname">
                        </div>
                         <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" class="form-control" name="lastname">
                        </div>
                         <div class="form-group">
                            <label>Address</label>
                            <input type="text" class="form-control" name="address">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email">
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password">
                        </div>

                        <button class="btn btn-success btn-block" type="submit"> Register</button>
                       
                       <%
                            String msg = request.getParameter("message");
                            if (msg != null) {
                                out.println("<br/><br/>");
                                out.println(msg);
                            }

                        %>
                    </form>

                </div>

            </div>
        </div>
        <div>

        </div>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>

