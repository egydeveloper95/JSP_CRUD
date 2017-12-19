<%-- 
    Document   : updated
    Created on : Dec 19, 2016, 6:20:37 PM
    Author     : 7
--%>

<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Course </title>
        <style>body{background: #f5f5f5}</style>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            int uid = Integer.parseInt(id);
            String subject = request.getParameter("subject");
            String teacher = request.getParameter("teacher");
           
            

            Connection conn = null ;
            PreparedStatement ps = null;
            if(!subject.equals("") && !teacher.equals("")){
            try{
                int row = 0 ;
                conn = DbConnection.getConnection();
                String query = "Update course SET subject=? , teacher=?   WHERE id=? ";
                ps= conn.prepareStatement(query);
                
                ps.setString(1, subject);
                ps.setString(2, teacher);
            
                ps.setString(3, id);
                
                row = ps.executeUpdate();
                
                if(row>0){
                    response.sendRedirect("course.jsp");
                }else{
                    out.println("Error Update ");
                }
                
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
            finally{
                ps.close();
                conn.close();
            }}
            else{
            response.sendRedirect("course.jsp?message=You Must Enter All The Data .");
            }
        %>
    </body>
</html>
