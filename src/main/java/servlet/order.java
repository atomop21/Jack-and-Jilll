package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.dbcon;
import dao.orderdao;
import model.cart;
import model.ordermod;
import model.user;

@WebServlet("/order")
public class order extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter pw=response.getWriter()){
			
			SimpleDateFormat formatr=new SimpleDateFormat("yyyy-MM-dd");
			Date dat=new Date();
			user auth=(user) request.getSession().getAttribute("auth");
			if(auth!=null) {
				String pid=request.getParameter("id");
				int proquan=Integer.parseInt(request.getParameter("quantity"));
				if(proquan<=0) {
					proquan=1;
				}
				ordermod ord=new ordermod();
				ord.setId(Integer.parseInt(pid));
				ord.setUid(auth.getId());
				ord.setQuantity(proquan);
				ord.setDate(formatr.format(dat));
				
				orderdao odao=new orderdao(dbcon.getConnection());
				boolean res=odao.insertord(ord);
				
				if(res) {
					ArrayList<cart> cart_list=(ArrayList<cart>) request.getSession().getAttribute("cart-list");
					if(cart_list!=null) {
						for(cart c:cart_list) {
							if(c.getId()== Integer.parseInt(pid)) {
								cart_list.remove(cart_list.indexOf(c));
								break;
							}
						}
					}
					response.sendRedirect("orders.jsp");
					
				}else {
					pw.println("order failed");
				}
				
			}else {
				response.sendRedirect("login.jsp");
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
