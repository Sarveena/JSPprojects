<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cognizant.VendorBean.*"%>
<%@page import="com.cognizant.VendorDAO.*"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
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
	<form action="manageAction.jsp">
		<%
			HttpSession ses = request.getSession();
			
		%>
		<%
			int newVal1 = 0;
				int newVal2 = 0;
				int newVal3 = 0;
				int newVal4 = 0;
				Connection conn = null;
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/test";
				conn = DriverManager.getConnection(url, "root", "root");
				Statement stmt = conn.createStatement();
				ResultSet rs = null;
				//	out.println(ses.getAttribute("username"));
				int nn = Integer.parseInt(request.getParameter("product_id"));
				rs = stmt.executeQuery(
						"select product.product_id,new.buffer,new.instock,new.pending from product,brand,vendor_profile,new where product.product_id=brand.product_id and vendor_profile.vendor_name=product.admin_name  and product.admin_name='"
								+ ses.getAttribute("username").toString() + "' and product.product_id=" + nn);

				if (rs.next()) {
					newVal1 = rs.getInt(1);
					newVal2 = rs.getInt(2);
					newVal3 = rs.getInt(3);
					// 					newVal4 = rs.getString(4);
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
					<td>Proct ID :</td>
					<td><input type="number" name="product_id" value="<%=nn%>" /></td>
				</tr>
				<tr>
					<td>Buffer :</td>
					<td><input type="text" name="buffer" value="<%=newVal2%>" /></td>
				</tr>
				<tr>
					<td>In stock:</td>
					<td><input type="text" name="instock" value="<%=newVal3%>" /></td>
				</tr>
				<tr>
					<td align="center"><input type="reset" value="Clear" /></td>
					<td align="center"><input type="submit" value="Update" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<%			// 		if (count == 1) {
				// 					break;
				// 				}
				}
		
	%>
</body>
</html>