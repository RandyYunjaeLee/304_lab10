<!DOCTYPE html>
<html>
<head>
<title>Customer Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>

<%

// TODO: Print Customer information
String sql = "SELECT * FROM customer WHERE userid = ?";
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rlopez;";
String uid = "rlopez";
String pw = "31148588";
System.out.println(sql);
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

try{
	Connection con = DriverManager.getConnection(url, uid, pw);
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1, userName);
	ResultSet rst = stmt.executeQuery();
	rst.next();
	out.print("<h3>Customer Profile</h3>"
			+"<table border=1>"+
			"<tr><th>Id</th><td>"+rst.getString("customerId")+"</td></tr>"+
			"<tr><th>First Name</th><td>"+rst.getString("firstName")+"</td></tr>"+
			"<tr><th>Last Name</th><td>"+rst.getString("lastName")+"</td></tr>"+
			"<tr><th>Email</th><td>"+rst.getString("email")+"</td></tr>"+
			"<tr><th>Phone</th><td>"+rst.getString("phonenum")+"</td></tr>"+
			"<tr><th>Address</th><td>"+rst.getString("address")+"</td></tr>"+
			"<tr><th>City</th><td>"+rst.getString("city")+"</td></tr>"+
			"<tr><th>State</th><td>"+rst.getString("state")+"</td></tr>"+
			"<tr><th>Postal Code</th><td>"+rst.getString("postalCode")+"</td></tr>"+
			"<tr><th>Country</th><td>"+rst.getString("country")+"</td></tr>"+
			"<tr><th>User id</th><td>"+rst.getString("userid")+"</td></tr>"+
			"</table>");
	out.print("<div><a href = updatInfo.jsp?= + rst.getString(customerId)>update your information</a></div>");
	con.close();
}
catch (SQLException ex) {
	out.println(ex);
}
// Make sure to close connection
%>

</body>
</html>

