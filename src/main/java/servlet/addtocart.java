package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.cart;

@WebServlet("/addtocart")
public class addtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter()){
			ArrayList<cart> cartlist=new ArrayList<>();
			int id=Integer.parseInt(request.getParameter("id"));
			cart car= new cart();
			car.setId(id);
			car.setQuantity(1);
			
			HttpSession sess=request.getSession();
			ArrayList<cart> cart_list=(ArrayList<cart>) sess.getAttribute("cart-list");
			if(cart_list==null) {
				cartlist.add(car);
				sess.setAttribute("cart-list", cartlist);
				response.sendRedirect("index.jsp");
			}else {
				cartlist=cart_list;
				boolean exist =false;
				
				for(cart c:cart_list) {
					if(c.getId()==id) {
						exist=true;
						out.println("<h3 style='color:crimson; text-align:center'>Item Already Exists in cart <a href='cart.jsp'>Go to Cart</a></h3> ");
					}
	
				}
				if(!exist) {
					cartlist.add(car);
					response.sendRedirect("index.jsp");
				}
			}
			
		}
	}

}
