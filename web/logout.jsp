<%-- 
    Document   : logout
    Created on : Dec 21, 2016, 9:40:08 AM
    Author     : Funky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
             <%
session.setAttribute("uid", null);
session.invalidate();
response.sendRedirect("login.jsp");
%>
    </body>
</html>
