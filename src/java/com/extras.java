
package com;
import com.connect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class extras {
    
    
    public int like(int no) throws SQLException{
        
     int li = 0;
     
    String query="update polytube set like=1 where no="+no;
        try (PreparedStatement pstm = connect.con.prepareStatement(query)) {
            ResultSet r;
            pstm.executeUpdate();
            connect.stm.close();
            connect.con.close();
        }
        return li;
    }
    public int suscribe(){
        int id=0;
        return id;
        
    }
}
