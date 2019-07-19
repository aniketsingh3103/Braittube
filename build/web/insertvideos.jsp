<%-- 
    Document   : insertvideos
    Created on : Feb 21, 2017, 11:28:34 PM
    Author     : aniket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  


<!DOCTYPE html>
<html style="overflow-y: hidden">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>upload</title>
         <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
         <style type="text/css">
             
             
             
         </style>
            
           
    </head>
        
    <body>
        
        
        
       
       
        <form action="insert_ved.jsp" method="GET" style="position: relative;left: 90px">
            
            
            
            <br> 
            <span style="color: #000">SELECT YOUR DEPARTMENT:</span>
            <select name="dept" style="font-size: 20px; text-align: center">
                <option value="cse">Computer Science and Engineering</option>
                 <option value="civil">Civil Engineering</option>
                  <option value="ece">Electronic and Communication Engineering</option>
                   <option value="dit">Diploma in Information Technology</option>
                    <option value="ddce">Diploma in Computer</option>
                     <option value="dc">Diploma in Civil</option>
                      <option value="dm">Diploma in Mechanical</option>
                       <option value="dec">Diploma in Electronic</option>
                        <option value="del">Diploma in Electrical</option>
                         <!--<option value="ho">Hotel Management</option>-->
            </select><button class="edit" style="width:100px;height: 30px">Select</button></br><br>
           
           
            
        </form>
            
        
         
            
              
    </body>
</html>

