
<%@page import="java.text.DecimalFormat"%>
<%@page import="connection.dbcon"%>
<%@page import="dao.productdao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%



ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
List<cart> cartprod = null;
if (cart_list != null) {
	productdao pdao = new productdao(dbcon.getConnection());
	cartprod = pdao.getCartProducts(cart_list);
	double total=pdao.getTotalPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);

}
%>
<!DOCTYPE html>
<html>
<head>
<title>Jack and Jill -Cart</title>
<%@include file="css and js/head.jsp"%>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
body{
min-height: 100vh;
}
</style>
</head>
<body>
	<%@include file="css and js/nav.jsp" %>
	<% if (auth != null) {
		request.setAttribute("person", auth);
	} %>

	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price: ${ (total>0)?total:0 }</h3>
			<a class="mx-3 btn btn-success" href="checkout">Check out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>

				</tr>
			</thead>
			<tbody>
			<% if(cart_list!= null){
				for(cart c:cartprod){%>
					<tr>
					<td><%= c.getName() %></td>
					<td><%= c.getCategory() %></td>
					<td><%= c.getPrice() %></td>
					<td>
						<form action="order" method="post" class="form-inline">
							<input type="hidden" name="id" value=<%= c.getId() %> class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-decre" href="incdec?action=dec&id=<%= c.getId()%>"><i
									class="fas fa-minus-square"></i></a> <input type="text"
									 name="quantity" class="form-control w-50"
									value="<%= c.getQuantity() %>" readonly> <a class="btn btn-sm btn-incre"
									href="incdec?action=inc&id=<%= c.getId()%>"><i class="fas fa-plus-square"></i></a>
									<button type="submit" class="btn btn-success btn-sm">Buy</button>

							</div>
							
						</form>
					</td>

					<td><a class="btn btn-sm btn-danger" href="remove?id=<%= c.getId() %>">Remove</a></td>
				</tr>
				<% }
			
			}
				
				
				%>
			
				
			</tbody>
		</table>
	</div>

	<%@include file="css and js/footer.jsp"%>
</body>
</html>