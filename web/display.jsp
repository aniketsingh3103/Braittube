<%-- 
    Document   : display
    Created on : Jul 23, 2016, 11:01:23 PM
    Author     : Gungun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@page session="true"%>
        <%@ page import="com.file"%>
        <%@page import="com.connect" %>
        <%@page import="java.util.ArrayList" %>
        <%@page import="com.user" %>
        <%@page import="java.sql.ResultSet"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
        <title>Member</title>
        <style type="text/css">
            .display{
                color: black;
                font-family: sans-serif;
                margin: auto;
                background: #7db6f2; 
                width: 960px;
                text-align: center;
            }
            </style>
    </head>
    <body>
        <div class="display">
        <h1>Details Display</h1>
        <form action="display.jsp" method="post">
        <button class="edit" name="click">show Details</button>
        </form>
        <table width="800px;">
            <th>NO</th><th style='text-align:left'>NAME<th>LIKES<th>ID</th><th>ADMIN OPERATION</th>
        <%
           String click=request.getParameter("click");
           connect f;
         if(click!=null){
f=new connect();
ResultSet rs=f.stm.executeQuery("select * from polytube");
 while(rs.next()){
     
    out.print("<tr><td>"+rs.getInt("no")+"</td><td style='text-align:left'>"+rs.getString("name")+"</td><td>"+rs.getInt("likes")+"</td>"
            + "<td>"+rs.getInt("id")+"</td>"
            + "<td><button class='edit' onclick='drop("+rs.getInt(1)+")'>Delete</button></td></tr>");
    
    if(rs.getInt("no")>9){
         out.print("<button class='edit'>next</button>");
         break;
     }
 }
            
 f.stm.close();
 f.con.close();
         }
   %>
        </table>
   </div>
        <input type="hidden" id="del_value" name="del_value" value="10"/>
        <script type="text/javascript">
            var drop=function(a){
             //var text=document.getElementById(a);
             var del=document.getElementById("del_value");
             del.value=a;
        } ;    
            
        </script>
        <% 
         String id=request.getParameter("del_value");
         
         if(id!=null){
                int t=Integer.parseInt(id);
                f=new connect();
                ResultSet query=f.stm.executeQuery("delete from polytube where no="+t);
                query.close();;
                f.stm.close();
                f.con.close();
         }
                %>
   
    </body>
</html>
