package com;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "Upload", urlPatterns = {"/Upload"})
public class Upload extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "C://test//vedios";
    private String filename=null;
    private int v_id;
    private connect con;
    private rename r;
    private file f;
   //private file f;
   //private boolean check;
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      HttpSession session=request.getSession();
      
        String username=(String)session.getAttribute("u_name");
        String dept=(String)session.getAttribute("dept");
        String id=(String)session.getAttribute("id");
        
        if(username!=null){
            
            String table_dept=null;
        
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
      
      if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
                
                int temp=0;
              
                for(FileItem item : multiparts){
                    
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                    if(temp==0){
                  filename=item.getName();
                    }
                    temp++;
                }
            
                
          con=new connect();
          r=new rename();
         // f=new file();
       
          v_id = con.insert_v(filename,id,dept,table_dept);
          r.change(filename,v_id);//rename the file
          
       // check=f.getfile(v_id);
          
        //if(check==true){
            
            con.generate_thumb(v_id);//generate the thumbnail
            con.resize_thumb(v_id);//resize the thumbnail
         // }
            
           f=new file(); 
 String remoteHost = request.getRemoteHost();
           
//String ipAddress1 = request.getRemoteAddr();
InetAddress inetAddress = null;
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
    System.out.print(e.toString());
    macAddress="-";
}
        
//String hostname=getHostName(inetAddress);

//System.out.print(hostname);

    f.put_mac(v_id,ipAddress, macAddress,remoteHost);
            
            
            
            
            

          request.setAttribute("message", "File Uploaded Successfully");
                
                
                
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }    
         
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
      
     
        
        }else{
            request.setAttribute("message",
                                 "You are not login please login to upload videos");
        }
        
        
          
        request.getRequestDispatcher("/insert_ved.jsp").forward(request, response);
     
    }
    
    
    
    private String getHostName (InetAddress inaHost) throws UnknownHostException
    {
       try
       {
           Class clazz = Class.forName("java.net.InetAddress");
           Constructor[] constructors = clazz.getDeclaredConstructors();
           constructors[0].setAccessible(true);
           InetAddress ina = (InetAddress) constructors[0].newInstance();

           Field[] fields = ina.getClass().getDeclaredFields();
           for (Field field: fields)
           {
               if (field.getName().equals("nameService"))
               {
                   field.setAccessible(true);
                   Method[] methods = field.get(null).getClass().getDeclaredMethods();
                   for (Method method: methods)
                   {
                        if (method.getName().equals("getHostByAddr"))
                        {
                            method.setAccessible(true);
                            return (String) method.invoke(field.get (null), inaHost.getAddress());
                        }
                   }
               }
           }
       } catch (ClassNotFoundException cnfe) {
       } catch (IllegalAccessException iae) {
       } catch (InstantiationException ie) {
       } catch (InvocationTargetException ite) {
           throw (UnknownHostException) ite.getCause();
       }
       return null;
    }
  
}