/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.File;
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

/**
 *
 * @author aniket
 */
@WebServlet(name = "Delete_data", urlPatterns = {"/Delete_data"})
public class Delete_data extends HttpServlet {
    
    private String VIDEO_FILEPATH="E:\\test\\vedios\\";
    private String THUMBNAIL_FILEPATH="E:\\test\\thumbnail\\";

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String del=request.getParameter("del");
            String dept=request.getParameter("dept");
            try {
                connect c=new connect();
                int check=c.delete_data(del,dept);
                if(check==2){
                    request.setAttribute("message","Video Deleted Successfully");
                    
                    File deleteFile = new File(VIDEO_FILEPATH+del+".mp4") ;
                    
                        if( deleteFile.exists() )
                        deleteFile.delete() ;
                    
                    deleteFile=new File(THUMBNAIL_FILEPATH+del+".png");
                    if( deleteFile.exists() )
                        deleteFile.delete() ;
                    
                    
                }else{
                    request.setAttribute("message","Video Has Some problem");
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("/surb.jsp");
                dispatcher.forward(request, response);
                
            } catch (SQLException ex) {
                Logger.getLogger(Delete_data.class.getName()).log(Level.SEVERE, null, ex);
            }
            
           
        }
                
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    
}
    
   