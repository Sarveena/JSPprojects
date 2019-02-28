<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cognizant.bean.PracticeBean"%>
<%@page import="com.cognizant.dao.PracticeDAO"%>
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
	<form action="editprofileAction.jsp">
		<%
			HttpSession ses = request.getSession();
			int count = 0;
			try {
				PracticeDAO profileDAO = new PracticeDAO();
				PracticeBean profile = profileDAO.read(request.getParameter("admin_name"));
				List<PracticeBean> profileList = new ArrayList<PracticeBean>();
				profileList = profileDAO.readAll();
		%>
		<%
		    	String newVal1 = "";
				String newVal2 = "";
				String newVal3 = "";
				String newVal4 = "";
				Connection conn = null;
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/test";
				conn = DriverManager.getConnection(url, "root", "root");
				Statement stmt = conn.createStatement();
				ResultSet rs = null;
				//	out.println(ses.getAttribute("username"));
				rs = stmt.executeQuery(
						"select admin_name,admin_id,admin_desig,admin_office from grizzly, profile where grizzly.username=profile.admin_name and profile.admin_name='"
								+ ses.getAttribute("username") + "'");

				while (rs.next()) {
					newVal1 = rs.getString(1);
					newVal2 = rs.getString(2);
					newVal3 = rs.getString(3);
					newVal4 = rs.getString(4);
				}
		%>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Column Name</th>
					<th scope="col">Value</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (PracticeBean profile1 : profileList) {
							count++;
				%>
				<tr>
					<td>Admin ID :</td>
					<td><input type="number" name="admin_id"
						value="<%=newVal2%>" /></td>
				</tr>
				<tr>
					<td>Admin Name :</td>
					<td><input type="text" name="admin_name"
						value="<%=newVal1%>" /></td>
				</tr>
				<tr>
					<td>Admin Designation :</td>
					<td><input type="text" name="admin_desig"
						value="<%=newVal3%>" /></td>
				</tr>
				<tr>
					<td>Admin Office:</td>
					<td><input type="text" name="admin_office"
						value="<%=newVal4%>" /></td>
				</tr>
				<tr>
					<td align="center"><input type="reset" value="Clear" /></td>
					<td align="center"><input type="submit" value="Update" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<%
		if (count == 1) {
					break;
				}
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>