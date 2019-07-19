<%-- 
    Document   : logout
    Created on : Jul 2, 2016, 11:13:59 PM
    Author     : Gungun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%session.removeAttribute("u_name");
        session.removeAttribute("id");
        %>
        
        <jsp:forward page="index.jsp"/>
 
    </body>
</html>
