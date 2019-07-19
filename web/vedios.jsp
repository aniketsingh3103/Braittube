<%@page import="com.file"%>
<%@page import="java.io.File"%>
<%@page import="com.connect"%>
<%@page import="java.sql.ResultSet"%>
<html>
    
    <title>vedios</title>
    
    <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
    <link href="style/vedio.css" rel="stylesheet" type="text/css" media="all">
   
    <%@page import="com.extras" %>
  
    <body style="color: #000">
    
    <% String ved=request.getParameter("ved");  
    String play="vedios/"+ved+".mp4";
    String dept=request.getParameter("dept");    %>
    
    <jsp:include page="headder.html" flush="true"/>
   
    <div class="play" id="ved"><a href="#" onclick="play('<%=play%>')"><img  class="image" src="images/play4.png" alt="Video 1" title="video 1" />
            </a></div>

  
   
 
    <div class="vedios">
       <div class="vedio1">
           
    
        <video id="audio" autoplay="true" controls height="72%" width="100%" autoflush="true">
       
                        Your browser does not support the VIDEO element.
        </video>
           
          
           
        <div class="holder prop">
            <div class="hold" onclick="display()">
                
                <div class="a"><div class="head" style="background-color: #cc0000"><img src="images/face5.png"/><div class="n_head" style="color: white">1,025</div><div class="n_head">Suscribe</div></div></div>
                <div class="b"><div class="head" style="background-color: #807c7c"><img src="images/twit2.png"/><div class="n_head" id="like" name="like" onclick="like(<%=ved%>,'<%=dept%>')">like</div><div class="n_head">8,142</div></div></div>
    <div class="c" style="float: right"><div class="head" style="background-color: #807c7c"><img src="images/google5.png"/><div class="n_head">views</div><div class="n_head">10,238</div></div></div>
                  </div>
        </div>
</div>
    </div>
            <div class="upload_form"><h4>Comment for Videos</h4>
            
            
            
           <textarea cols="20" rows="3" name="des" class="form-control1" style="width: 100%;height: 60px;" placeholder="Your Comment"></textarea><br>
             <button class="edit" style="float: right; width: 100px;" name="but2">Post</button>
            </div>
           <%
           String like=request.getParameter("like");
           if(like!=null){
               extras s=new extras();
               int no=Integer.parseInt(ved);
               int a=s.like(no);
           }
           
           String view =null;
           
           
           String ipAddress = request.getRemoteAddr();
           file f=new file();
           connect c=new connect();
           f.put_ip(ved,ipAddress);
          
           connect.update_view(ved,dept);
       
           
           %>
            
       

    

    <script type="text/javascript">
        function play(file) {
            var pl = document.getElementById('audio');
            var icon=document.getElementById('ved');
            pl.src = file;
            icon.className="ved2";
        };
        var display=function(){
            var disp=document.createElement(div);
        };
        
        var like=function(id,dept){
            
          location.href="Like?id="+id+"&dept="+dept;  
        };
        
        
    </script>
</body>
    
    
</html>