
package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;


@WebServlet(name = "user", urlPatterns = {"/user"})
public class user extends HttpServlet {
    
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name=request.getParameter("username");
            String password=request.getParameter("password");
            HttpSession session=request.getSession();
            
            if(!"".equals(name)&&name!=null&&password!=null){
            
                try{
            connect c=new connect();
            int j=c.check_user(name,password);
            String k=j+"";
    if(j>0){
        
                session.setAttribute("u_name", name);
                session.setAttribute("id",k);
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
              
    }
    else
    {
        out.print("<h3>u are not a member</h3>");
    }
    
    
    
            }catch(SQLException e){}
            
            
            }
            
            
            
           
           
            
            
        }
    }

 

}
