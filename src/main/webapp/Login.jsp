<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<style>
form {
	border: 3px solid #f1f1f1;
	display: inline-block;
    text-align: left;
    width: 45%;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 15px 3px;
	margin: 14px 0;
	border: none;
	cursor: pointer;
	width: 48%;
}

button:hover {
	opacity: 0.8;
}

/* .cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
} */

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>

</head>
<body>

<center>
<h2>Welcome to movie database application !! </h2><br> <br>
	<form action="doLogin" method="post">
		<%
			if (null != request.getAttribute("errorMessage")) {
				out.println(request.getAttribute("errorMessage"));
			}
		%>

		<div class="imgcontainer">
		    <img src="resources/images/avatar.png" alt="Avatar" class="avatar">
		</div>
		<div class="container">
			<label><b>Username</b></label>
				<input type="text" placeholder="Enter Username" name="username" required>
			<label><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="password" required>
			<button type="submit">Login</button>
			<button type="reset">Reset</button>
		</div>

		<!-- <div class="container" style="background-color: #f1f1f1">
			<button type="button" class="cancelbtn">Cancel</button>
			<span class="psw">Forgot <a href="#">password?</a></span>
		</div> -->
	</form>
</center>
</body>
</html>