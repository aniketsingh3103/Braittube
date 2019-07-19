<%-- 
    Document   : dept_videos
    Created on : Feb 16, 2017, 12:02:50 AM
    Author     : aniket
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="style/main.css" rel="stylesheet" type="text/css" media="all">
            <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
            
            <style type="text/css">
                
                
                
            
            .text{
                color: #fff;
                font-family: sans-serif;
                font-size: 20px;
                text-align: center;
                padding: 10px;
               
            }
    
.navigation {
padding: 2px;
top: 20px;
width: 100%;
padding: 2px;
border-top: 10px solid #D81B60;
}
       
           
        
            
        .navigation a{
         text-decoration: none;
          color: #fff;
        }
        
        .navigation ul{
            text-align: center;
        }
.navigation ul li {
display: inline-table;
padding-right: 10px;
text-align: center;
}
    .navigation ul li img{
            width: 170px;
            height: 150px;
        }


        .navigation ul li p{
            width: 160px;
            height: 45px;
            margin: auto;
            margin-top: -50px;
            font-size: 80%;
            font-family: sans-serif;
            margin-bottom: 5px;
            word-spacing: 1px;
            padding: 3px;
            text-transform: capitalize;
            overflow: hidden;
            text-align: center;
            background-color: #1E88E5;
            opacity: 0.9;
           
            }
            
             .cont_div{
                 position: relative;
                 top: 30px;
                width:  950px;
                height: auto;
                margin: auto;
                box-shadow: 2px 4px 3px #ccc;
                border: 1px solid #ccc;
                margin-bottom: 20px;
            
            
        }
       .div_cont1{
        width: 900px;
        height: 170px;
        //border: 1px solid #eee;
           margin: auto;
   // box-shadow: 2px 4px 3px #ccc;
        padding: 6px;
       }
       .div_cont2{
        width: 320px;
        height: 150px;
        float: left;
        //background-color: #ccc;
       }
       .div_cont2 img{
        width: 300px;
        height: 150px;
       }
       
       .div_cont3{
        width: 550px;
        height: 150px;
        float: left;
       // background-color: #eee;
        padding: 10px;
     
         }
         .name{
            width: 100%;
            height: 90px;
            font-family: sans-serif;
            font-size: 120%;
            margin-bottom: 5px;
            text-align: justify;
             padding: 5px;
            }
        .name a{
            text-decoration: none;
            color: #1E88E5;
            font-size: 16px;
            font-weight: 50;
            width: 100%;
            height: auto;
            text-transform: capitalize;
        }
        .name span{
            color: #ccc;  
            width: 100%;
            height: 40px;
            font-size: 12px;
        }
            
            
            .name_extra{
                width: 100%;
                height: 50px;
               // background-color: #123456;
            }
            
            .box{
                color: #757575;
                width: 100px;
                height: 20px;
                //background-color: #0D47A1;
                border: 1px solid #eee;
                float: left;
                left: 20px;
                margin: 10px;
                font-family: sans-serif;
                border-radius: 3px;
                padding-left: 5px;
                font-size: 12px;
            }
        .box img{
         width: 20px;
        height: 17px;
        vertical-align: middle;
            margin-right: 10px;
        }
        .page{
            width: 200px;
            height: 40px;
            position: relative;
            top: 30px;
            text-align: center;
            margin: auto;
            background-color: #1E88E5;
            padding: 5px;
            margin-bottom: 10px;
            border-radius: 4px;
        }
        
        .page a{
            text-decoration: none;
            color: #fff;
            font-size: 18px;
            font-family: sans-serif;
            }

    </style>
            
            
            
        <title>Department</title>
    </head>
    <body>
        <%@page session="true"%>
        <%@ page import="com.file"%>
        <%@page import="com.connect" %>
        <%@page import="java.util.ArrayList" %>
        <%@page import="com.user" %>
        <%@page import="java.sql.ResultSet"%>
         <%@page import="com.DataAdapter"%>
         <%@page import="com.Videos"%>
            <%@page import="java.util.List"%>
        
        <%
            
              
        String spageid=request.getParameter("p");
        String table_dept=null;
        String no=request.getParameter("no");
        int max_id;
               
      if(no.equals("2")){
          table_dept="cse";
      }
      if(no.equals("1")){
          table_dept="civil";
      }
      if(no.equals("3")){
          table_dept="ece";
      }
      if(no.equals("4")){
          table_dept="ece";
      }
      if(no.equals("6")){
          table_dept="hotel";
      }
      if(no.equals("5")){
          table_dept="civil";
      }
      
      int pageid=Integer.parseInt(spageid);
      //int total=10;
        max_id=pageid;
      
      List<Videos> list=DataAdapter.getRecords(table_dept,max_id);
      
   
      
      int itag=Integer.parseInt(no);
      
 String[] tags={"Civil","Computer Science","Electronic and Communication","Diploma in Elelctrical","Diploma in Mechanical","Hotel Management"};

   %>
        <jsp:include page="headder.html" flush="true"/>
        
         <div class="headder_ved">
             <div class="text">Welcome to The Department of <%out.print(tags[itag-1]);%></div>
      </div>
        
        
        
      
        
      <div class="cont_div">
                
<%
 
String r=".mp4";
String put=null;


for(Videos v:list){
   
     out.println(v.getName());
    put=v.getName();
    put=put.replace(".mp4","");
    
    if(v.getId()>max_id){
        max_id=v.getId();
    }
               %>



<div class="div_cont1">
    <div class="div_cont2"><img src="thumbnail/<%=v.getId()%>.png" /></div>
 
    <div class="div_cont3">
        <div class="name" onclick="send(<%=(v.getId()+5)%>)"><a id="<%=(v.getId()+5)%>"  href='#'><%=put%></a><br><br><span>Drescription</span></div>
        <div class="name_extra">
                <div class="upload box" style="width:200px">Three Month Ago</div>
                <div class="likes box"><img src="images/like.png"/>10</div>
                <div class="view box"><img src="images/view.png"/>200</div>
        </div>
    </div>
</div>    

                        
<%  } //end of for loop      %>

      </div>

<div class="page"><a href="dept_videos.jsp?no=<%=no%>&p=<%=max_id+1%>">Next</a></div>
        
<script type="text/javascript">
    
    
    
    
    
    var send=function(a){
             var text=document.getElementById(a);
          
              var tex_id=text.id-5;
           text.href="vedios.jsp?ved="+tex_id;
          
                       
                           } ;    
                           
</script>
    </body>
</html>