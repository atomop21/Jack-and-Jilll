<%@page import="model.*"%>
<%
user auth = (user) request.getSession().getAttribute("auth");
user admin=(user) request.getSession().getAttribute("admin");
%>


<nav class="navbar navbar-expand-lg bg-info ">
  <div class="container-fluid ">
    <a class="navbar-brand" href="index.jsp"> <span ><img alt="" src="product-images/jackicon.png"></span></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="nav justify-content-end navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="cart.jsp">Cart<span class="badge text-bg-success px-1">${ cart_list.size() }</span></a>
        </li>
        
       <%
		if(admin != null){%>
			 <li class="nav-item">
         <a class="nav-link text-light" href="products.jsp">Products</a>
       </li>
        <li class="nav-item">
         <a class="nav-link text-light" href="allorders.jsp">All Orders</a>
       </li>
        <li class="nav-item">
         <a class="nav-link text-danger" href="logout">Logout</a>
       </li>
		<%}

		else if(auth != null){%>
    	   <li class="nav-item">
           <a class="nav-link text-light" href="orders.jsp">Orders</a>
         </li>
         <li class="nav-item">
         <a class="nav-link text-danger" href="logout">Logout</a>
       </li>
    	   
       <%}else{%>
    	   <li class="nav-item">
           <a class="nav-link text-light" href="login.jsp">Login</a>
         </li>
          
       
      <% }
       %>
       
       
        
      </ul>
    
    </div>
  </div>
</nav>
