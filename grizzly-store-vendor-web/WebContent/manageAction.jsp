
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Edit Profile Page</title>
</head>
<body>
	<%!static int status = 0;%>
	<%
		Class.forName("com.mysql.jdbc.Driver");

		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root",
				"root");

		Statement stmt = conn.createStatement();
		int flag = 0;
		ResultSet rs = stmt.executeQuery("select * from new");
		while (rs.next()) {
			HttpSession ses = request.getSession();
			PreparedStatement pstmt = conn.prepareStatement("update new set instock=?,buffer=? where product_id=?");
			pstmt.setInt(1, Integer.parseInt(request.getParameter("instock")));
			pstmt.setInt(2, Integer.parseInt(request.getParameter("buffer")));
			pstmt.setInt(3, Integer.parseInt(request.getParameter("product_id")));

			int status1 = 0;
			status1 = pstmt.executeUpdate();
			pstmt.close();

		}

		response.sendRedirect("inventory.jsp");

		rs.close();
		stmt.close();
		conn.close();
	%>
</body>
</html>
