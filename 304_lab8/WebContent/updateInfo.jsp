<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change your information</title>
</head>
<body>
<form method="get" action="updateInfo.jsp">
<p>New Password</p>
<input type="text" name="password" size="50">
<p>New Address</p>
<input type="text" name="address" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>

<%
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

}
catch (SQLException ex) {
	out.println(ex);
}
%>
</body>
</html>