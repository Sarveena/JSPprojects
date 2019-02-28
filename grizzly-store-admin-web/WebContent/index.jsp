<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Admin - Login</title>
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
	crossorigin="anonymous">
	
</script>
</head>

<body>
	<div class="style1" align="center">
		<img src="images/pic1.jpg" alt="Image not found" width="550"
			height="400" />
	</div>

	<h1 align="center" style="font-size: 100px">GRIZZLY STORE</h1>
	<hr width="50%" style="background-color: lightgray">
	<div align="center">
		<form method="get" action="loginAction.jsp">
			<input type="text" name="uname" class="rounded-pill" size="25"
				id="b1" placeholder="  Username"></br> </br> <input type="password"
				name="pw" class="rounded-pill" size="25" id="b1"
				placeholder="  Password"> </br> </br>
			<button type="submit" class="rounded-pill1">Login</button>

		</form>
	</div>
</body>
</html>