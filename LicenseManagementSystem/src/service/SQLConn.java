package service;

import java.sql.Connection;
import java.sql.DriverManager;

public class SQLConn {
	public static Connection getConnection(){
		Connection conn = null;
		
	    String url ="jdbc:mysql://localhost:3306/lic_mgt_sys?serverTimezone=UTC&useUnicode=true&characterEncoding=euckr";
	    String username="root";
	    String password="1234";
	        
        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
            conn=DriverManager.getConnection(url,username,password);
 
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return conn;
	}
}
