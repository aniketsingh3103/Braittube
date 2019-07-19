


<!DOCTYPE html>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <%@page import="com.connect" %>
        <%@page import="java.util.ArrayList" %>
        <%@page import="java.sql.ResultSet" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
         
        <style type="text/css">

    .playlist{
      margin-left: 40px;
      margin-right: 30px;
      padding: 20px;
      margin-top: 10px;
      margin-bottom: 10px;
      box-shadow: 5px 5px 3px rgba(0, 0, 0,0.3);
       }
    
    .keep{
        width: 650px;
        display: table-cell;
    }
    .keep img{
        width:250px;
        height:120px;
    }
    
.div2{
        background-color: #42A5F5;
        //opacity: 0.6;
        width: 250px;
        height: 70px;
        padding: 10px;
}
.div2 a{
    text-decoration: none;
    color: #000;
    text-transform: capitalize;
    font-size: 15px;
    font-family: sans-serif;
}
.message{
        color: white;
        text-align: center;
        position: absolute;
        top: 50%;
        left: 42%;
        width: 250px;
        height: 70px;
        background-color:#555;
        font-family: sans-serif;
        font-size: 20px;
        z-index: 30;
        border-radius: 10px;
        opacity: 0.6;
        box-shadow: 5px 5px 3px rgba(0, 0, 0,0.3);
    }
    .mess{
       visibility: hidden;
    }

</style>
    </head>
    <body>
        
         <jsp:include page="headder.html" flush="true"/>
       
       <%
           String sear=request.getParameter("sea");
           String search_name=sear.toLowerCase();
       
       try{
       connect f=new connect();
ArrayList<String> f1=new ArrayList<String>();
ArrayList<Integer> id=new ArrayList<Integer>();
int s=0;
ResultSet rs;
rs=f.stm.executeQuery("SELECT id,name FROM cse WHERE name LIKE'%"+search_name+"%'");
 while(rs.next()){
   f1.add(rs.getString("name"));
   id.add(rs.getInt("id"));
 }
 //rs.close();
rs=f.stm.executeQuery("SELECT id,name FROM civil WHERE name LIKE'%"+search_name+"%'");
 while(rs.next()){
   f1.add(rs.getString("name"));
   id.add(rs.getInt("id"));
 }
 //rs1.close();
  rs=f.stm.executeQuery("SELECT id,name FROM ece WHERE name LIKE'%"+search_name+"%'");
 while(rs.next()){
   f1.add(rs.getString("name"));
   id.add(rs.getInt("id"));
 }
 
 rs.close();
 f.stm.close();
 f.con.close();
  
  %>
   <div class="playlist" id="box">
   <%
String r=".mp4";
String put=null;
for(int i=0;i<f1.size();i++){
    if(i%4==0){
        out.print("<br>");
    }
    put=f1.get(i);
    put=put.replace(".mp4","");
 out.print("<div class='keep'><img src=\"thumbnail/"+id.get(i)+".png\"/><div class='div2'><a href='#' id='"+(id.get(i)+5)+"' onclick='send("+(id.get(i)+5)+")'>"+put+"</a></div></div>");%>
        <%
}

}catch(SQLException e){
    e.getMessage();
}
%>
<div id="message" class="mess">YOU MUST LOGIN TO WATCH.LOGIN FIRST</div>
<input type="hidden" value="<%=(String)session.getAttribute("u_name")%>" id="nam"/>
   </div>
   <script type="text/javascript">
        var disp=document.getElementById("box");
        var cli=document.getElementById("nam").value;
       var send=function(a){
           
             var text=document.getElementById(a);
             var tex_id=text.id-5;
           text.href="vedios.jsp?ved="+tex_id;
           
           
          };
          var dislay=function(){
                document.getElementById("message").className="message";
                };
   </script>
   </body>
</html>
