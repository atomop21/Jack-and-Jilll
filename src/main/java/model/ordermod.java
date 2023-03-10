package model;

public class ordermod extends product{
	private int orderid;
	private int uid;
	private int quantity;
	private String date;
	
	public ordermod() {
	}

	public ordermod(int id, String name, String category, double price, String image, int orderid, int uid,
			int quantity, String date) {
		super();
		this.orderid = orderid;
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
	}

	public ordermod(int uid, int quantity,String date) {
		super();
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}

}
