<%-- 
    Document   : surb
    Created on : Feb 25, 2017, 1:53:53 PM
    Author     : aniket
--%>

<%@page import="com.SurbData"%>
<%@page import="com.DataRetrival"%>
<%@page import="com.Videos"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.connect"%>
<%@page import="com.file"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suscribe</title>
        <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
         <style type="text/css">
             h3{
                 color: #e63e0d;
                 text-align: center;
             }
             
             .headder_ved{
                 width: 100%;
                 height: 50px;
                 position: relative;
                 background-color: #D81B60;
             }
             
             .form_button{
                 width: 150px;
                 height: 30px;
                 border-radius: 4px;
                 float: right;
                 background-color: #7B1FA2;
             }    
             
             .report_table{
    width: 900px;
    height: auto;
    margin: auto;
    margin-top: 30px;
    margin-bottom: 30px;
    box-shadow: 2px 2px 2px #ccc;
    border: 1px solid #eee;
    border-collapse: collapse;
  
    

  }

  
  .th{
    padding-left:20px;
    padding-right:20px;
    text-align: center;
    border-bottom: 2px solid #e63e0d;

  }
  td{
  	border: none;
        border-bottom: 1px solid #eee;
        padding: 10px;
        padding-left: 30px;
        padding-right: 30px;

  }
        
  tr{
  	font-size: 16px;
    text-transform: capitalize;
    border: 1px solid #ccc;
  }
        
         .alm{
                 position: absolute;
                 left: 40%;
                 top: 45%;
                 width: 300px;
                 height: 70px;
                 box-shadow: 1px 4px 5px #ccc;
                 background-color: #D81B60;
                color: #fff;
                margin: auto;
                padding: 10px;
                font-size: 16px;
                text-align: center;
                border-radius: 4px;
               // visibility: hidden;
           
         }  .but{
             border-radius: 4px;
             height: 20px;
             font-size: 12px;
         }
   
                            
             
         </style>
         
            
           
    </head>
        
    <body style="color: #000;font-family: sans-serif">
        
        <jsp:include page="headder.html" flush="true"/>
        <div class="headder_ved">
          
      </div>
         <%

      List<Videos> list=SurbData.getRecords();
      
      %>
            
          
      
        
        
  
     <table class="report_table">   
         <tr class="th"><td>NAME</td><td>DEPARTMENT</td><td>LIKES</td><td>VIEWS</td><td>OPTION</td></tr>
        <%
      String put=null;
        for(Videos v:list){
   
    put=v.getName();
    put=put.replace(".mp4","");
    
%>    
    <tr>
        <td><%=put%></td>
        <td><%=v.getDept()%></td>
        <td><%=v.getL()%></td>
        <td><%=v.getV()%></td>
        <td> <a id="<%=v.getId()+5%>" href='#'><button onclick="send(<%=v.getId()+5%>,'<%=v.getDept()%>')">Delete</button>
            </a></td></tr>
                  
                 
                  <%  } //end of for loop      %>
      
     </table>

        
        
       <%
           
           String message=(String)request.getAttribute("message");
           if(message!=null){
           out.print("<div class='alm'>"+message+"</div>");
           }
           %>  
        
        
        <script type="text/javascript">
            
            var send=function(a,dept){
             var id=document.getElementById(a);
          alert(dept);
            var del_id=a-5;
                id.href="Delete_data?del="+del_id+"&dept="+dept;
         } ;    
            
            
        </script>
    </body>
</html>
