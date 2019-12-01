<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import = "java.awt.image.BufferedImage"%>
<%@page import = "java.io.ByteArrayInputStream"%>
<%@page import= "java.io.ByteArrayOutputStream"%>
<%@page import= "java.io.File"%>
<%@page import= "java.sql.*"%>
<%@page import= "java.util.Scanner"%>
<%@page import= "javax.imageio.ImageIO"%>
<%


/**
 * Loads the order database using code.
 */
	
		String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_rlopez;";
		String uid = "rlopez";
		String pw = "31148588";
		
		out.println("Connecting to database.");
		String fileName = "orderdb_sql.ddl";
		out.print(fileName);
		Connection con = DriverManager.getConnection(url, uid, pw);
				

	    try
	    {
	        // Create statement
	        Statement stmt = con.createStatement();
	        
	        Scanner scanner = new Scanner(new File(fileName));
	        // Read commands separated by ;
	        scanner.useDelimiter(";");
	        while (scanner.hasNext())
	        {
	            String command = scanner.next();
	            if (command.trim().equals(""))
	                continue;
	            out.println(command);        // Uncomment if want to see commands executed
	            try
	            {
	            	stmt.execute(command);
	            }
	            catch (Exception e)
	            {	// Keep running on exception.  This is mostly for DROP TABLE if table does not exist.
	            	 out.println(e);
	            }
	        }	 
	        try
            {
	        	BufferedImage image = ImageIO.read(new File("WebContent/img/download.jpg"));
	        	ByteArrayOutputStream b = new ByteArrayOutputStream();
	        	ImageIO.write(image, "png", b);
	        	b.flush();
	        	byte[] byteImage = b.toByteArray();
	        	b.close();
	        	PreparedStatement pstmt = con.prepareStatement("UPDATE Product SET productImage = ? WHERE ProductId = 6;");
	        	ByteArrayInputStream bais = new ByteArrayInputStream(byteImage);
	        	pstmt.setBinaryStream(1, bais, byteImage.length);
	        	pstmt.executeUpdate();
	        	image = ImageIO.read(new File("WebContent/img/wow.png"));
	        	b = new ByteArrayOutputStream();
	        	ImageIO.write(image, "png", b);
	        	b.flush();
	        	byteImage = b.toByteArray();
	        	b.close();
	        	pstmt = con.prepareStatement("UPDATE Product SET productImage = ? WHERE ProductId = 8;");
	        	bais = new ByteArrayInputStream(byteImage);
	        	pstmt.setBinaryStream(1, bais, byteImage.length);
	        	pstmt.executeUpdate();
	        	pstmt.close();
            }
            catch (Exception e)
            {	// Keep running on exception.  This is mostly for DROP TABLE if table does not exist.
            	 out.println(e);
            }

	        scanner.close();
	        
	         out.println("Database loaded.");
	    }
	    catch (Exception e)
	    {
	         out.println(e);
	    }   
%>
</body>
</html>