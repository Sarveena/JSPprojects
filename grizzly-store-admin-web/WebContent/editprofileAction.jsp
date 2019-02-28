<%@page import="com.cognizant.bean.PracticeBean"%>
<%@page import="com.cognizant.dao.PracticeDAO"%>
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
			PracticeDAO profileDAO = new PracticeDAO();
			PracticeBean profile = new PracticeBean();

			profile.setName(request.getParameter("admin_name"));
			profile.setId(Integer.parseInt(request.getParameter("admin_id")));
			profile.setDesignation(request.getParameter("admin_desig"));
			profile.setOffice(request.getParameter("admin_office"));

			int Status = 0;
			Status = profileDAO.update(profile);
			//out.println(Status);
// 			if (Status == 0) {
// 				out.println("Error while update the data");
// 			} else {
				response.sendRedirect("readprofile.jsp");
		//	}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>

</body>
</html>