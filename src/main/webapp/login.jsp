
<%@page import="java.util.ArrayList"%>
<%@page import="model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%


ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);

}

%>
<!DOCTYPE html>
<html>
<head>
<title>Jack and Jill -Login</title>
<%@include file="css and js/head.jsp"%>
<style >
body{
min-height: 100vh;
}
.kitty img{
	
	margin-left:250px;
}
</style>
</head>

<body class="kitty">
<%@ include file="css and js/nav.jsp" %>

<% 
if(auth!=null){
	response.sendRedirect("index.jsp");
}
%>

<img alt="jack and jill"  width="800px" src="https://kartasupermall.com/image/karamarketing/image/data/eBGuH80G1633598994.jpg">

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="login" method="post">
					<div class="form-group">
						<label>Email</label> <input class="form-control" type="email"
							name="Login-email" placeholder="Enter email" required>
					</div>
					<div class="form-group">
						<label>Password</label> <input class="form-control"
							type="password" name="Login-password"
							placeholder="Enter password" required>
					</div>
									<h5 class="">Don't have a account ? <a href="register.jsp">Sign up</a></h5>
					

					<div class="text-center my-3">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>

				</form>
			</div>

		</div>


	</div>
	<%@include file="css and js/footer.jsp"%>
</body>
</html>