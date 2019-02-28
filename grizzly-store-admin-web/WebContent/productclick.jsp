<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cognizant.bean.PracticeBean"%>
<%@page import="com.cognizant.dao.PracticeDAO"%>
<html>
<article>

	<head>
<title>Admin - List Products</title>
<link rel="stylesheet" type="text/css" href="styles/loginstyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
	</head>
</article>

<body>
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
			//out.println(newVal1);
	%>
	<div class="p-3 mb-2 bg-light text-dark" style="font-size: 20px">
		GRIZZLY<img src="images/pic1.jpg" alt="logo" width="80px"
			height="60px"> STORE &nbsp;&emsp;&emsp;&emsp;&emsp; &nbsp;
		&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
			type="search"
			placeholder="  Search                                      &#xf002 "
			class="fa fa-search rounded-pill x" role="button">
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<a class="btn1"><i class="fa fa-bell" role="button" id="a"></i></a>
		Welcome Admin
		<%=newVal1%>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<form method="get" action="login.html" style="display: inline">
			<button type="submit" class="btn btn-secondary" id="a2">logout</button>
		</form>
		</pre>
	</div>
	<div class="a3">
		<h5 class="a4">
			PROFILE &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a
				href="editProfile.jsp">Edit</a>
		</h5>

		<div class="text-center">
			<img src="images/profile.png" alt="Image no found" width="160px"
				height="160px">
		</div>
		</br>
		<%
			for (PracticeBean profile1 : profileList) {
					count++;
		%>
		<h6 align="center" style="font-family: Georgia"><%=newVal1%></h6>
		<h6 align="center" style="font-family: Georgia">ID</h6>
		<h6 align="center" style="font-family: Georgia"><%=newVal2%></h6>
		<h6 align="center" style="font-family: Georgia">Designation</h6>
		<h6 align="center" style="font-family: Georgia"><%=newVal3%></h6>
		<h6 align="center" style="font-family: Georgia">Office</h6>
		<h6 align="center" style="font-family: Georgia"><%=newVal4%></h6>
	</div>
	<div class="col1">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 " id="a10">
					<form action="readprofile.jsp" method="get">
						<button type="submit" class="btn btn-tertiary btn-lg btn-block"
							id="x2"
							style="background-color: darkgray; color: black; box-shadow: 0px 10px gray">
							<h2>PRODUCTS</h2>
					</form>
					</button>
				</div>
				<div class="col-sm-6 col-md-4" id="c1">
					<button type="submit" class="btn btn-tertiary btn-lg btn-block"
						id="x2" style="background-color: lightgray; color: black">
						<h2>VENDORS</h2>
					</button>
				</div>
				<!--
<div class="col-sm-6 col-md-4" id="c1">
 <button type="submit" class="btn btn-tertiary btn-lg btn-block" style="background-color:#eee">
 </div>-->

				<div class="btn btn-tertiary col-sm-6 col-md-4" id="x2"
					style="background-color: #eee; margin-right: -30px; height: 65px; margin-left: -15px; margin-bottom: -10px">

					<h2></h2>
				</div>
			</div>
		</div>
		</br>
		<div class="row top-buffer">

			<div class="dropdown">
				<button class="btn btn-light dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">Choose Action</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">Product List</a> <a
						class="dropdown-item" href="#">Brand</a> <a class="dropdown-item"
						href="#">Category</a> <a class="dropdown-item" href="#">Rating</a>

				</div>

				&emsp;&emsp; <input type="search"
					placeholder="  Category Name                                   &#xf002 "
					class="fa fa-search rounded-pill x" role="button">
				&emsp;&emsp;

				<button class="btn btn-light dropdown-toggle" type="button"
					id="dropdownMenuButton2" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">Sort by</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">Product List</a> <a
						class="dropdown-item" href="#">Brand</a> <a class="dropdown-item"
						href="#">Category</a> <a class="dropdown-item" href="#">Rating</a>

				</div>

				<button type="button" class="btn btn-secondary" id="a8">Add
					Product</button>

				<div class="table-wrapper-scroll-y">
					<table class="table table-bordered" id="a9">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">Product List</th>
								<th scope="col">Brand</th>
								<th scope="col">Category</th>
								<th scope="col">Rating</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<%
							String val1 = "";
									String val2 = "";
									String val3 = "";
									int val4 = 0;
										int val5 = 0;
									Statement stmt1 = conn.createStatement();
									ResultSet rs1 = null;
									//	out.println(ses.getAttribute("username"));
									//String q = "select "
									rs1 = stmt.executeQuery(
											"select product.product_name,brand.brand_name,product.product_category, brand.rating,product.product_id from product,brand,profile where product.product_id=brand.product_id and  profile.admin_name=product.admin_name and product.admin_name='"
													+ ses.getAttribute("username").toString() + "'");
								//	out.println(ses.getAttribute("username").toString()+"lkhjjjjjjjjjjjjjjjjjjj");
									while (rs1.next()) {
										val1 = rs1.getString(1);
										val2 = rs1.getString(2);
										val3 = rs1.getString(3);
										val4 = rs1.getInt(4);
											val5 = rs1.getInt(5);
						%>
						<tbody>
							<tr>
								<th scope="row">
									<div class="round">
										<input type="checkbox" id="checkbox" /> <label for="checkbox"></label>
									</div>
									</div>
								</th>
								<td><%=val1%></td>
								<td><%=val2%></td>
								<td><%=val3%></td>
								<td><%=val4%></td>

								<td>
									<form method="get" action="viewpage.jsp"
										style="display: inline">
										<button type="submit" class="btn btn-light" id="a18">View</button>
									</form>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Block</button>&emsp;
								
								<a href="delete.jsp?product_id=<%=val5%>"><button type="submit" class="btn btn-light" id="go" id="a18">Remove</button></a>
								
								</td>

							</tr>
							<%
								}
							%>
							<!-- <tr>
								<th scope="row">
									<div class="round">
										<input type="checkbox" id="checkbox" /> <label for="checkbox"></label>
									</div>
									</div>
								</th>
								<td>Shaver</td>
								<td>Braun</td>
								<td>Personal Care</td>
								<td>4.8</td>
								<td>
									<button type="submit" class="btn btn-light" id="a18">View</button>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Block</button>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Remove</button>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<div class="round">
										<input type="checkbox" id="checkbox" /> <label for="checkbox"></label>
									</div>
									</div>
								</th>
								<td>Macbook</td>
								<td>Apple</td>
								<td>Laptops</td>
								<td>4.9</td>
								<td>
									<button type="submit" class="btn btn-light" id="a18">View</button>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Block</button>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Remove</button>
								</td>
							</tr>

							<tr>
								<th scope="row">
									<div class="round">
										<input type="checkbox" id="checkbox" /> <label for="checkbox"></label>
									</div>
									</div>
								</th>
								<td>iMac 27</td>
								<td>Apple</td>
								<td>Laptops</td>
								<td>4.6</td>
								<td>
									<button type="submit" class="btn btn-light" id="a18">View</button>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Block</button>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Remove</button>
								</td>
							</tr>

							<tr>
								<th scope="row">
									<div class="round">
										<input type="checkbox" id="checkbox" /> <label for="checkbox"></label>
									</div>
									</div>
								</th>
								<td>Micro Pens</td>
								<td>Sakura Pigma</td>
								<td>Art Supplies</td>
								<td>4.1</td>
								<td>

									<button type="submit" class="btn btn-light" id="a18">View</button>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Block</button>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Remove</button>
								</td>
							</tr>

							<tr>
								<th scope="row">
									<div class="round">
										<input type="checkbox" id="checkbox" /> <label for="checkbox"></label>
									</div>
									</div>
								</th>
								<td id="a19">Paint Markers</td>
								<td>Copic</td>
								<td>Art Supplies</td>
								<td>4.2</td>
								<td>
									<button type="submit" class="btn btn-light" id="a18">View</button>
									</from>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Block</button>&emsp;
									<button type="submit" class="btn btn-light" id="a18">Remove</button>
								</td>
							</tr>-->
						</tbody>
					</table>
				</div>
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