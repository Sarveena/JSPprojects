<%@page import="com.cognizant.VendorBean.*"%>
<%@page import="com.cognizant.VendorDAO.*"%>
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
			VendorDAO profileDAO = new VendorDAO();
			
			VendorBean pdt = new VendorBean();

			pdt.setVendor_id(Integer.parseInt(request.getParameter("vendor_id")));
			pdt.setVendor_name(request.getParameter("vendor_name"));
			pdt.setVendor_rating(Integer.parseInt(request.getParameter("vendor_rating")));
			pdt.setVendor_contact(Integer.parseInt(request.getParameter("vendor_contact")));
			pdt.setVendor_adrs(request.getParameter("vendor_adrs"));

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