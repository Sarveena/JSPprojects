<%@page import="com.cognizant.bean.PracticeBean"%>
<%@page import="com.cognizant.dao.PracticeDAO"%>
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
	<div class="p-3 mb-2 bg-light text-dark" style="font-size: 20px">
		GRIZZLY<img src="images/pic1.jpg" alt="logo" width="80px"
			height="60px"> STORE &nbsp;&emsp;&emsp;&emsp;&emsp; &nbsp;
		&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
			type="search"
			placeholder="  Search                                      &#xf002 "
			class="fa fa-search rounded-pill x" role="button">
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<a class="btn1"><i class="fa fa-bell" role="button" id="a"></i></a>
		Welcome Admin Sarveena
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
		<h6 align="center" style="font-family: Georgia">Sarveena</h6>
		<h6 align="center" style="font-family: Georgia">ID</h6>
		<p align="center" style="font-family: Georgia">GRIZLY17234</p>
		<h6 align="center" style="font-family: Georgia">Designation</h6>
		<h6 align="center" style="font-family: Georgia">Sir.Admin</h6>
		<h6 align="center" style="font-family: Georgia">Office</h6>
		<h6 align="center" style="font-family: Georgia">NYC,NY, USA</h6>
	</div>

	<div class="col1">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-6" id="a10">
					<form method="get" action="Secondlogin.html">
						<button type="submit" class="btn btn-tertiary btn-lg btn-block"
							id="x2"
							style="background-color: darkgray; color: black; box-shadow: 0px 10px gray">
							<h2>PRODUCTS</h2>
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
					<form>
						<input type="text" class="form-control" name="prod-id"
							id="prod-id" placeholder="Enter Product ID" />
						<hr />
						<input type="text" list="prod-category" class="form-control"
							name="prod-category" placeholder="Category">
						<datalist id="prod-category">
							<option value="Electronics"></option>
							<option value="Appliances"></option>
							<option value="Healthcare"></option>
							<option value="Furniture"></option>
							<option value="Automobile"></option>
						</datalist>
						<hr />
						<input type="text" class="form-control" name="prod-name"
							id="prod-name" placeholder="Name" />
						<hr />
						<input type="text" class="form-control" name="prod-desc"
							id="prod-desc" placeholder="Description" />
						<hr />
						<input type="text" class="form-control" name="prod-price"
							id="prod-price" placeholder="Price" />
						<hr />
					</form>
				</div>
				<div class="a14">
					<button type="submit" class="btn btn-secondary" id="a15">Add</button>
					</br> </br>
					<button type="reset" class="btn btn-light" id="a16">Cancel</button>
				</div>


			</div>
		</div>

	</div>

	</div>
	</div>

</body>

</html>