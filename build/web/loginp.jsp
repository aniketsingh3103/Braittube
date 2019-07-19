
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>login</title>
         <link href="style/login.css" rel="stylesheet" type="text/css" media="all">
         <link href="style/common.css" rel="stylesheet" type="text/css" media="all">
        
        
        
        <%@page session="true" %>
        <%@ page import="com.file"%>
        <%@page import="com.connect" %>
        <%@page import ="com.user" %>
       <%@page import="java.lang.String"%>
        
        
    </head>
    
    <body>
        
         <jsp:include page="headder.html" flush="true"/>
        
        
        
        <div class="container" id="cont">
           
                <form class="form-login" method="post" action="user">
                    <h2 class="form-login-main form-login-heading">sign in</h2>
                    <div class="login-wrap">
                <input  class="form-control" type="text" name="username" placeholder="username" autofocus/>
                        <br>
                <input class="form-control" type="password" name="password" placeholder="password"/>
                        <label class="checkbox">
                            
                        <a href="#">forget password</a>
                            
                        </label>
                <button class="btn btn-theme btn-block" name="login">LOGIN</button><br><br>
                 <span class="btn btn-theme btn-block" onclick="polreg()">SIGN UP</span>
                
                    </div>
                     <h6 class="form-login-main form-login-fotter">BraitTube coperation </h6>
                    </form>
           
            </div>
        
    <div id="register" class="reg">
        <form action="loginp.jsp" method="post">
            <h2 class="form-login-main form-login-heading">register</h2>
            <div class="login-wrap">
                <input class="form-control" type="text" name="use1" id="1" value placeholder="name" required/><br>
                <input class="form-control" type="text" name="use2" id="2" value placeholder="username" required/><br>
            <input class="form-control" type="password" name="p1" id="3" value placeholder="password"/><br>
            <input class="form-control" type="password" name="p2" id="4" value placeholder="re-password"/><br>
            <label class="checkbox" style="font-style: oblique;color: gray">
                You Accept the user Argements<input type="checkbox" name="check" />
            </label>           
            <button class="btn btn-theme btn-block"  name="press">submmit</button><br>
            <p class="btn btn-theme btn-block" onclick="close_reg()">cancle</p>
            </div>
            <h6 class="form-login-main form-login-fotter">BraitTube coperation </h6>
        </form>
    </div>
        <%
        String press=request.getParameter("press");
        String nam=(String)request.getParameter("use1");
        String user=request.getParameter("use2");
        String password=request.getParameter("p1");
        String password2=request.getParameter("p2");
        String check=request.getParameter("check");
        if(press!=null)
        {
            if(nam!=null&&nam!="")                                   {
               
            if(password.equals(password2)){
                if(check!=null){
            connect insert=new connect();
            int t=insert.register(nam, user, password);
             if(t>=1){
                 out.println("<p class='error' id='error'>USERNAME is already in use TRY another</p>");
             }else{
                 out.print("<p class='error' id='error'>WELCOME TO BRAIT TUBE</p>");
             }
            
            
                }else{
                    out.println("<p class='error' id='error'>Accept the user Argement</p>");
                }
        }else{
                out.print("<p class='error' id='error'>Password must match</p>");
            }
            }
            else{           
              out.print("<p class='error' id='error'>Must enter the name</p>");             }
                                  // }
        }
        
        
        %>
        
        <script type="text/javascript">
            var reg=document.getElementById("register");
            var cont=document.getElementById("cont");
            var error=document.getElementById("error");
            var polreg=function(){
                cont.className="close_cont";
                reg.className="reg_class";
                error.className="hide_error";
                
            };
            var close_reg=function(){
                cont.className="container";
                reg.className="reg";
            }
            
            
            
            
        </script>
                
    </body>     
        
    
</html>
