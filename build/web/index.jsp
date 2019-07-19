
<%@page import="com.DataRetrival"%>
<%@page import="com.DataAdapter"%>
<%@page import="com.Videos"%>
<%@page import="java.util.List"%>
<html style="overflow-x: auto;overflow-y: auto">
    <head>
        <title>Brait tube</title>
       
            <link href="style/main.css" rel="stylesheet" type="text/css" media="all">
            <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
            <style type="text/css">
                
        .video_hold{
                width: 100%;
                height: 100%;
               }
            .video_hold .recent{
                float: left;
                width: 73%;
                //display: inline-table;
            }
     a{
         text-decoration: none;
          color: #fff;
        }
        
        .channel_div{
            width: 100%;
           background-color: #263238;
            cursor: pointer;
            text-align: center;
           
        }
        .channel_div ul li{
          display: inline-table;
          list-style: none;
          font-family:"Trebuchet MS",Arial,sans-serif;
          font-size: 16px; 
        color: #fff;
        border: 1px solid #eee;
        margin: 5px;
        text-align: center;
        padding: 3px;
        }
        
        .channel_div .channel_head{
            width: 300px;
            height: 30px;
            color: #D81B60;
            text-align: center;
            margin-left: -45px;
            margin-right: 0px;
            font-size: 20px;
        }

       
           
            .tag{
                background-color: rgb(30,93,173);
                width: 100%;
                margin: 0 auto;
                font-size: 1em;
                font-family: 'Ropa Sans', sans-serif;
                padding: 10px;
                color: #fff;
            }
            
            
           
           
            
             .polpular{
                float: right;
                width: 24%;
               margin: 0px 10px 10px;
               text-align: center;
            }
            .polpular .cont{
                padding: 10px;
                border: 1px solid #ccc;
            }
            .polpular .top{
                width: 100%;
                background-color: rgb(30, 93, 173);
                height: 50px;
                padding: 7px;
            }
            .polpular img{
                width: 95%;
                height: 30%;
                
            }
             .polpular p{
                width: 95%;
                color:  rgb(30, 93, 173);
            }
            
            .fotter{
                clear: both;
                position: relative;
                z-index: 10;
                height: 3em;
                margin-bottom: -10em;
                width: 100%;
                padding: 10px 0px 20px 0px;
                font-family: 'Titillium Web', sans-serif;
                background: rgb(30, 93, 173);
          

            }
            
            
            
            .ul_cont{
                width: 97%;
                margin: 0 auto;
                float: left;
               }
               
.ul_cont ul li {
    display: inline-table;
    padding: 5px;
    border: 1px solid #ccc;
    margin: 5px;
    list-style: none;
    color: #000;

        }
        
         .ul_cont ul li img{
            width: 200px;
            height: 150px;
        }
        .ul_cont ul li p{
            width: 200px;
            height: 40px;
            font-size: 70%;
            font-family: sans-serif;
            word-spacing: 1px;
            padding: 3px;
            text-transform: capitalize;
            overflow: hidden;
            color: #01579B;
                     }
            .dept{
                float: left;
                font-size: 12px;
                text-transform: uppercase;
               margin-left: 5px;
               }
            
    </style>
                
    </head>
    
    <body>
        
       
        <%@page session="true"%>
        <%@ page import="com.file"%>
        <%@page import="com.connect" %>
        <%@page import="java.util.ArrayList" %>
        <%@page import="com.user" %>
        <%@page import="java.sql.ResultSet"%>
        <%

      List<Videos> list=DataRetrival.getRecords("CSE");
      %>
   
   <jsp:include page="headder.html" flush="true"/>
      
            
   <div class="at_1">
       <div class="at_2">
           <h2>HAVE SOME PROBLEM <br>WE HAVE THE SOLUTION. WELCOME TO THE WORLD OF VIDEOS</h2>
           </div>
       <div class="at_3" id="slide">
          <img src="images/1900x400xbanner_stadium.jpg" width="100%" height="300px"/>
            <img src="images/1900x400xbanner_stone.jpg" width="100%" height="300px"/>
            <img src="images/Kindle_we-are-the-readers_website_flyout_499x468.jpg" width="100%" height="300px"/>
       </div>
       
   </div>     
     
          <div class="channel_div"><ul><li class="channel_head">Channels</li><br><li>Computer Science</li><li>Electronic</li>
                  <li ><a href="#civil">Civil</a></li>
         <li>Mechanical</li>
             <li>Electrical</li><li>Hotel Management</li></ul></div>
   <div class="video_hold">  
                    
                    
                    <div class="recent">    
                    <div class="tag" >Latest Video From Brait Tube</div>     
               <div class="ul_cont">
    <ul>
        <%
      String put=null;
        for(Videos v:list){
   
   put=v.getName();
    put=put.replace(".mp4","");
    
%>    
    <li><img src="thumbnail/<%=v.getId()%>.png"/>
                  <a id="<%=v.getId()+5%>" href='#'><p onclick="send(<%=v.getId()+5%>,'<%=v.getDept()%>')"><%=put%></p></a>
    <span class="dept"><%=v.getDept()%></span></li> 
                  
                 
                  <%  } //end of for loop      %>
                 </ul> </div>
                  
                    </div>
   
                    <div class="polpular"><div class="top">Popular Videos</div>
                        <div class="cont" ><img src="images/back1.jpg"/><p>BigData and Haddop file system</p></div>
                        
                        <div class="top">Recommend Videos</div>
                    <div class="cont" ><img src="images/back1.jpg"/><p>BigData and Haddop file system</p></div>
                    
                    
                    </div>
</div>
              
                <div id="message" class="mess">YOU MUST LOGIN TO WATCH LOGIN FIRST</div>
                
               
                <div class="fotter"></div>      
                 <input type="hidden" value="<%=(String)session.getAttribute("u_name")%>" id="nam"/>
               

                 
                 <script type="text/javascript">
    var disp=document.getElementById("thumb");
    var cli=document.getElementById("nam").value;
    var log_but=document.getElementById("l");
    var log=document.getElementById("log");
    
    var click=function(){
        var i=document.getElementById("1");
                i.className="click";
            };
   
    
     var slideshow =function(container){
        this.image=[];
        this.cur=0;
        
        for(var i=0;i<container.childElementCount;i++){
            this.image.push(container.children[i]);

        }
        
        
        var nextsilde=function(){
            for(var i=0;i<this.image.length;i++){
                this.image[i].style.display="none";
                
            }
            this.image[this.cur].style.display="block";
            
            this.cur++;
            if(this.cur >= this.image.length){
                this.cur=0;
            }
        
        window.setTimeout(nextsilde.bind(this),2000);
        };
        
        nextsilde.call(this);
         
    };
        
    slideshow(document.getElementById("slide"));
    
     
     
         var send=function(a,dept){
             var text=document.getElementById(a);
          
              var tex_id=text.id-5;
           text.href="vedios.jsp?ved="+tex_id+"&dept="+dept;
         
                       
                           } ;    
                       
            var dislay=function(){
                document.getElementById("message").className="message";
                };
                
                var change_but=function(){
                    if(cli!="null"){
                    log.innerHTML="Logout";
                    log_but.href="logout.jsp"
                }
                };
             change_but(); 
            
        

</script>

    </body>
    </html>