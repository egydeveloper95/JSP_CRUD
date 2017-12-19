<%-- 
    Document   : addRecord
    Created on : Dec 19, 2016, 4:05:25 PM
    Author     : 7
--%>

<%@page import="java.sql.ResultSet"%>
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
    </head>
    <body>
        <%
            String firstname = request.getParameter("fname");
            String lastname = request.getParameter("lname");
            String emailaddress = request.getParameter("email");
            String addresse = request.getParameter("addresse");
            String password = request.getParameter("password");
            String user_type_id = request.getParameter("user_type_id");

            Connection conn = null;
            PreparedStatement ps = null;
            if (!firstname.equals("") && !lastname.equals("") && !emailaddress.equals("") && !addresse.equals("") && !password.equals("") && !user_type_id.equals("")) {
                try {
                    int count = 0;
                    ResultSet rs = null;
                    conn = DbConnection.getConnection();
                    String query2 = "Select Count(1) from user where emailid='" + emailaddress + "'";
                    ps = conn.prepareStatement(query2);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        count = rs.getInt("Count(1)");

                    }
                    if (count == 1) {
                        response.sendRedirect("index.jsp?message=Email Already Exists .");
                    } else {
                        int row = 0;
                        conn = DbConnection.getConnection();
                        String query = "INSERT INTO user(fname,lname,emailid , addresse , password , user_type_id) VALUES(?,?,? ,? ,? , ?)";
                        ps = conn.prepareStatement(query);
                        ps.setString(1, firstname);
                        ps.setString(2, lastname);
                        ps.setString(3, emailaddress);
                        ps.setString(4, addresse);
                        ps.setString(5, password);
                        ps.setString(6, user_type_id);

                        row = ps.executeUpdate();

                        if (row > 0) {
                            response.sendRedirect("index.jsp");
                        } else {
                            out.println("Error in Query");
                        }
                    }
                } catch (Exception ex) {
                    out.println(ex.getMessage());
                } finally {
                    ps.close();
                    conn.close();
                }
            } else {
                response.sendRedirect("index.jsp?message= Please Enter All The Data .");

            }
        %>
    </body>
</html>
