<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
</head>
<body>

<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%
String sql = "SELECT orderDate, totalAmount FROM ordersummary ORDER BY orderDate DESC" ;
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
	HashMap<String, Double> amountList = new HashMap<String, Double>();
	ArrayList<String> dateList = new ArrayList<String>();
	PreparedStatement stmt = con.prepareStatement(sql);
	ResultSet rst = stmt.executeQuery();
	out.print("<table border=\"1\"><tr><th>Order Date</th><th>Total Order Amount</th></tr>");
	while (rst.next()){
		if(!amountList.containsKey(rst.getString("orderDate").split(" ")[0])){
			amountList.put(rst.getString("orderDate").split(" ")[0], Double.parseDouble(rst.getString("totalAmount")));
		}
		else{
			amountList.put(rst.getString("orderDate").split(" ")[0], amountList.get(rst.getString("orderDate").split(" ")[0])+Double.parseDouble(rst.getString("totalAmount")));
		}
		if(!dateList.contains(rst.getString("orderDate").split(" ")[0])){
			dateList.add(rst.getString("orderDate").split(" ")[0]);
		}
	}
	Iterator<String> dateIt = dateList.iterator();
	while(dateIt.hasNext()){
		String current = dateIt.next();
		out.print("<tr><td>"+current+"</td><td>"+ currFormat.format(amountList.get(current))+"</td></tr>");
		
	}
	out.println("</table>");
	con.close();
}
catch (SQLException ex) {
	out.println(ex);
}
%>
<form method="get" action="admin.jsp">
<p>Product Name</p>
<input type="text" name="product name" size="50">
<p>Product Price</p>
<input type="text" name="product price" size="50">
<p>Category Id</p>
<input type="text" name="category id" size="50">
<p>Product Description</p>
<input type="text" name="product description" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> 
</form>
<%if(request.getParameter("product name")!=null)
	try ( Connection con = DriverManager.getConnection(url, uid, pw);)
	{
		sql = "INSERT INTO product (productName, productPrice, productDesc, categoryId) VALUES (?,?,?,?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1,request.getParameter("product name"));
		stmt.setString(2,request.getParameter("product price"));
		stmt.setString(4,request.getParameter("category id"));
		stmt.setString(3,request.getParameter("product description"));
		stmt.execute();
		out.print("Product Added");
	}
	catch (SQLException ex) {
		out.println(ex);
	}
out.print("<br></br><a href=\"index.jsp\">Home</a>");
out.print("<br></br><a href=\"LoadData.jsp\">Reset</a>");
%>
</body>
</html>

