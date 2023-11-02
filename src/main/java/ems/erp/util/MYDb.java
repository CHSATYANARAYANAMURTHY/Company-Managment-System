package ems.erp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MYDb {
	
	public static String driver = "oracle.jdbc.driver.OracleDriver";
	public static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	public static String username = "employeedb";
	public static String password = "employeedb";
	
	public static Connection con;
	public static Connection getCon() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;		
	}

}
