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
        <title>Update course </title>
        <style>body{background: #f5f5f5}</style>
    </head>
    <body>
        <%
            String uid = request.getParameter("user_id");
            String id = request.getParameter("id");
          
            Connection conn = null;
            PreparedStatement ps = null ;
            
            ResultSet rs = null;
            try {
                conn = DbConnection.getConnection();
                String query = "SELECT * From course WHERE id='"+ id+"'";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
            
        %>
        <div class="container bg-primary" style="padding-top:20px;padding-bottom: 20px">
            <h1 >Update The course</h1>
            <hr>
            <style>hr{height:2px;background:#f00;border: 0}</style>
            <form action="updatecourse.jsp" role="form" method="get">
                <%
                    while(rs.next()){
                %>
                <input type="hidden" name="id" value="<%=rs.getInt("id") %>">
                <div class="form-group">
                    <label>course  </label>
                    <input type="text" class="form-control" name="subject" value="<%=rs.getString("subject") %>">
                </div>
                <div class="form-group">
                    <label>Teacher name </label>
                    <input type="text" class="form-control" name="teacher" value="<%=rs.getString("teacher") %>" >
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
                <button class="btn btn-danger btn-block" type="submit">Update Course </button>
            </form>
        </div>
        
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
