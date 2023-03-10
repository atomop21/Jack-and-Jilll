<%@page import="connection.dbcon"%>
<%@page import="dao.orderdao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<%
List<ordermod> ord=null;
if(admin!=null){
	 ord= new orderdao(dbcon.getConnection()).allorders();
	
	}%>



<div class="container">
		<div class="card-header my-3">Orders</div>

		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Orderid</th>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Userid</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Delete</th>

				</tr>
			</thead>
			<tbody>
				<%
				if (ord != null) {
					for (ordermod o : ord) {
				%>
				<tr>
					<td><%=o.getOrderid() %></td>
					<td><%=o.getDate()%></td>
					<td><%=o.getName()%></td>
					<td><%=o.getUid()%></td>
					<td><%=o.getQuantity()%></td>
					<td><%=o.getPrice()%></td>
					<td><a class="btn btn-sm btn-danger"
						href="cancelorder?id=<%= o.getOrderid() %>">Delete Order</a></td>

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