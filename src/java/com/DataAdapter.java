/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author aniket
 */
public class DataAdapter {
    private static connect getcon;
    
    public static List<Videos> getRecords(String dept,int pageid){  
        List<Videos> list=new ArrayList<Videos>();  
        try{  
            
           getcon=new connect(); 
           
           PreparedStatement ps=getcon.con.prepareStatement("SELECT ID,NAME,V FROM "+dept+" WHERE ROWNUM<=5 AND ID >= "+pageid );  
            
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                Videos v=new Videos();  
                v.setId(rs.getInt("id"));  
                v.setName(rs.getString("name"));  
                v.setV(rs.getInt("v"));  
                list.add(v);  
            }  
            rs.close();
            getcon.con.close();
            getcon.stm.close();
        }catch(Exception e){System.out.println(e);}  
        
        return list;  
    }  
    
    
    
    
   
}
