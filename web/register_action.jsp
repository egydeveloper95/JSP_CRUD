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
                    <%
                        String firstname = request.getParameter("firstname");
                        String lastname = request.getParameter("lastname");
                        String email = request.getParameter("email");
                        String address = request.getParameter("address");
                        String password = request.getParameter("password");
                        String Usertype_id = "2";
                        if (!firstname.equals("") && !lastname.equals("") && !email.equals("") && !address.equals("") && !password.equals("")) {
                            Connection conn = null;
                            PreparedStatement ps = null;
                            int result = 0;
                            int count = 0;
                            ResultSet rs = null;
                            conn = DbConnection.getConnection();
                            String query2 = "Select Count(1) from user where emailid='" + email + "'";
                            ps = conn.prepareStatement(query2);
                            rs = ps.executeQuery();
                            while (rs.next()) {
                                count = rs.getInt("Count(1)");
                                
                            }
                            if(count==1){
                            response.sendRedirect("register.jsp?message=Email Already Exists .");
                            }
                            else {
                            String query = "INSERT INTO user(fname,lname,emailid , addresse , password , user_type_id) VALUES(?,?,? ,? ,? , ?)";
                            ps = conn.prepareStatement(query);
                            ps.setString(1, firstname);
                            ps.setString(2, lastname);
                            ps.setString(3, email);
                            ps.setString(4, address);
                            ps.setString(5, password);
                            ps.setString(6, Usertype_id);
                            
                            result = ps.executeUpdate();
                            
                            if (result > 0) {
                                response.sendRedirect("login.jsp");
                            } else {
                                out.println("Error in Query");
                            }
                            }
                        } else {
                            response.sendRedirect("register.jsp?message= Please Enter All The Data . ");
                        }
                        

                    %>

                </div>

            </div>
        </div>
        <div>

        </div>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
