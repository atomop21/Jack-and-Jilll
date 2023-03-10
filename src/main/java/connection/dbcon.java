package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbcon {
	
	private static Connection con =null;
	
	public static Connection getConnection() {
		if(con==null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jacknjill","atom","Sorcersupreme#7");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return con;
			}

}
