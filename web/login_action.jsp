<%-- 
    Document   : addRecord
    Created on : Dec 19, 2016, 4:05:25 PM
    Author     : 7
--%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");

            String password = request.getParameter("password");

            Connection conn = null;
            PreparedStatement ps = null;

            try {

                int count = 0;
                ResultSet rs = null;
                conn = DbConnection.getConnection();
                int u_t_i = 0;
                String firstname;
                String lastname;
                String query = "SELECT *,count(1) from user where emailid='" + email + "' and password='" + password + "'";
                ps = conn.prepareStatement(query);

                int uid;
                rs = ps.executeQuery();

                while (rs.next()) {

                    u_t_i = rs.getInt("user_type_id");

                    count = rs.getInt("Count(1)");

                    uid = rs.getInt("uid");

                    
                    firstname = rs.getString("fname");
                    lastname=rs.getString("lname");
                    session.setAttribute("uid", uid);
                    session.setAttribute("fname",firstname);
                    session.setAttribute("lname",lastname);

                }
                if (count != 0) {

                    if (u_t_i == 1 || u_t_i == 2) {

                        response.sendRedirect("success.jsp");
                    }
                } else if (count == 0) {
                    response.sendRedirect("login.jsp?message=Invalid Email / Password .");
                } else {
                    out.println("Error in Query");
                }
            } catch (Exception ex) {
                out.println(ex.getMessage());
            } finally {
                ps.close();
                conn.close();
            }
        %>
    </body>
</html>
