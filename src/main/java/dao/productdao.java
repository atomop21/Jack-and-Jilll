package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.cart;
import model.product;

public class productdao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public productdao(Connection con) {
		
		this.con = con;
	}

	public List<product> getAllProducts(){
		List<product> prod=new ArrayList<product>();
		
		try {
		    query="select *from products";
			pst=this.con.prepareStatement(query);
			rs=pst.executeQuery();
			while(rs.next()) {
				product row=new product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
				
				prod.add(row);
			}
		}
		catch(Exception e) {
			
		}
		return prod;
		
	}
	public List<cart> getCartProducts(ArrayList<cart> cartlist){
		List<cart> products=new  ArrayList<cart>();
		try {
			if(cartlist.size()>0) {
				for(cart item:cartlist) {
					query="select *from products where id=?";
					pst=this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs=pst.executeQuery();
					while(rs.next()) {
						cart row=new cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
						
						
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return products;
		
	}
	public double getTotalPrice(ArrayList<cart> cartlist) {
		double sum=0;
		
		try {
			if(cartlist.size()>0) {
				for(cart item:cartlist) {
					query="select price from products where id=?";
					pst=this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs=pst.executeQuery();
					
					while(rs.next()) {
						sum= sum+rs.getDouble("price")*item.getQuantity();
						
					}
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return sum;
		
	}
	public product getSingleProduct(int id) {
		product row=null;
		try {
			query="select *from products where id=?";
			pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs=pst.executeQuery();
			while(rs.next()) {
				row= new product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setImage(rs.getString("image"));
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return row;
		
		
	}
	public void deleteprod(int id) {
		try {
			query="delete from products where id=?";
			pst=this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
