<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

<html>
<head>
<title>Totally Legit Game Keys - Product Information</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp" %>

<%
// Get product name to search for
// TODO: Retrieve and display info for the product
String productId = request.getParameter("id");

//"<tr><td><a href=\"addCart.jsp?id=" + rst.getInt(1) + "&name=" + rst.getString(2) + "&price=" + rst.getDouble(3) + "\">Add to Cart</a></td>
String sql = "SELECT * FROM product WHERE productId = (?)";
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
String price = "";
String name="";

try ( Connection con = DriverManager.getConnection(url, uid, pw);) 
{			
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,productId);
	ResultSet productInfo = pstmt.executeQuery();
	productInfo.next();
	out.print("<h2>"+productInfo.getString("productName")+"</h2>");
	if(productInfo.getString("productImageURL")!=null){
		out.print("<img src = " + productInfo.getString("productImageURL")+" width = 300>");
	}
	String Try = productInfo.getString("productImage");
	price = currFormat.format(productInfo.getDouble(3));
	name = productInfo.getString(2);
	if(Try!=null){
		out.print("<img src = displayImage.jsp?id=" + productInfo.getString("productId")+" width = 300>");
	}
	out.print("<div> Id: "+productId+"</div>");
	out.print("<div> Price: "+price+"</div>");
	out.print("<a href=\"addcart.jsp?id=" + productId + "&name=" +name + "&price=" + productInfo.getString(3) + "\">Add to Cart</a>");
	out.print("<br></br><a href=\"listprod.jsp\">Continue Shopping</a>");
}
catch (SQLException ex) 
{
	out.println(ex);
}

// TODO: If there is a productImageURL, display using IMG tag
		
// TODO: Retrieve any image stored directly in database. Note: Call displayImage.jsp with product id as parameter.
		
// TODO: Add links to Add to Cart and Continue Shopping
%>

</body>
</html>

