<%@page import="java.util.ArrayList"%>
<%@page import="dao.productdao"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@page import="connection.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%

productdao pd=new productdao(dbcon.getConnection());
List<product> prod=pd.getAllProducts();

ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);

}

%>

<!DOCTYPE html>
<html>
<head>
<title>Jack and Jill </title>
<link rel="shortcut icon" type="image/x-icon" href="product-images/fav.ico">
<%@include file="css and js/head.jsp"%>
<style >
body{
min-height: 100vh;
}
</style>
</head>
<body>
	<%@include file="css and js/nav.jsp"%>
	<nav id="prods" class="navbar bg-light px-3 mb-3 justify-content-center">

<ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#pizza">Pizza</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#shakes">Shakes</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#sandwiches">Sandwiches</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="#mojito">Mojitos</a>
  </li> 
  <li class="nav-item">
    <a class="nav-link" href="#fries">Fries</a>
  </li> 
  <li class="nav-item">
    <a class="nav-link" href="#coffee">Coffee</a>
  </li> 
  <li class="nav-item">
    <a class="nav-link" href="#chinese">Chinese</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="#tea">Tea</a>
  </li>
 <li class="nav-item">
    <a class="nav-link" href="#italian">Italian</a>
  </li>
</ul>
</nav>
	<% if (auth != null) {
		request.setAttribute("auth", auth);
	} %>
	<div data-bs-spy="scroll" data-bs-target="#prods" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-light p-3 rounded-2" tabindex="0">
	<div class="container" id="allproducts">
		<div class="card-header my-3">All Products</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){%>
			
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
		}
		%>
			
		</div>
	</div>
	<div class="container" id="pizza">
		<div class="card-header my-3">PIZZA</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){
				String cat=p.getCategory();
			if(cat.equals("PIZZA")){%>
				
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
			}
		}
		%>
			
		</div>
	</div>
	<div class="container" id="shakes">
		<div class="card-header my-3">SHAKES</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){
				String cat=p.getCategory();
			if(cat.equals("SHAKES")){%>
				
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
			}
		}
		%>
			
		</div>
	</div>
	
	<div class="container" id="sandwiches">
		<div class="card-header my-3">SANDWICHES</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){
				String cat=p.getCategory();
			if(cat.equals("SANDWICHES")){%>
				
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
			}
		}
		%>
			
		</div>
	</div>
	<div class="container" id="mojito">
		<div class="card-header my-3">MOJITO</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){
				String cat=p.getCategory();
			if(cat.equals("MOJITO")){%>
				
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
			}
		}
		%>
			
		</div>
	</div>
	<div class="container" id="fries">
		<div class="card-header my-3">FRIES</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){
				String cat=p.getCategory();
			if(cat.equals("FRIES")){%>
				
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
			}
		}
		%>
			
		</div>
	</div>
	<div class="container" id="coffee">
		<div class="card-header my-3">COFFEE</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){
				String cat=p.getCategory();
			if(cat.equals("COFFEE")){%>
				
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
			}
		}
		%>
			
		</div>
	</div>
	<div class="container" id="chinese">
		<div class="card-header my-3">CHINESE</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){
				String cat=p.getCategory();
			if(cat.equals("CHINESE")){%>
				
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
			}
		}
		%>
			
		</div>
	</div>
	<div class="container" id="tea">
		<div class="card-header my-3">TEA</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){
				String cat=p.getCategory();
			if(cat.equals("TEA")){%>
				
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
			}
		}
		%>
			
		</div>
	</div>
	<div class="container" id="italian">
		<div class="card-header my-3">ITALIAN</div>
		<div class="row">
		<%
		if(!prod.isEmpty()){
			for(product p:prod){
				String cat=p.getCategory();
			if(cat.equals("ITALIAN")){%>
				
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
					<img src="products/<%=p.getImage()%>" height="300" width="300" class="card-img-top"
						alt="...">
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs.<%= p.getPrice() %> </h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a href="addtocart?id=<%= p.getId() %>" class="btn btn-dark">Add to Cart</a> <a href="order?quantity=1&id=<%= p.getId() %>"
								class="btn btn-success">Buy Now</a>
						</div>
					</div>

				</div>
			</div>
			<%}
			}
		}
		%>
			
		</div>
	</div>
	</div>
	<%@include file="css and js/footer.jsp"%>
</body>
</html>