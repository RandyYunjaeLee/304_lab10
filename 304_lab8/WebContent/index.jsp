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

<nav body class="navbar navbar-expand-lg navbar-light bg-light">

	<a class="navbar-brand" href="listprod.jsp">Begin Shopping</a>

	<a class="navbar-brand" href="listorder.jsp">List All Orders</a>

	<a class="navbar-brand" href="customer.jsp">Customer Info</a>

	<a class="navbar-brand" href="admin.jsp">Administrators</a>

	<a class="navbar-brand" href="login.jsp">Login</a>

	<a class="navbar-brand" href="logout.jsp">Log out</a>
</nav>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
	if(userName!=null)
		out.print("<div align = center>Signed in as: "+ userName +"</div>");
%>
</body>
</head>


