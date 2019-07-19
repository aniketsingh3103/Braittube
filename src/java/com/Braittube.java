package com;
import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Braittube implements Serializable{
    private int no;
    private String name;
    private int like;
    private int id;
    
    public String getname(){
        return name;
    }
    public int getno(){
        return no;
    }
    public int getlikes(){
        return like;
    }
    public int getid(){
        return id;
    }
    
    public void setname(String name){
        this.name=name;
    }
    public void setno(int no){
        this.no=no;
    }
    public void setid(int id){
        this.id=id;
    }
    public void setlike(int like){
        this.like=like;
    }
    
    public static Braittube load(ResultSet rs) throws SQLException{
        Braittube tube=new Braittube();
        tube.setname(rs.getString(2));
        tube.setno(rs.getInt(1));
        tube.setlike(rs.getInt(3));
        tube.setid(rs.getInt(4));
        
    return tube;
    }
    
    
    
}
