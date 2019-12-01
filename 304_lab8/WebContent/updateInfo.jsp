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
<p>New City</p>
<input type="text" name="city" size="50">
<p>State/Province</p>
<input type="text" name="state" size="50">
<p>Country</p>
<input type="text" name="country" size="50">
<p>Postal Code</p>
<input type="text" name="postal" size="50">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%
	String userName = request.getParameter("id");
	String userName1 = (String) session.getAttribute("authenticatedUser");
%>

<%
String sql = "";
String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rlopez;";
String uid = "rlopez";
String pw = "31148588";
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}
if(request.getParameter("password")!=null)
try{
	sql = "UPDATE customer SET password = ? WHERE userId = ?";
	Connection con = DriverManager.getConnection(url, uid, pw);
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1, request.getParameter("password"));
	stmt.setString(2, userName1);
	stmt.execute();
	sql = "SELECT password FROM customer WHERE userId = ?";
	stmt = con.prepareStatement(sql);
	stmt.setString(1, userName1);
	ResultSet r = stmt.executeQuery();
	r.next();
	out.print(r.getString("password"));
}
catch (SQLException ex) {
	out.println(ex);
}

if(request.getParameter("address")!=null&&request.getParameter("city")!=null&&request.getParameter("country")!=null&&request.getParameter("state")!=null&&request.getParameter("postal")!=null)
try{
	sql = "UPDATE customer SET address = ?, city = ?, country = ?, state = ?, postalCode = ? WHERE userId = ?";
	Connection con = DriverManager.getConnection(url, uid, pw);
	PreparedStatement stmt = con.prepareStatement(sql);
	stmt.setString(1, request.getParameter("address"));
	stmt.setString(2, request.getParameter("city"));
	stmt.setString(3, request.getParameter("country"));
	stmt.setString(4, request.getParameter("state"));
	stmt.setString(5, request.getParameter("postal"));
	stmt.setString(6, userName1);
	stmt.execute();
	out.print("<br></br><a href=\"index.jsp\">Home</a>");
}
catch (SQLException ex) {
	out.println(ex);
}
%>
</body>
</html>