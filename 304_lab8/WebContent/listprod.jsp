<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
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

<h1>Search for the products you want to buy:</h1>

<form method="get" action="listprod.jsp">
<div class="input-group-prepend">
    <button class="btn btn-outline-secondary" type="button" id="button-addon1">Button</button>
    <input type="submit" value="Submit"><input type="reset" value="Reset">
</div>
<input type="text" name="productName" size="50">
</form>

<h3>Select a genre</h3>
<form action = "listprod.jsp">
<select name = "genre">
	<option value="all">All</option>
	<option value="1">Battle Royale</option>
	<option value="2">Action-Adventure</option>
	<option value="3">Adventure</option>
	<option value="4">Role-Playing</option>
	<option value="5">Simulation</option>
  	<option value="6">Strategy</option>
  	<option value="7">Sports</option>
  	<option value="8">Massive Multiplayer Online</option>
</select>
<input type="submit" value="Submit">
</form>


<%
	// Get product name to search for
	String name = request.getParameter("productName");
	boolean hasParameter = false, genre = false;
	String sql = "";

	if (name == null)
		name = "";

	if (name.equals("")) 
	{
		
		if(request.getParameter("genre")==null ||request.getParameter("genre").equals("all")){
			out.println("<h2>All Products</h2>");
			sql = "SELECT productId, productName, productPrice, productImageUrl, productImage FROM Product";
		}
		else{
			sql ="SELECT productId, productName, productPrice, productImageUrl, productImage FROM Product WHERE categoryId = ?";
			genre = true;
		}

	} 
	else 
	{
		out.println("<h2>Products containing '" + name + "'</h2>");
		hasParameter = true;
		if(request.getParameter("genre")==null ||request.getParameter("genre").equals("all"))
			sql = "SELECT productId, productName, productPrice, productImageUrl, productImage FROM Product WHERE productName LIKE ?";
		else{
			sql = "SELECT productId, productName, productPrice, productImageUrl, productImage FROM Product WHERE productName LIKE ? && categoryId = ?";
			genre = true;
		}
name = '%' + name + '%';
	}
	
	String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rlopez;";
	String uid = "rlopez";
	String pw = "31148588";
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();

	try
	{	// Load driver class
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	}
	catch (java.lang.ClassNotFoundException e)
	{
		out.println("ClassNotFoundException: " +e);
	}

	try ( Connection con = DriverManager.getConnection(url, uid, pw);) 
	{			
		PreparedStatement pstmt = con.prepareStatement(sql);
		if (hasParameter)
			pstmt.setString(1, name);
		if(genre)
			if(hasParameter)
				pstmt.setString(2,request.getParameter("genre"));
			else
				pstmt.setString(1,request.getParameter("genre"));
		ResultSet rst = pstmt.executeQuery();
		out.println("<table><tr><th>Product Id</th><th></th><th></th><th>Product Name</th><th>Price</th></tr>");
		while (rst.next()) 
		{
			out.print("<tr><td>"+rst.getInt(1)+"</td><td>");
			if(rst.getString("productImageURL")!=null)
				out.print("<img src = " + rst.getString("productImageURL")+" width = 300>");
			String Try = rst.getString("productImage");
			name = rst.getString(2);
			if(Try!=null)
				out.print("<img src = displayImage.jsp?id=" + rst.getString("productId")+" width = 300>");
			out.print("</td><td><a href=\"addcart.jsp?id=" + rst.getInt(1) + "&name=" + rst.getString(2)
					+ "&price=" + rst.getDouble(3) + "\">Add to Cart</a></td>");
			if(rst.getDouble(3)<=0){
				out.println("<td><a href=product.jsp?id=" + rst.getInt(1) + ">" + rst.getString(2) + "</a></td>" + "<td>Free</td></tr>");
			}else{
				out.println("<td><a href=product.jsp?id=" + rst.getInt(1) + ">" + rst.getString(2) + "</a></td>" + "<td>" + currFormat.format(rst.getDouble(3))
				+ "</td></tr>");
			}
		}
		out.println("</table>");
	} 
	catch (Exception ex) 
	{
		out.println(ex);
	} 	
%>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>