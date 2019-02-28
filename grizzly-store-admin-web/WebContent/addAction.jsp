<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.cognizant.bean.ProfileBean"%>
<%@page import="com.cognizant.dao.ProfileDAO"%>
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
<title>Insert Page</title>
</head>
<body>
	<%
		try {

			HttpSession ses = request.getSession();
			ProfileDAO pdtDAO = new ProfileDAO();
			ProfileBean pdt = new ProfileBean();
			pdt.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
			pdt.setProduct_category(request.getParameter("product_category"));
			pdt.setProduct_name(request.getParameter("product_name"));
			pdt.setProduct_desc(request.getParameter("product_desc"));
			pdt.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
			pdt.setAdmin_name(ses.getAttribute("username").toString());
			int insertStatus = 0;
			insertStatus = pdtDAO.insert(pdt);

			Connection conn = null;
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/test";
			conn = DriverManager.getConnection(url, "root", "root");

			String s[] = { "Philips", "Apple", "Copic" };
			Random rand = new Random();
			int a = rand.nextInt(3);

			String s1[] = { "4.6", "4.7", "4.0" };
			Random rand1 = new Random();
			int a1 = rand1.nextInt(3);

			String query1 = "insert into brand values(?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query1);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("product_id")));
			pstmt.setString(2, s[a]);
			pstmt.setDouble(3, a1);

			int insertStatus1 = 0;
			insertStatus = pstmt.executeUpdate();

// 			String query2 = "insert into rating values(?,?,?)";
// 			PreparedStatement pstmt1 = conn.prepareStatement("product_id");
// 			pstmt1.setString(1, ses.getAttribute("id").toString());
// 			pstmt1.setInt(2, Integer.parseInt(request.getParameter("product_id")));
// 			pstmt1.setDouble(3, a1);

// 			int insertStatus2 = 0;
// 			insertStatus2 = pstmt1.executeUpdate();

			if (insertStatus == 0) {
				out.println("Error while Inserting the data!!!");
			} else {
				response.sendRedirect("productclick.jsp");
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>