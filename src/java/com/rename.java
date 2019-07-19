
package com;
import java.io.File;
import com.connect;
import java.sql.ResultSet;
import java.sql.SQLException;

public class rename {
    
   public static int t=0;
   public static void change(String filename,int v_id)throws  SQLException{
       
       
        
       
      
 
       //connect data_c=new connect();
       //String s="select id,name from "+dept;
      // ResultSet exe=data_c.stm.executeQuery(s);
      // while(exe.next()){
      
       File oldName = new File("C:\\test\\vedios\\"+filename);
       File newName = new File("C:\\test\\vedios\\"+v_id+".mp4");
      
       
       if(oldName.renameTo(newName)) {
           
          t=1;
       }
      
      
   //}exe.close();
  //data_c.stm.close();
  // data_c.con.close();

    
}
   
}

