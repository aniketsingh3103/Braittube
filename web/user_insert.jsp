


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="overflow-y: hidden">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>upload</title>
         <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
         <style type="text/css">
             .admin{
                 margin-left:40%;
                 text-align: center;
                 color: black;
                 width: 200px;
                 background-color: #19640e;
                 cursor: pointer;
             }
             .feild{
                 margin: auto;
                 font-family: sans-serif;
                 font-size: 120%;
                 text-align: center;
             }
             .insert{
                 visibility: hidden;
                 
             }
             .user{
                 text-align: center;
                 font-family: sans-serif;
                 font-size: 100%;
                 background-color: #aabee2;
                 color: #a70f3b;
                 margin: auto;
                 width: 500px;
                 height: 100px;
                 padding: 7px;
                 text-transform: uppercase;
                 font-weight: 600px;
                 border-radius: 20px;
                 word-spacing: 3px;
             }
         </style>
            
           
    </head>
    
    
    <body>
       
    <jsp:include page="headder.html" flush="true"/>
    <div class="user">
        <p>this page is still under development
        soon u will be able to upload videos</p>
    </div>
       <div class="insert"> 
       <br><br>
       <div class="feild">
           <h1 Style="color: #1e556d;text-align: center"> Insert Vedios</h1>
                <form action="" method="POST" style="position: relative;left: 90px">
                    <input class="inp" style="width: 50%;" type="text" name="ved" id="ved"  placeholder="insert vedio"/><br>
                    <button class="edit" style="width: 20%;text-align: center;border-radius: 6px 6px 6px 6px"  name="but2">BROWSE</button>
                    <button class="edit" style="width: 20%;text-align: center;border-radius: 6px 6px 6px 6px"  name="but2">UPLOAD</button>
                </form>
       </div>
            <div class="admin">
            <h3 >Adminstator uplode</h3>
            <p>login here</p>
            </div>
            
       </div>  
            
    </body>
</html>
