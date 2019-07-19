
package com;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DataRetrival {
    private static connect getcon;
   public static List<Videos> getRecords(String dept){  
        List<Videos> list=new ArrayList<Videos>();  
        try{  
            
           getcon=new connect(); 
           
           String data="SELECT ID,NAME,DEPT,TITLE FROM RECENTVIDEO WHERE ROWNUM <= 12";
           
           PreparedStatement ps=getcon.con.prepareStatement(data);  
            
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Videos v=new Videos();  
                v.setId(rs.getInt("id"));  
                v.setName(rs.getString("name"));
                v.setDept(rs.getString("dept"));
                v.setTitle(rs.getString("title"));
                list.add(v);  
            }  
            rs.close();
            getcon.con.close();
            getcon.stm.close();
        }catch(Exception e){System.out.println(e);}  
        
        return list;  
    }  
    
    
    
}
