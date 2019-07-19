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
public class SurbData {
    private static connect getcon;
    private static ResultSet rs;
    public static List<Videos> getRecords(){  
        List<Videos> list=new ArrayList<Videos>();  
        try{  
            
           getcon=new connect();
           
           String data1="SELECT ID,NAME,DEPT,V,L FROM CSE WHERE ROWNUM <=5";
           String data2="SELECT ID,NAME,DEPT,V,L FROM CIVIL WHERE ROWNUM <=5";
           String data3="SELECT ID,NAME,DEPT,V,L FROM ECE WHERE ROWNUM <=5";
           String data4="SELECT ID,NAME,DEPT,V,L FROM HOTEL WHERE ROWNUM <=5";
           
           PreparedStatement ps=getcon.con.prepareStatement(data1);  
           PreparedStatement ps1=getcon.con.prepareStatement(data2);  
           PreparedStatement ps2=getcon.con.prepareStatement(data3);  
           PreparedStatement ps3=getcon.con.prepareStatement(data4);  
            
             rs=ps.executeQuery();  
            while(rs.next()){  
                Videos v=new Videos();  
                v.setId(rs.getInt("id"));  
                v.setName(rs.getString("name"));
                v.setDept(rs.getString("dept"));
                v.setV(rs.getInt("v"));
                v.setL(rs.getInt("l"));
                list.add(v);  
            }  
            rs.close();
            rs=ps1.executeQuery();  
            while(rs.next()){  
                Videos v=new Videos();  
                v.setId(rs.getInt("id"));  
                v.setName(rs.getString("name"));
                v.setDept(rs.getString("dept"));
                v.setV(rs.getInt("v"));
                v.setL(rs.getInt("l"));
                list.add(v);  
            }  
            rs.close();
            rs=ps2.executeQuery();  
            while(rs.next()){  
                Videos v=new Videos();  
                v.setId(rs.getInt("id"));  
                v.setName(rs.getString("name"));
                v.setDept(rs.getString("dept"));
                v.setV(rs.getInt("v"));
                v.setL(rs.getInt("l"));
                list.add(v);  
            } 
            rs.close();
           rs=ps3.executeQuery();  
            while(rs.next()){  
                Videos v=new Videos();  
                v.setId(rs.getInt("id"));  
                v.setName(rs.getString("name"));
                v.setDept(rs.getString("dept"));
                v.setV(rs.getInt("v"));
                v.setL(rs.getInt("l"));
                list.add(v);  
            }  
            rs.close();
            getcon.con.close();
            getcon.stm.close();
        }catch(Exception e){System.out.println(e);}  
        
        return list;  
    }  
}
