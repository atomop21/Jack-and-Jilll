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


@WebServlet("/checkout")
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter pw=response.getWriter()){
			SimpleDateFormat formatr=new SimpleDateFormat("yyyy-MM-dd");
			Date dat=new Date();
			ArrayList<cart> cart_list=(ArrayList<cart>) request.getSession().getAttribute("cart-list");
			user auth=(user) request.getSession().getAttribute("auth");
			if(cart_list!=null && auth != null) {
				for(cart c:cart_list) {
					ordermod ord=new ordermod();
					ord.setId(c.getId());
					ord.setUid(auth.getId());
					ord.setQuantity(c.getQuantity());
					ord.setDate(formatr.format(dat));
					
					orderdao odao=new orderdao(dbcon.getConnection());
					boolean res=odao.insertord(ord);
					if(!res) {
						break;
					}
					
				}
				cart_list.clear();
				response.sendRedirect("orders.jsp");
				
			}else {
				if(auth==null) {
					response.sendRedirect("login.jsp");
					response.sendRedirect("cart.jsp");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
