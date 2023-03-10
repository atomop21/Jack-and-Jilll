package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.dbcon;
import dao.productdao;


@WebServlet("/deleteproduct")
public class deleteproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("test/html;charset=UTF-8");
		try(PrintWriter pw=response.getWriter()){
			 String id=request.getParameter("id");
			 if(id!=null) {
				 productdao pdao=new productdao(dbcon.getConnection());
				 pdao.deleteprod(Integer.parseInt(id));
			 }
			 response.sendRedirect("products.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
