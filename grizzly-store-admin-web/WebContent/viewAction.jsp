<%@page import="com.cognizant.bean.ProfileBean"%>
<%@page import="com.cognizant.dao.ProfileDAO"%>
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
	<%
		try {
			ProfileDAO profileDAO = new ProfileDAO();
			
			ProfileBean pdt = new ProfileBean();

			pdt.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
			pdt.setProduct_category(request.getParameter("product_category"));
			pdt.setProduct_name(request.getParameter("product_name"));
			pdt.setProduct_desc(request.getParameter("product_desc"));
			pdt.setProduct_price(Integer.parseInt(request.getParameter("product_price")));

			int Status = 0;
			Status = profileDAO.update(pdt);
			out.println("gkjf");
			//out.println(Status);
// 			if (Status == 0) {
// 				out.println("Error while update the data");
// 			} else {
				response.sendRedirect("viewpage.jsp");
		//	}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>

</body>
</html>