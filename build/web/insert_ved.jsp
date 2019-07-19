  

<%@page import="java.net.NetworkInterface"%>
<%@page import="java.net.InetAddress"%>
<%@page import="com.Thumbnail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <%@page import="com.connect" %>
    <%@page session="true" %>
    <%@page import="com.choose" %>
    <%@page import="com.rename"%>
    <%@page import="com.file" %>
  
   
    <html style="overflow-y: hidden">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>upload</title>
         <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
         <style type="text/css">
             h3{
                 color: #e63e0d;
                 text-align: center;
             }
             
             
             
             .form_button{
                 width: 150px;
                 height: 30px;
                 border-radius: 4px;
                 float: right;
                 background-color: #7B1FA2;
             }    
             .file{
                 width: 100%;
                 height: 36px;
                 color: #000;
                 background-color: #eee;
                 padding: 5px;
                 border-radius: 5px;
                 font-size: 16px;
                }
             
             .upload_form{
                 width: 500px;
                 height: 400px;
                 margin: auto;
                 margin-top: 50px;
                 padding: 20px;
                //line-height: 30px;
                border: 1px solid #eee;
                box-shadow: 2px 4px 3px #ccc;
                text-align: center;
                 
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
           
       }
                            
             
         </style>
         
            
           
    </head>
        
    <body style="color: #000;font-family: sans-serif">
        
        <jsp:include page="headder.html" flush="true"/>
        
      
        <div class="headder_ved">
          
      </div>
       
       <div class="upload_form">
       <h3>SELECT YOUR VIDEO TO UPLOAD IN BRAITTUBE</h3>

            <form action="Upload" method="POST" enctype="multipart/form-data">

                <input class="file" type="file" name="file" />
                
                
               <br>
                <hr>
                  <br>
                  
       <input type="text" class="form-control1" style="width: 100%" name="title" maxlength="100" placeholder="Title for the Video"/><br>
           <textarea cols="20" rows="3" name="des" class="form-control1" style="width: 100%" placeholder="Description about the Video"></textarea><br>
           
            <input class="edit form_button" type="submit" style="float: none;" value="Upload Video" />
        
       
       </form>  
      
            
                    
      
            
       <%
           
           String message=(String)request.getAttribute("message");
           if(message!=null){
           out.print("<div class='alm'>"+message+"</div>");
           }
           %>
         
            
                
          
       
            
       </div>
      
      

            
              
    </body>
</html>

    
        
       
        
      
            
            <%
       
       
        
       // String ren=request.getParameter("rename");
        //String thumbnail=request.getParameter("thumbnail");
       // String file=request.getParameter("f_name");
       // String auto=request.getParameter("but2");
      //  String id=(String)session.getAttribute("id");
        
      //  String size=request.getParameter("resize");
        
       
      
        
       
        
     //  String dept=(String)session.getAttribute("dept");
       
    /*   String table_dept=null;
      if(dept.equals("cse")||dept.equals("ddce")||dept.equals("dit")){
          table_dept="cse";
      }
      if(dept.equals("civil")||dept.equals("dc")||dept.equals("dm")){
          table_dept="civil";
      }
      if(dept.equals("ece")||dept.equals("dec")||dept.equals("del")){
          table_dept="ece";
      }
      if(dept.equals("hotel")){
          table_dept="hotel";
      }
        
        out.println(dept);
         out.println(table_dept);
        
        
     
        connect fi;
       
        
       // if(ren!=null){
        //   rename r=new rename();
        //  r.change(table_dept);
      // }
        
        
       // if(file!=null){
         //  file f=new file();
         //   f.put_file();
     //  }
        
        
      out.println(id);
      
      
      
          if(auto!=null){
              
              if(id!=null){
          fi=new connect();
          fi.vedio_auto(id,dept);
          
         
          
          file f=new file();
            f.put_file();
            
            rename r=new rename();
          r.change(table_dept);
          
           fi.generate_thumb(id);
           
           fi.resize_thumb(id);
       }else{
          out.print("<div class='alm'>You are not login please login to upload videos</div>");
      }
            }
      
       
       
     //  if(thumbnail!=null){
          // fi=new connect();
          // fi.generate_thumb(id);
      // }
       
      // if(size!=null){
        //   fi=new connect();
         //  fi.resize_thumb(id);
      // }
       
       
       
       */
       
                %>
            
         <%        String ipAddress1 = request.getRemoteAddr();
           
           
           InetAddress inetAddress;
StringBuilder sb = new StringBuilder();
String ipAddress="",macAddress="";
int i=0;
try {
    inetAddress=InetAddress.getLocalHost();
    ipAddress=inetAddress.getHostAddress();
    NetworkInterface network=NetworkInterface.getByInetAddress(inetAddress);
     byte[] hw=network.getHardwareAddress();
    for(i=0; i<hw.length; i++)
        sb.append(String.format("%02X%s", hw[i], (i < hw.length - 1) ? "-" : ""));    
    macAddress=sb.toString();
} catch(Exception e) {
    out.print("<br/>"+e.toString());
    macAddress="-";
}
out.print("<br/>"+ipAddress);
out.print("<br/>"+macAddress);
   
%>





   
</head>
<body>
    <div>
        <a id="Anchor_Id" href="" target="_top" onclick="GetHostName()">Click Here</a>
    </div>
</body>
</html>

