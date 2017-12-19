<%-- 
    Document   : updated
    Created on : Dec 19, 2016, 6:20:37 PM
    Author     : 7
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
            String id = request.getParameter("id");
            int uid = Integer.parseInt(id);
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String addresse = request.getParameter("addresse");
            String user_type_id = request.getParameter("user_type_id");
            if (!fname.equals("") && !lname.equals("") && !email.equals("") && !addresse.equals("") && !password.equals("") && !user_type_id.equals("")) {
                Connection conn = null;
                PreparedStatement ps = null;

                try {
                    int count = 0;
                    ResultSet rs = null;
                    conn = DbConnection.getConnection();
                    String query2 = "Select Count(1) from user where emailid='" + email + "' and uid!='" + uid + "'";
                    ps = conn.prepareStatement(query2);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        count = rs.getInt("Count(1)");

                    }
                    if (count == 1) {
                        response.sendRedirect("index.jsp?message=Email Already Exists .");
                    } else {
                        int row = 0;

                        String query = "Update user SET fname=? , lname=? , emailid=?  , password=? , addresse=? , user_type_id=? WHERE uid=? ";
                        ps = conn.prepareStatement(query);

                        ps.setString(1, fname);
                        ps.setString(2, lname);
                        ps.setString(3, email);
                        ps.setString(4, password);
                        ps.setString(5, addresse);
                        ps.setString(6, user_type_id);
                        ps.setInt(7, uid);

                        row = ps.executeUpdate();

                        if (row > 0) {
                            response.sendRedirect("index.jsp");
                        } else {
                            out.println("Error Update ");
                        }

                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                } finally {
                    ps.close();
                    conn.close();
                }
            } else {
                response.sendRedirect("index.jsp?message=You Must Enter All The Data To Update .");
            }
        %>
    </body>
</html>
