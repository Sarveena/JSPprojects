<%@page import="com.cognizant.VendorProdBean.ProductBean"%>
<%@page import="com.cognizant.VendorProdDAO.ProductDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.cognizant.VendorBean.*"%>
<%@page import="com.cognizant.VendorDAO.*"%>
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
			ProductDAO pdtDAO = new ProductDAO();
			ProductBean pdt = new ProductBean();
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

			String s1[] = { "45", "12", "15" };
			Random rand1 = new Random();
			int a1 = rand1.nextInt(3);

			int stock[] = { 10, 40, 20 };
			Random rand2 = new Random();
			int a2 = rand2.nextInt(4);

			int buff[] = { 5, 20, 40 };
			Random rand3 = new Random();
			int a3 = rand3.nextInt(5);

			String query1 = "insert into brand_new values(?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query1);
			pstmt.setInt(1, Integer.parseInt(request.getParameter("product_id")));
			pstmt.setString(2, s[a]);
			pstmt.setDouble(3, a1);
			pstmt.setInt(4, a2);
			pstmt.setInt(5, a3);

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
				response.sendRedirect("readproduct.jsp");
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>