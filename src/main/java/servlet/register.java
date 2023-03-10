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


@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter pw= response.getWriter()){
			String name=request.getParameter("username");
			String email=request.getParameter("email");
			String password=request.getParameter("pass");
			String mob=request.getParameter("mobile");
			String gender=request.getParameter("gender");
			
			
			userdao udao=new userdao(dbcon.getConnection());
			user us=new user();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			us.setMobile(mob);
			us.setGender(gender);
			boolean res=udao.register(us);
			
			
			request.getSession().setAttribute("auth", us);
			response.sendRedirect("index.jsp");
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
