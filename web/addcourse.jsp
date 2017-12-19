<%-- 
    Document   : addRecord
    Created on : Dec 19, 2016, 4:05:25 PM
    Author     : 7
--%>

<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course </title>
    </head>
    <body>
       <%
           String subject = request.getParameter("subject");
           String teacher = request.getParameter("teacher");
         
           
           Connection conn  = null ; 
           PreparedStatement ps = null ;
           if(!subject.equals("") && !teacher.equals("")){
           try{
               int row = 0 ; 
               conn = DbConnection.getConnection();
               String query = "INSERT INTO course(subject,teacher , user_id) VALUES(?,?,?)";
               ps = conn.prepareStatement(query);
               ps.setString(1, subject);
               ps.setString(2, teacher);
               ps.setInt(3, (Integer)session.getAttribute("uid"));
                
             
               
               row = ps.executeUpdate();
               
               if(row > 0 ){
                   response.sendRedirect("course.jsp");
               }else{
                   out.println("Error in Query");
               }
           }catch(Exception ex){
               out.println(ex.getMessage());
           }
           finally{
                ps.close();
                conn.close();
            }}
           else{
           response.sendRedirect("course.jsp?message= You Must Enter All The Data .");
           }
       %>
    </body>
</html>
