<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="bootstrap.min.css">
	<link rel="stylesheet" href="custom.css">

        <title>Totally Legit Game Keys</title>
</head>
<body>
<h1 align="center">Welcome to Totally Legit Game Keys</h1>

<nav body align="right" class="navbar navbar-expand-lg navbar-light bg-light">

	<a class="navbar-brand" href="customer.jsp">Customer Info</a>

	<a class="navbar-brand" href="admin.jsp">Administrators</a>

	<a class="navbar-brand" href="login.jsp">Login</a>

	<a class="navbar-brand" href="logout.jsp">Log out</a>
</nav>

<h2 align="center"><a href="listprod.jsp">Begin Shopping</a></h2>

<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>
<%
	String userName = (String) session.getAttribute("authenticatedUser");
	if(userName!=null)
		out.print("<div align = center>Signed in as: "+ userName +"</div>");
%>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</head>


