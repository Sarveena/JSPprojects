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
	<center>
		<h1 style = "color:blue">Add a New Record</h1>
	</center>
	<form action="insertActionData.jsp">
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
					<td><input type="text" name="empId" required="required" placeholder="Enter your ID here" /></td>
				</tr>
				<tr>
					<td>Employee Name :</td>
					<td><input type="text" name="empName" required="required" placeholder="Enter your name here" /></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td><input type="email" name="email" required="required" /></td>
				</tr>
				<tr>
					<td>Mobile :</td>
					<td><input type="tel" name="mobile" required="required" /></td>
				</tr>
				<tr>
					<td align="center"><input type="reset" value="Clear" /></td>
					<td align="center"><input type="submit" value="Insert" /></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>