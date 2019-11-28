<!DOCTYPE html>
<html>
<head>
        <title>Totally Legit Game Keys</title>
</head>
<body>
<h1 align="center">Welcome Totally Legit Game Keys</h1>

<h2 align="center"><a href="login.jsp">Login</a></h2>

<h2 align="center"><a href="listprod.jsp">Begin Shopping</a></h2>

<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>

<h2 align="center"><a href="customer.jsp">Customer Info</a></h2>

<h2 align="center"><a href="admin.jsp">Administrators</a></h2>

<h2 align="center"><a href="logout.jsp">Log out</a></h2>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
	if(userName!=null)
		out.print("<div align = center>Signed in as: "+ userName +"</div>");
%>
</body>
</head>


