<%@page import="connection.dbcon"%>
<%@page import="dao.productdao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
<%
List<product> prd=null;
prd= new productdao(dbcon.getConnection()).getAllProducts();
%>


<div class="container">
		<div class="card-header my-3">Orders</div>

		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Category</th>
					<th scope="col">Name</th>
					<th scope="col">Price</th>
					<th scope="col">Delete</th>

				</tr>
			</thead>
			<tbody>
				<%
				if (prd != null) {
					for (product p : prd) {
				%>
				<tr>
					<td><%=p.getId()%></td>
					<td><%=p.getCategory()%></td>
					<td><%=p.getName()%></td>
					<td><%=p.getPrice()%></td>
					<td><a class="btn btn-sm btn-danger"
						href="deleteproduct?id=<%= p.getId() %>">Delete Product</a></td>

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