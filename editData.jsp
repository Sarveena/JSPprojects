<%@page import="com.cognizant.bean.EmployeeBean"%>
<%@page import="com.cognizant.dao.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Edit Page</title>
</head>
<body>
	<center>
		<h1 style="color: blue">Edit a Record</h1>
	</center>
	<form action="editActionData.jsp">
		<%
			EmployeeDAO empDAO = new EmployeeDAO();
			EmployeeBean emp = empDAO.read(Integer.parseInt(request.getParameter("emp_id")));
		%>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Column Name</th>
					<th scope="col">Value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Employee ID :</td>
					<td><input type="text" name="empId"
						value="<%=emp.getEmpId()%>" /></td>
				</tr>
				<tr>
					<td>Employee Name :</td>
					<td><input type="text" name="empName"
						value="<%=emp.getEmpName()%>" /></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td><input type="email" name="email"
						value="<%=emp.getEmail()%>" /></td>
				</tr>
				<tr>
					<td>Mobile :</td>
					<td><input type="tel" name="mobile"
						value="<%=emp.getMobile()%>" /></td>
				</tr>
				<tr>
					<td align="center"><input type="reset" value="Clear" /></td>
					<td align="center"><input type="submit" value="Update" /></td>
				</tr>
			</tbody>
		</table>
	</form>

</body>
</html>