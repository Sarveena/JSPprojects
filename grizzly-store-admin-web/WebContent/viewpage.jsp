<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cognizant.bean.PracticeBean"%>
<%@page import="com.cognizant.dao.PracticeDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<article>

	<head>
<title>Admin - View Product</title>
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
			
 			Statement stmt1 = conn.createStatement();
 			ResultSet rs1 = null;
 			
			
			String v1 = ""; 
			String v2 = "";
			rs1=stmt1.executeQuery("select product_desc,product_name from product,profile where product.product_id = profile.admin_id ");
			
			//out.println(rs1);
 			while(rs1.next())
 			{
				v1 = rs1.getString(1);
				v2 = rs1.getString(2);
			} 			//out.println("gfg");
			
			Statement stmt2 = conn.createStatement();
			ResultSet rs2 = null;
			rs2 = stmt2.executeQuery("select brand_name from brand,product where product.product_id=brand.product_id");
			String v3 = "";
			
			while(rs2.next())
			{
				v3 = rs2.getString(1);
			}
	%>
	<div class="p-3 mb-2 bg-light text-dark" style="font-size: 20px">
		GRIZZLY <img src="images/pic1.jpg" alt="logo" width="80px"
			height="60px"> STORE &nbsp;&emsp;&emsp;&emsp;&emsp; &nbsp;
		&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
			type="search"
			placeholder="  Search                                      &#xf002 "
			class="fa fa-search rounded-pill x" role="button">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;

		<a class="btn" id="a20"><i class="fa fa-bell" role="button"
			id="a20"></i></a>&emsp; Welcome Admin
		<%=newVal1%>
		&emsp;&emsp;&emsp;
		<form method="get" action="login.html" style="display: inline">
			<button type="submit" class="btn btn-secondary" id="a2">logout</button>
		</form>
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
				<div class="col-sm-6" id="a10">
					<form method="get" action="Secondlogin.html">
						<button type="submit" class="btn btn-tertiary btn-lg btn-block"
							id="x2"
							style="background-color: darkgray; color: black; box-shadow: 0px 10px gray">
							<h2>PRODUCTS</h2>
						</button>
					</form>
				</div>
				<div class="col-sm-6" id="c1">
					<button type="submit" class="btn btn-tertiary btn-lg btn-block"
						id="x2" style="background-color: lightgray; color: black">
						<h2>VENDORS</h2>
					</button>
				</div>
			</div>
		</div>
	</div>

	<div class="row top-buffer">
		<p style="font-size: 25px">
			<b><%=v2 %> </b> by <%=v3 %>
		</p>
		&emsp;&emsp; <a class="btn"><i class="fa fa-pencil" role="button"
			id="a20"></i></a>

	</div>
	<div>
		&nbsp;
		<p style="font-size: 20px"><i class="fa fa-star-o"></i>4.7
		</p>
	</div>

	<div class="a21">
		<a class="btn" id="a20"><i class="fa fa-pencil" role="button"
			id="a20"></i></a> </i>
			<img src="images/product.jpg" class="d-block w-100" alt="No Items Found">
			</div>

		<!-- div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="images/p1.jpg" class="d-block w-100" alt="No Items Found">
				</div>
				<div class="carousel-item">
					<img src="images/p2.jpg" class="d-block w-100" alt="No Items Found">
				</div>
				<div class="carousel-item">
					<img src="images/p4.jpg" class="d-block w-100" alt="No Items Found">
				</div>
				<div class="carousel-item">
					<img src="images/p5.jpg" class="d-block w-100" alt="No Items Found">
				</div>
				<div class="carousel-item">
					<img src="images/p6.jpg" class="d-block w-100" alt="No Items Found">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<h3 align="center" class="a25">Product Image Corousel</h3>
	</div-->

	<div class="col15">
		<h5 style="font-size: 25px">Product Description</h5>
		
		<h1><%=v1 %></h1>
        <!-- p style="font-size: 20px">Lorem ipsum dolor sit amet, consectetuer
adipiscing elit, sed diam nonummy nibh 
euismod tincidunt ut laoreet dolore
magna aliquam erat volutpat. Ut wisi enim 
ad minim veniam, quis nostrud exerci 
tation ullamcorper suscipit lobortis nisl ut 
aliquip ex ea commodo consequat. Duis
autem vel eum iriure dolor in hendrerit in 
vulputate velit esse molestie consequat,
vel illum dolore eu feugiat nulla facilisis at
             
             -->
             </br>
             </br>
             </br>   
             </br>
             </br>  
                
             
             
      
             
RS.XXXX/- 15%off <a class="btn" id="a20"><i class="fa fa-pencil"
					role="button" id="a22"></i></a></i>
				</button>     
				<pre>               
				<button type="submit" class="btn btn-secondary" id="a23"> <b>Finish</b></button>
				</br><form method="get" action="Secondlogin.html" style="display: inline">                             	<button type="submit" class="btn btn-light" id="a24"><b>Cancel</b>
				</button>
			</form>

</p>
</pre>
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
	</form>
</body>

</html>