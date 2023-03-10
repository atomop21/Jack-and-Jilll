package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.dbcon;
import dao.userdao;
import model.user;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter pw=response.getWriter()){
			String email=request.getParameter("Login-email");
			String pass=request.getParameter("Login-password");
			if(email.equals("admin@gmail.com")&& pass.equals("localhost")) {
				userdao ud=new userdao(dbcon.getConnection());
				user us= ud.userlogin(email, pass);
				request.getSession().setAttribute("admin", us);
			}
			
			userdao ud=new userdao(dbcon.getConnection());
			user us= ud.userlogin(email, pass);
			if(us!=null) {
				request.getSession().setAttribute("auth", us);
				response.sendRedirect("index.jsp");
			}else {
				pw.print("login failed");
			}
		}
	}

}
