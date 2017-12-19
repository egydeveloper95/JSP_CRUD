<%-- 
    Document   : editform
    Created on : Dec 19, 2016, 4:44:06 PM
    Author     : 7
--%>

<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <title>JSP Page</title>
        <style>body{background: #f5f5f5}</style>
    </head>
    <body>
        <%
            String uid = request.getParameter("uid");
            int id = Integer.parseInt(uid);
            Connection conn = null;
            PreparedStatement ps = null ;
            
            ResultSet rs = null;
            try {
                conn = DbConnection.getConnection();
                String query = "SELECT * From user WHERE uid='"+id+"'";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
            
        %>
        <div class="container bg-primary" style="padding-top:20px;padding-bottom: 20px">
            <h1 >Update The Record</h1>
            <hr>
            <style>hr{height:2px;background:#f00;border: 0}</style>
            <form action="updated.jsp" role="form" method="get">
                <%
                    while(rs.next()){
                %>
                <input type="hidden" name="id" value="<%=rs.getInt("uid") %>">
                <div class="form-group">
                    <label>First Name</label>
                    <input type="text" class="form-control" name="fname" value="<%=rs.getString("fname") %>">
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <input type="text" class="form-control" name="lname" value="<%=rs.getString("lname") %>" >
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" value="<%=rs.getString("emailid") %>" >
                </div>
                
                 <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password" value="<%=rs.getString("password") %>" >
                </div>
                
                
                 <div class="form-group">
                    <label>address</label>
                    <input type="addresse" class="form-control" name="addresse" value="<%=rs.getString("addresse") %>" >
                </div>
                
                
                <div class="form-group">
                    <label>User Type</label>
                    <select name="user_type_id" >
                             
                                <option  value="1"> Admin </option>
                                <option  value="2">Student</option>
                               
                               
                            </select>
                </div>
                <%
                    }//end while
                    }catch(Exception ex){
                        ex.printStackTrace();
                    }
                    finally{
                        ps.close();
                        conn.close();
                    }
                %>
                <button class="btn btn-danger btn-block" type="submit">Update Record</button>
            </form>
        </div>
        
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
