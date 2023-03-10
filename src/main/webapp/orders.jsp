
<%@page import="java.util.List"%>
<%@page import="connection.dbcon"%>
<%@page import="dao.orderdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
List<ordermod> ord = null;


ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);

}
%>
<!DOCTYPE html>
<html>
<head>
<title>Jack and Jill -Orders</title>
<%@include file="css and js/head.jsp"%>
<style >
body{
min-height: 100vh;
}
</style>
</head>
<body>
	<%@include file="css and js/nav.jsp"%>
	<% if (auth != null) {
		request.setAttribute("person", auth);
		ord = new orderdao(dbcon.getConnection()).userorders(auth.getId());
	} else {
		response.sendRedirect("login.jsp");
	} %>

	<div class="container">
		<div class="card-header my-3">Orders</div>

		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>

				</tr>
			</thead>
			<tbody>
				<%
				if (ord != null) {
					for (ordermod o : ord) {
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><%=o.getName()%></td>
					<td><%=o.getCategory()%></td>
					<td><%=o.getQuantity()%></td>
					<td><%=o.getPrice()%></td>
					<td><a class="btn btn-sm btn-danger"
						href="cancelorder?id=<%= o.getOrderid() %>">Cancel Order</a></td>

				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>

	<%@include file="css and js/footer.jsp"%>
</body>
</html>