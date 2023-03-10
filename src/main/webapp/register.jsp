<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="css and js/head.jsp"%>
 <style>
        #frm {
            width: 500px;
            margin: auto;
            margin-top: 100px;
        }
        body{
        min-height: 100vh;
        }
    </style>

</head>
<body>

<%@include file="css and js/nav.jsp"%>

<%
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>

<div class="my-5">
        <form action="register" method="get" class="form card " id="frm">
            <h2 class="bg-dark text-light card-header">Sign Up</h2>
            <table class="table table-hover">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="username" required></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pass" required></td>
                </tr>
                <tr>
                    <td>Mobile</td>
                    <td ><input type="text" name="mobile" required></td>
                </tr>
                
                <tr>
                    <td>Gender</td>
                    <td> <input type="radio" name="gender" value="male">Male &nbsp;
                        <input type="radio" name="gender" value="female">Female
                    </td>
                </tr>
                <tr class="card-footer">
                    <td><button class="btn btn-outline-success" type="submit">Register</button></td>
                    <td><button class="btn btn-outline-danger" type="reset">Cancel</button></td>
                </tr>
            </table>
        </form>
    </div>
<%@ include file="css and js/footer.jsp" %>
</body>
</html>