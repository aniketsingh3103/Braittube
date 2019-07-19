<%-- 
    Document   : department
    Created on : Feb 15, 2017, 11:58:33 AM
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
                
                
                 #list {
position: relative;
top: 20px;
width: 100%;
height: 100px;
padding: 2px;
            }
    
.navigation {
margin: auto;
padding: 2px;

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
            width: 240px;
            height: 70px;
            font-size: 100%;
            font-family: sans-serif;
            word-spacing: 1px;
            padding: 3px;
            text-transform: capitalize;
            overflow: hidden;
            text-align: center;
            background-color: #7B1FA2;
            cursor: pointer;
            }
     

    </style>
            
            
            
        <title>Department</title>
    </head>
    <body>
        <jsp:include page="headder.html" flush="true"/>
        
         <div class="headder_ved">
          
      </div>
        
        <div id="list">
                <div class="navigation"  id="thumb">
                    <ul>
                        <li onclick="send('civil',1)"><p>Department of Civil Engineering</p></li>
                        <li onclick="send('cse',2)"><p>Department of Computer Science and Engineering</p></li>
                        <li onclick="send('ece',3)"><p>Department of Electronic and Communication Engineering</p></li>
               
                  
  
                         <li onclick="send('del',4)"><p>Department Electrical Engineering</p></li>
                         <li onclick="send('dm',5)"><p>Department  Mechanical Engineering</p></li>
                         <li onclick="send('hotel',6)"><p>Department of Hotel Management</p></li>
                        </ul></div></div>
        
        
        
        
        <script type="text/javascript">
             var send=function(a,b){
             var text=document.getElementById(a);
         location.href="dept_videos.jsp?no="+b+"&p=1";
         
                       
                           } ;    
                           
                           
        </script>
        
    </body>
</html>
