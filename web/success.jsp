<%-- 
    Document   : success
    Created on : Dec 19, 2016, 3:19:59 PM
    Author     : Funky
--%>

<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if ((session.getAttribute("uid") == null) || (session.getAttribute("uid") == "")) {
        %>

        <a href="login.jsp"></a>
        <%} else {
        %>

        <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                conn = DbConnection.getConnection();
                int u_t_i = 0;

                String query = "SELECT  user_type_id from user where uid='" + session.getAttribute("uid") + "'";
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                    //     out.println("tefa");
                    u_t_i = rs.getInt("user_type_id");
                }

                if (u_t_i == 1) {
                    response.sendRedirect("index.jsp");
                } else if (u_t_i == 2) {
                    response.sendRedirect("course.jsp");
                }
            }
        %>

      
    </body>
</html>
