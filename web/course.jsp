<%-- 
    Document   : index
    Created on : Dec 19, 2016, 3:17:36 PM
    Author     : 7
--%>

<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dbconnectionutil.org.DbConnection"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <title>Courses </title>
         
    </head>
    <body>
                <%
            if ((session.getAttribute("uid") == null) || (session.getAttribute("uid") == "")) {
        %>

        <%  response.sendRedirect("login.jsp"); %>
        <%} else {
        %>
        <%
            Connection conn= null ;
            
            PreparedStatement ps = null;
            
            ResultSet rs = null ;
          
            
            String query = "SELECT 	* From course where user_id =  '" +   (Integer)session.getAttribute("uid") + "'   " ;
            try {
                conn  = DbConnection.getConnection();
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
            
            
        %>
        <style>body{background: #f5f5f5}span{display:inline-block;padding: 15px;font-size: 20px; font-weight: bold}</style>
        <div class="container bg-info" style="padding-top:20px;padding-bottom: 20px;padding-left: 50px">
           <center>   <span class="btn-info">Registeration System</span> </center> 
        </div>
        <div class="container bg-info" style="padding-top:20px;padding-bottom: 20px">
            <h1>My Courses </h1>
               <%
            out.println("Welcome , "+session.getAttribute("fname"));
            
            %>
             <a href="logout.jsp">Log out</a>
                <%
                            String msg = request.getParameter("message");
                            if (msg != null) {
                                out.println("<br/><br/>");
                                out.println(msg);
                            }

                        %>
            <hr>
            <div class="row">
                <div class="col-sm-4">
                    <form role="form" action="addcourse.jsp" method="post">
                        <div class="form-group">
                            <label>Course Name </label>
                            <input type="text" class="form-control" name="subject">
                        </div>
                        <div class="form-group">
                            <label>Teacher </label>
                            <input type="text" class="form-control" name="teacher">
                        </div>
                       

                        <button class="btn btn-success btn-block" type="submit">Add Course </button>
                    </form>
                </div>
                <div class="col-sm-8">
                    <table class="table table-hover ">
                        <thead >
                            <tr>
                                <th>Course Name </th>
                                <th>Teacher Name</th>
                               
                                <th> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            
                            <%
                int id;
                                while(rs.next()){
                                    
                                      id = rs.getInt("id");
                 
               session.setAttribute("id", id);
                                    
                                
                            %>
                            <tr>
                                <td><%=rs.getString("subject") %></td>
                                <td><%=rs.getString("teacher") %></td>
                               
                                <td>
                                   
                                    <a href="before_update_course.jsp?id=<%= rs.getInt("id") %>" class="btn btn-success" role="button">Update</a>
                                    <a href="before_delete_course.jsp?id=<%= rs.getInt("id") %>"class="btn btn-danger" role="button">Delete</a>   
                                </td>
                            </tr>
                            <%
                                }//end while
                                }catch(Exception ex ){
                                     ex.printStackTrace();
                                }
                                finally{
                                    ps.close();
                                    conn.close();
                                }}
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
