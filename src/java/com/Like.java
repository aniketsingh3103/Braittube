/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aniket
 */
@WebServlet(name = "Like", urlPatterns = {"/Like"})
public class Like extends HttpServlet {

   
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           connect c=new connect();
           String id=request.getParameter("id");
           String dept=request.getParameter("dept");
           c.like_video(id,dept);
           
             request.getRequestDispatcher("/vedios.jsp").forward(request, response);
              
    }   catch (SQLException ex) {
            Logger.getLogger(Like.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        
    

   
    

   
}
