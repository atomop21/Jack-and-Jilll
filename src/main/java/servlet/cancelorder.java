package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.dbcon;
import dao.orderdao;


@WebServlet("/cancelorder")
public class cancelorder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter pw=response.getWriter()){
			String id=request.getParameter("id");
			if(id!=null) {
				orderdao odao=new orderdao(dbcon.getConnection());
				odao.cancelOrder(Integer.parseInt(id));
			}
			response.sendRedirect("orders.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
