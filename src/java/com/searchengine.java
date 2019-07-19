
package com;
import com.connect;
import java.sql.SQLException;
public class searchengine {
    private connect con;
    public void create_connection() throws SQLException{
        con=new connect();
        
    }
}
