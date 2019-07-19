/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

/**
 *
 * @author aniket
 */
public class Videos {
    
     
private int id;  

   
private int l;
private String date;
private String dept;
private String title;
private String name;  
private int v;  

 public String getTitle() {
        return title;
    }


    public void setTitle(String title) {
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getV() {
        return v;
    }

    public void setL(int l) {
        this.l = l;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getDate() {
        return date;
    }

    public String getDept() {
        return dept;
    }
    public int getL(){
        return l;
    }
    

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setV(int v) {
        this.v = v;
    }
    
    
    
}
