package dao;
import model.*;
import java.sql.*;

public class userdao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public userdao(Connection con) {
		
		this.con = con;
	}
	
	public user userlogin(String email,String password) {
		user us=null;
		try {
			query="select * from user where email=? and password=?";
			pst=this.con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			rs=pst.executeQuery();
			if(rs.next()) {
				us=new user();
				us.setId(rs.getInt("id"));
				us.setName(rs.getString("name"));
				us.setEmail(rs.getString("email"));
				us.setMobile(rs.getString("mobile"));
				us.setGender(rs.getString("gender"));
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return us;
		
	}
	public boolean register(user us) {
		boolean res=false;
		try {
			query="insert into user(name,email,password,mobile,gender) values(?,?,?,?,?)";
			pst=this.con.prepareStatement(query);
			pst.setString(1, us.getName());
			pst.setString(2, us.getEmail());
			pst.setString(3, us.getPassword());
			pst.setString(4, us.getMobile());
			pst.setString(5, us.getGender());
			pst.executeUpdate();
			res=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
	}
}
