<%-- 
    Document   : delete
    Created on : Dec 19, 2016, 5:42:40 PM
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
        <title>JSP Page</title>
        <style>body{background: #f5f5f5}</style>
    </head>
    <body>
        <%
            String id = request.getParameter("uid");
            int uid = Integer.parseInt(id);
            
            Connection conn = null;
            PreparedStatement ps = null ;
            
            try {
                int row = 0 ;
                conn = DbConnection.getConnection();
                String query = "delete from user where uid=?";
                ps = conn.prepareStatement(query);
                ps.setInt(1, uid);
                row = ps.executeUpdate();
                if(row>0){
                    response.sendRedirect("index.jsp");
                }else{
                    out.println("Error ");
                }
                
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
            
            finally{
                ps.close();
                conn.close();
            }
        %>
    </body>
</html>
