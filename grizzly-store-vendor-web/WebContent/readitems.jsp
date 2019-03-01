
<%@page import="com.cognizant.VendorBean.VendorBean"%>
<%@page import="com.cognizant.VendorDAO.VendorDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cognizant.*"%>
<%@page import="com.cognizant.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<article>

	<head>
<title>Admin - Add Product</title>
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
		HttpSession ses1 = request.getSession();
		HttpSession ses = request.getSession();
		//	out.println("jjjj" + ses1.getAttribute("user"));
		int count = 0;
		try {
			VendorDAO profileDAO = new VendorDAO();
			VendorBean profile = profileDAO.read(request.getParameter("vendor_name"));
			List<VendorBean> profileList = new ArrayList<VendorBean>();
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
			//out.println(ses.getAttribute("username"));
			rs = stmt.executeQuery(
					"select vendor_name,vendor_rating,vendor_contact,vendor_adrs from vendor,vendor_profile where vendor.username=vendor_profile.vendor_name and vendor_profile.vendor_name='"
							+ ses.getAttribute("username").toString() + "'");

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

		<a href="index.jsp"><button type="submit"
				class="btn btn-secondary" id="a2">logout</button> </a>
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
			for (VendorBean profile1 : profileList) {
					count++;
		%>
		<h6 align="center" style="font-family: Georgia"><%=newVal1%></h6>
		<h6 align="center" style="font-family: Georgia">ID</h6>
		<h6 align="center" style="font-family: Georgia"><%=newVal2%></h6>
		<h6 align="center" style="font-family: Georgia">Contact</h6>
		<h6 align="center" style="font-family: Georgia"><%=newVal3%></h6>
		<h6 align="center" style="font-family: Georgia">Office</h6>
		<h6 align="center" style="font-family: Georgia"><%=newVal4%></h6>


		<button type="submit" class="btn btn-light" id="x1">Contact
			Grizzly</button>

	</div>

	<div class="col1">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-6" id="a10">
					<form method="get" action="productclick.jsp">

						<a href="productclick.jsp">
							<button type="submit"
								style="background-color: darkgray; color: black; box-shadow: 0px 10px gray"
								id="x2" class="btn btn-tertiary btn-lg btn-block">
								<h2>PRODUCTS</h2>
							</button>
						</a>
						</button>
					</form>

				</div>
				<div class="col-sm-6 col-md-6" id="c1">
					<button type="submit" class="btn btn-tertiary btn-lg btn-block"
						id="x2" style="background-color: lightgray; color: black">
						<h2>VENDORS</h2>
					</button>
				</div>

			</div>

			<div class="row top-buffer">
				<div class="col2">
					<img src="images/plus2.png" class="card-img-top"
						alt="Cannot Upload" id="a11">
					<div class="row top-buffer">
						<img src="images/plus3.png" class="card-img-top"
							alt="Cannot Upload" id="a11">
					</div>

				</div>
				<div class="col-sm-6">
					<form action="addAction.jsp" id="form1">
						<input type="text" class="form-control" name="product_id"
							id="prod-id" placeholder="Enter Product ID" />
						<hr />
						<input type="text" list="prod-category" class="form-control"
							name="product_category" placeholder="Category" />
						<datalist id="prod-category">
							<option value="Electronics"></option>
							<option value="Appliances"></option>
							<option value="Healthcare"></option>
							<option value="Furniture"></option>
							<option value="Automobile"></option>
						</datalist>
						<hr />
						<input type="text" class="form-control" name="product_name"
							id="prod-name" placeholder="Name" />
						<hr />
						<input type="text" class="form-control" name="product_desc"
							id="prod-desc" placeholder="Description" />
						<hr />
						<input type="text" class="form-control" name="product_price"
							id="prod-price" placeholder="Price" />
						<hr />
				</div>
				<div class="a14">
					<button type="submit" class="btn btn-secondary" id="a15"
						form="form1">Add</button>
					</form>
					</br> </br>
					<button type="reset" class="btn btn-light" id="a16">Cancel</button>
				</div>


			</div>
		</div>

	</div>

	</div>
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