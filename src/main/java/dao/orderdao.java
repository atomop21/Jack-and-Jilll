package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import dao.productdao;
import model.ordermod;
import model.product;

public class orderdao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public orderdao(Connection con) {
		this.con=con;
	}
	
	public boolean insertord(ordermod mod) {
		boolean res=false;
		try {
			query="insert into orders(p_id,u_id,o_quantity,o_date) values(?,?,?,?)";
			pst=this.con.prepareStatement(query);
			pst.setInt(1, mod.getId());
			pst.setInt(2, mod.getUid());
			pst.setInt(3, mod.getQuantity());
			pst.setString(4, mod.getDate());
			pst.executeUpdate();
			res=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
	}
	public List<ordermod> userorders(int id)
	{
		List<ordermod> list=new ArrayList<>();
		try {
			query="select * from orders where u_id=? order by orders.o_id desc";
			pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while(rs.next()) {
				ordermod ord=new ordermod();
				productdao pdao=new productdao(this.con);
				int pid=rs.getInt("p_id");
				product pd = pdao.getSingleProduct(pid);
				ord.setOrderid(rs.getInt("o_id"));
				ord.setId(pid);
				ord.setName(pd.getName());
				ord.setCategory(pd.getCategory());
				ord.setPrice(pd.getPrice()*rs.getInt("o_quantity"));
				ord.setQuantity(rs.getInt("o_quantity"));
				ord.setDate(rs.getString("o_date"));
				list.add(ord);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	public void cancelOrder(int id) {
		
		try {
			query="delete  from orders where o_id=?";
			pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public List<ordermod> allorders(){
		List<ordermod> list=new ArrayList<>();
		try {
			query="select* from orders";
			pst=this.con.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				ordermod ord=new ordermod();
				productdao pdao=new productdao(this.con);
				int pid =rs.getInt("p_id");
				product pd=pdao.getSingleProduct(pid);
				ord.setOrderid(rs.getInt("o_id"));
				ord.setUid(rs.getInt("u_id"));
				ord.setDate(rs.getString("o_date"));
				ord.setName(pd.getName());
				ord.setPrice(pd.getPrice());
				ord.setQuantity(rs.getInt("o_quantity"));
				list.add(ord);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
}
