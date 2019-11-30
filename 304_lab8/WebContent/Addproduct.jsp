<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
if(!request.getParameter("product name").equals("")||request.getParameter("product name")!=null)
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
%>
</body>
</html>