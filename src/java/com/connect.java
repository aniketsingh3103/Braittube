package com; 
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class connect {
    public static Date dat;
    public static ArrayList<Date> date;
    public static ArrayList<String> data;
    public static ArrayList<Integer> srno;
    public static Connection con;
    public static Statement stm;
    public static String[] vedio;
    public static Thumbnail t; 
   
    public static String check;
    

    public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:XE";
    public static final String DBUSER = "system";
    public static final String DBPASS = "gunani";
    
    
    
    
    
    
    public connect() throws SQLException{
        
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
         con = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
         stm = con.createStatement();
     
        
    }
    public static void database() throws SQLException {
        
        
        try (ResultSet rs = stm.executeQuery("SELECT SYSDATE FROM DUAL")) {
            data=new ArrayList<>();
            srno=new ArrayList<>();
            date=new ArrayList<>();
            
            
            if(rs.next()) {
                dat = rs.getDate(1);
                
                date.add(dat);
                
            }}
       
        try (ResultSet r = stm.executeQuery("SELECT * FROM polytube")) {
            while(r.next()){
                
                srno.add(r.getInt("no"));
                
                data.add(r.getString("name"));
                
                
            }}
       
       
      
        stm.close();
        con.close();
    
   
}
    
    public static int register(String name,String user,String pass) throws SQLException{
        int i=0;
        int c=0;
        i=auto_inc("register","id");
        i++;
       try{ String check="select USERID from register where USERID='"+user+"'";
        ResultSet ch=stm.executeQuery(check);
        while(ch.next()){
          c++;  
        }
        //ch.close();
        if(c<1){
       String ins="INSERT INTO register(userid,password,name,id) values('"+user+"','"+pass+"','"+name+"',"+i+")";
       ResultSet in=stm.executeQuery(ins);
       in.close();
                }}
       catch(SQLException e){
           System.out.print(e);
       }
       stm.close(); 
       con.close(); 
         
     return c;         
    }
    
    public static int insert_v (String filename,String sid,String dept,String table_dept)throws SQLException{
        
     
    filename=filename.replace(".*",".mp4");   
        
        
        
        try (ResultSet rs = stm.executeQuery("SELECT SYSDATE FROM DUAL")) {
            if(rs.next()) {
                dat = rs.getDate(1);
           }
            rs.close();
        }
        
        int i=0;
        int j=0;
       ResultSet inr= null;
      int id=Integer.parseInt(sid);
      
      i=get_lno();
      i++;
      filename=filename.toLowerCase();
      String insert="INSERT INTO "+table_dept+"(ID,NAME,L,AID,DEPT,V,D_UPLOAD) values("+i+",'"+filename+"',0,"+id+",'"+dept+"',0,TO_DATE('"+dat+"', 'yyyy/mm/dd'))";
      String insert_recent="INSERT INTO RECENTVIDEO VALUES("+i+",'"+filename+"',null,null,'"+dept+"')";
      inr = stm.executeQuery(insert);
      inr.close();
      inr=stm.executeQuery(insert_recent);
       inr.close();
      update_lno(dept,i);
      update_videos(dept,1);
     
      
       
      stm.close(); 
       con.close();  
       
       return i;
       
    }
    
//-----------------------------------------------------------------------------------------------------------------------------------
    
    public static int check_user(String username,String password)throws SQLException{
        
        int f=0;
    
        String sql;
        sql = "SELECT ID,USERID,PASSWORD FROM REGISTER WHERE USERID='"+username+"'AND PASSWORD='"+password+"'";
        ResultSet s=stm.executeQuery(sql);
        while(s.next()){
          f=s.getInt("id");
        }
        
      return f;  
    }
//------------------------------------------------------------------------------------------------------------------
  public static void vedio_auto(String sid,String dept,String filename)throws SQLException, Exception{
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
      
      file v=new file();
      String path="C:\\test\\insert";
      String vedios[]=v.analyzePath(path);
      
        int i=0;
        int j=0;
       ResultSet inr= null;
      int id=Integer.parseInt(sid);
     
      
            
      i=get_lno();
        
     
        
      for(j=0;j<vedios.length;j++){
          i++;
            
            vedios[j]=vedios[j].toLowerCase();
            String insert="INSERT INTO "+table_dept+"(ID,NAME,L,AID,DEPT) values("+i+",'"+vedios[j]+"',0,"+id+",'"+dept+"')";
             inr = stm.executeQuery(insert);
          
             
      }
      
      update_lno(dept,i);
      update_videos(dept,j);
     
      
        inr.close();
      stm.close(); 
       con.close();
  
  
  }
  
  public static void generate_thumb (int sid)throws SQLException, Exception{
      
    //  file v=new file();
     // String path="E:\\test\\vedios";
      String filename=""+sid+".mp4";
      t=new Thumbnail();
      t.testSingleFrame(filename);
               
      }
        
    
  
   public static void resize_thumb(int sid)throws SQLException, Exception{
      
     
      String filename=""+sid+".png";
      t=new Thumbnail();
      t.resize_thumb(filename);
                
      
   } 
  
  
  
  
  
  public static int auto_inc(String table,String at)throws SQLException{
      int a=0;
      String np="select "+at+" from "+table+"";
        try (ResultSet rn = stm.executeQuery(np)) {
            while(rn.next()){
                if(rn.getInt(at)>a){
                    a=rn.getInt(at);
                }
            }
            //rn.close();
        }
        
        //stm.close();
        //con.close();
     return a; 
  }
  
  public static ArrayList<String> display()throws SQLException{
    ArrayList<String> name = null;
      int i=0;
      String np="select name from polytube";
        try (ResultSet rn = stm.executeQuery(np)) {
            while(rn.next()){
                if(rn.getString("name")==null) {
                } else {
                    name.add(rn.getString("name"));
                }
            }
        }
        return name;
  }
  
  public void update()throws SQLException{
      ResultSet rs = stm.executeQuery("SELECT SYSDATE FROM DUAL");
      int sno=auto_inc("polytube","no");
       int eno = 0;
      String put="insert into upload values(TO_DATE('"+rs.getDate(1)+"', 'yyyy/mm/dd'),"+sno+","+eno+")";
  }
  
 
  public static void update_lno(String dept_name,int lno) throws SQLException{
      
      ResultSet inr= null;
      String insert="UPDATE BRAITTUBE SET LNO="+lno+"WHERE DEPT='"+dept_name+"'"; 
             inr = stm.executeQuery(insert);
             inr.close();
  }
  
  
  public static void update_videos(String dept_name,int lno) throws SQLException{
      
      ResultSet inr= null;
      String insert="UPDATE BRAITTUBE SET VIDEOS=VIDEOS +"+lno+" WHERE DEPT='"+dept_name+"'"; 
             inr = stm.executeQuery(insert);
             inr.close();
  }
  
  
  public static int get_lno()throws SQLException{
      int a=0;
      String np="select max(lno) from braittube";
        try (ResultSet rn = stm.executeQuery(np)) {
            if(rn.next()){
               
                    a=rn.getInt(1);
            }
           rn.close();
        }
        
        
     return a; 
  }
  
  public static int delete_data(String del,String dept) throws SQLException{
       int a,check=0;
       a=Integer.parseInt(del);
       
       String np="DELETE FROM "+dept+" WHERE ID="+a;
       String np1="DELETE FROM RECENTVIDEO WHERE ID="+a;
        try (ResultSet rn = stm.executeQuery(np)) {
            if(rn.next()){
               
               check=1;
            }
           rn.close();
        }
        try (ResultSet rn1 = stm.executeQuery(np1)) {
            if(rn1.next()){
               
               check=2;
            }
           rn1.close();
        }
       con.close();
       stm.close();
       return check;
       
  }
  
  public static void update_view(String vid,String dept) throws SQLException{
      int id=Integer.parseInt(vid);
      ResultSet inr= null;
      String insert="UPDATE "+dept+" SET V=V+1  WHERE ID="+id; 
             inr = stm.executeQuery(insert);
             inr.close();
             con.close();
             stm.close();
  }
  public static void like_video(String vid,String dept) throws SQLException{
      int id=Integer.parseInt(vid);
      ResultSet inr= null;
      String insert="UPDATE "+dept+" SET L=L+1  WHERE ID="+id; 
             inr = stm.executeQuery(insert);
             inr.close();
             con.close();
             stm.close();
  }
  
  
  
}
