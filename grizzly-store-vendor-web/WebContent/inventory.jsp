<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cognizant.VendorBean.VendorBean"%>
<%@page import="com.cognizant.VendorDAO.VendorDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<html>
<article>

	<head>
<title>Vendor - Product Inventory</title>
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
		Welcome
		<%=newVal1%>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<a href="index.jsp"><button type="submit"
				class="btn btn-secondary" id="a2">logout</button> </a>
	</div>
	<div class="a3">
		<h5 class="a4">PROFILE
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Edit</h5>

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
		<h6 align="center" style="font-family: Georgia">Address</h6>
		<h6 align="center" style="font-family: Georgia"><%=newVal4%></h6>

		<button type="submit" class="btn btn-light" id="x1">Contact
			Grizzly</button>
		</form>

	</div>
	<div class="col1">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 " id="a10">
					<a href="readproduct.jsp">
						<button type="submit" class="btn btn-tertiary btn-lg btn-block"
							id="x2" style="background-color: lightgray; color: black"box-shadow: 0px 10pxgray">
							<h2>PRODUCTS</h2>
						</button>
					</a>

				</div>
				<div class="col-sm-6 col-md-4" id="c1">
					<button type="submit" class="btn btn-tertiary btn-lg btn-block"
						id="x2" style="background-color: darkgray; color: black";>
						<h2>INVENTORY</h2>
					</button>
				</div>
				<!--
<div class="col-sm-6 col-md-4" id="c1">
 <button type="submit" class="btn btn-tertiary btn-lg btn-block" style="background-color:#eee">
 </div>-->
				<!--
<div class="col-sm-6 col-md-4" id="c2">
    <button type="submit" class="btn btn-tertiary btn-lg btn-block " style="background-color: #eee;margin-right: -30px; height:65px;margin-left:-15px;margin-bottom:-10px ">

<h2>PROFILE</h2>-->
			</div>
		</div>
	</div>
	</br>
	<div class="row top-buffer">

		<div class="dropdown">
			<button class="btn btn-light dropdown-toggle" type="button"
				id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Choose Action</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">Product List</a> <a
					class="dropdown-item" href="#">Brand</a> <a class="dropdown-item"
					href="#">Category</a> <a class="dropdown-item" href="#">Rating</a>
			</div>

			&emsp;&emsp; <input type="search"
				placeholder="  Product Name/ID...                                 &#xf002 "
				class="fa fa-search rounded-pill x" role="button">
			&emsp;&emsp;

			<button class="btn btn-light dropdown-toggle" type="button"
				id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Sort by</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">Products List</a> <a
					class="dropdown-item" href="#">ID</a> <a class="dropdown-item"
					href="#">Brand</a> <a class="dropdown-item" href="#">Category</a> <a
					class="dropdown-item" href="#">Rating</a>

			</div>


			<a href="readitems.jsp?product_id=<%=newVal1%>"><button
					type="submit" class="btn btn-secondary" id="a2" id="s1">
					Add Product</button></a>


		</div>


		<div class="table-wrapper-scroll-y">
			<table class="table table-bordered" id="a9">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">Product List</th>
						<th scope="col">ID</th>
						<th scope="col">In Stock</th>
						<th scope="col">Req.</th>
						<th scope="col">Buffer</th>
						<th scope="col">Price/Item</th>
						<th scope="col">Pending</th>
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
							int val6 = 0;
							int val7 = 0;
							int val8 = 0;
							int val9 = 0;
							int val10 = 0;

							Statement stmt1 = conn.createStatement();
							ResultSet rs1 = null;
							//	out.println(ses.getAttribute("username"));
							//String q = "select "
							rs1 = stmt.executeQuery(
									"select product.product_name,brand.brand_name,product.product_category, brand.rating,product.product_id,product.product_price,new.buffer,new.instock,new.pending from product,brand,vendor_profile,new where product.product_id=brand.product_id and vendor_profile.vendor_name=product.admin_name  and product.admin_name='"
											+ ses.getAttribute("username").toString() + "'");
							//	out.println(ses.getAttribute("username").toString()+"lkhjjjjjjjjjjjjjjjjjjj");
							while (rs1.next()) {
								val1 = rs1.getString(1);
								val2 = rs1.getString(3);
								val3 = rs1.getString(2);
								val4 = rs1.getInt(4);
								val5 = rs1.getInt(5);
								val6 = rs1.getInt(6);
								val7 = rs1.getInt(7);
								val8 = rs1.getInt(8);
								val9 = rs1.getInt(9);
								val10 = val8 - val7;
								if (val10 <= 0) {
									val10 = 0;
								}
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
						<td><%=val5%></td>
						<td><%=val7%></td>
						<td><%=val10%></td>
						<td><%=val8%></td>
						<td><%=val6%></td>
						<td><%=val9%></td>
						<td><%=val4%></td>
						<td><a href="Manage.jsp?product_id=<%=val5%>">
								<button type="submit" class="btn btn-light" id="a18">Manage</button>
						</a></td>

					</tr>
					<%
					
						}
					%>
					<!--<tr>
    <th scope="row">
        <div class="round">
            <input type="checkbox" id="checkbox" />
            <label for="checkbox"></label>
        </div>
        </div>
    </th>
    <td>Shaver</td>
    <td>BS6785</td>
    <td>23</td>
    <td>0</td>
    <td>10</td>
    <td>4,700.00</td>
    <td>1</td>
    <td>4.8</td>
    <td>
        <button type="submit" class="btn btn-light" id="a18">Manage</button>
    </td>
</tr>
<tr>
    <th scope="row">
        <div class="round">
            <input type="checkbox" id="checkbox" />
            <label for="checkbox"></label>
        </div>
        </div>
    </th>
    <td>Macbook</td>
    <td>MAC4567</td>
    <td>15</td>
    <td>0</td>
    <td>5</td>
    <td>1,53,000.00</td>
    <td>1</td>
    <td>4.9</td>
    <td>
        <button type="submit" class="btn btn-light" id="a18">Manage</button>
    </td>
</tr>

<tr>
    <th scope="row">
        <div class="round">
            <input type="checkbox" id="checkbox" />
            <label for="checkbox"></label>
        </div>
        </div>
    </th>
    <td>iMac 27 </td>
    <td>IMAC3452</td>
    <td>12</td>
    <td>0</td>
    <td>5</td>
    <td>97,000.00</td>
    <td>0</td>
    <td>4.6</td>
    <td>
        <button type="submit" class="btn btn-light" id="a18">Manage</button>
    </td>
</tr>

<tr>
    <th scope="row">
        <div class="round">
            <input type="checkbox" id="checkbox" />
            <label for="checkbox"></label>
        </div>
        </div>
    </th>
    <td>Micro Pens</td>
    <td>SPMP345</td>
    <td bgcolor="#eee">60</td>
    <td bgcolor="#eee">15</td>
    <td>75</td>
    <td>450.00</td>
    <td>4</td>
    <td>4.1</td>
    <td>

        <button type="submit" class="btn btn-light" id="a18">Manage</button>
    </td>
</tr>

<tr>
    <th scope="row">
        <div class="round">
            <input type="checkbox" id="checkbox" />
            <label for="checkbox"></label>
        </div>
        </div>
    </th>
    <td id="a19">Paint Markers</td>
    <td>PMC4567</td>
    <td bgcolor="#eee">45</td>
    <td bgcolor="#eee">15</td>
    <td>60</td>
    <td>4,200.00</td>
    <td>4</td>
    <td>4.2</td>
    <td>
        <button type="submit" class="btn btn-light" id="a18">Manage</button></from>
    </td>
</tr>
</tbody>-->
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
