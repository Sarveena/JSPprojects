<%@page import="com.cognizant.bean.EmployeeBean"%>
<%@page import="com.cognizant.dao.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
		int Status = 0;
		Status = empDAO.update(emp);
		if (Status == 0) {
			out.println("Error while Update the data!!!");
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