package test.jsp.study.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon2 {

	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "osfu";
	private static final String PASSWORD = "12345678";
	private static final String CLASS_NAME = "oracle.jdbc.OracleDriver";
	private static Connection con = null;

	public static void open() {
		try {
			Class.forName(CLASS_NAME);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getCon() {
		if(con==null) {
			open();
		}
		return con;
	}
	public static void close() {
		if(con!=null) {
			try {
				if(!con.isClosed()) {
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		con = null;
	} 
}
