<%@page import="com.cognizant.VendorProdDAO.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Page</title>
</head>
<body>
	<%
	   ProductDAO pdtDAO = new ProductDAO();
		int status = 0;
		status = pdtDAO.delete(Integer.parseInt(request.getParameter("product_id")));
		
		if (status == 0) {
			out.println("Error");
		} else {
			response.sendRedirect("readproduct.jsp");
		}
	%>

</body>
</html>