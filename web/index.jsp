<%-- 
    Document   : index
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if ((session.getAttribute("uid") == null) || (session.getAttribute("uid") == "")) {
        %>

        <%  response.sendRedirect("login.jsp"); %>
        <%} else {
        %>
        <%
            Connection conn = null;

            PreparedStatement ps = null;

            ResultSet rs = null;

            String query = "SELECT * From user";
            try {
                conn = DbConnection.getConnection();
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();


        %>
        <style>body{background: #f5f5f5}span{display:inline-block;padding: 15px;font-size: 20px; font-weight: bold}</style>
        <div class="container bg-info" style="padding-top:20px;padding-bottom: 20px;padding-left: 50px">

          <center>   <span class="btn-info">Registeration System</span> </center> 
         
        </div>
        <div class="container bg-info" style="padding-top:20px;padding-bottom: 20px">
            <%                out.println("Welcome , " + session.getAttribute("fname"));

            %>
            <a href="logout.jsp">Log out</a>
            <h1>Admins Page</h1>
       <%                  String msg = request.getParameter("message");
                if (msg != null) {
                    out.println("<br/><br/>");
                    out.println(msg);
                }

            %>
            <hr>
            <div class="row">
                <div class="col-sm-4">
                    <form role="form" action="addRecord.jsp" method="post">
                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" class="form-control" name="fname">
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" class="form-control" name="lname">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email">
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password">
                        </div>


                        <div class="form-group">
                            <label>Address</label>
                            <input type="addresse" class="form-control" name="addresse">
                        </div>


                        <div class="form-group">
                            <label>User type </label>
                            <select name="user_type_id">
                                <option  value="1">Admin</option>
                                <option value="2">Student</option>
                               
                            </select>
                        </div>


                        <button class="btn btn-success btn-block" type="submit">Add Record</button>
     
                    </form>
                </div>
                <div class="col-sm-8">
                    <table class="table table-hover ">
                        <thead >
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Password</th>
                                <th> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                while (rs.next()) {


                            %>
                            <tr>
                                <td><%=rs.getString("fname")%></td>
                                <td><%=rs.getString("lname")%></td>
                                <td><%=rs.getString("emailid")%></td>
                                <td><%=rs.getString("addresse")%></td>
                                <td><%=rs.getString("password")%></td>
                                <td>
                                    <a href="editform.jsp?uid=<%= rs.getInt("uid")%>" class="btn btn-success" role="button">Update</a>
                                    <a href="delete.jsp?uid=<%= rs.getInt("uid")%>"class="btn btn-danger" role="button">Delete</a>   
                                </td>
                            </tr>
                            <%
                                        }//end while
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    } finally {
                                        ps.close();
                                        conn.close();
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
