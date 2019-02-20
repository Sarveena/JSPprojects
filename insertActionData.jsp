<%@page import="com.cognizant.bean.EmployeeBean"%>
<%@page import="com.cognizant.dao.EmployeeDAO"%>
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
	try{
		
		EmployeeDAO empDAO = new EmployeeDAO();
		EmployeeBean emp = new EmployeeBean();
		emp.setEmpId(Integer.parseInt(request.getParameter("empId")));
		emp.setEmpName(request.getParameter("empName"));
		emp.setEmail(request.getParameter("email"));
		emp.setMobile(Long.parseLong(request.getParameter("mobile")));
		int insertStatus = 0;
		insertStatus = empDAO.insert(emp);
		if (insertStatus == 0) {
			out.println("Error while Inserting the data!!!");
		} else {
			response.sendRedirect("readData.jsp");
		}
	}
	catch (Exception e)
	{
		out.println(e.getMessage());
	}
	%>
</body>
</html>