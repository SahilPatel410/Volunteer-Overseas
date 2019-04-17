<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<title>Volunteer Overseas</title>
	<link rel="shortcut icon" href="resources/images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<style type="text/css">
		.d-none{
			display: none;
		}
	</style>
</head>
<body>
	<div class="wrapper admin-wrapper admin-login">
		<header>
			<div class="row header-row">
				<div class="col-lg-2 col-sm-3 col-xs-6 logo-outer">
					<a href="homepage" title="Volunteer Overseas" class="logo"><img src="resources/images/logo_1.png" alt=""><img class="color-logo" src="resources/images/logo.png" alt=""></a>
				</div>
				<div class="col-lg-10 col-sm-9 col-xs-6 menu-wrap">
					<nav>
						<ul>
							<li><a href="homepage" title="Homepage">HomePage</a></li>
							<!-- <li><a href="#" title="Projects">Projects</a></li>
							<li><a href="#" title="Application">Application</a></li> -->
							<li><a href="#" title="FAQ">FAQ</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- <a href="#" title="" class="hamburger-icon"><span></span></a> -->
		</header>
		
		<section class="login_wrapper " style="background: url(resources/images/banner-img.jpg);">
			
			<div class="login_outer">
			<!-- <div class="alert alert-danger">
				<label id="loginLabel"></label> //<strong>Oops!</strong> Invalid Username and password
			</div> -->
			<h1>Welcome to Volunteer Overseas</h1>
				<form action="login" name="myForm" onsubmit="return validateLoginForm()" method="post">
					<div class="form-group">
						<label>Username</label>
						<p id="nameWrong1" class="d-none" style="color: red">Name is Mandatory..!!</p>
						<div class="input-group">
							<input type="text" placeholder="Username" id="1" class="form-control" name="email"
										onblur="validate_name(this)" oninput="validate_name(this)">
							<span id="s1" class="input-group-addon" style="background-color: #FFF;">
								<i id="ok1" class="d-none"></i>
								<i id="notok1" class="d-none"></i>
							</span>
						</div>
					</div>
					
					<div class="form-group">
						<label>Password</label>
						<p id="passwordWrong" class="d-none" style="color: red">Password should contain atleast one number and one special character</p>
						<p id="passwordLength" class="d-none" style="color: red">Password length must be between 6 to 16 characters</p>
						<div class="input-group">
							<input  type="password" placeholder="Password" id="2" class="form-control" name="password"
									onblur="valid_password(this)" oninput="valid_password(this)">
							<span id="2" class="input-group-addon" style="background-color: #FFF;">
								<i id="ok2" class="d-none"></i>
								<i id="notok2" class="d-none"></i>
							</span>
						</div>
						
					</div>
					<div class="form-group">
						<a href="forgetPassword" class="forgot_link" title="Forgot password?">Forgot password?</a>
					</div>
					<div class="button-outer text-center">
						<input type="submit" class="btn btn-fill btn-large" value="Sign In">
					</div>
				</form>
			</div>
		</section>
	</div>
	<jsp:include page="JavaScript.jsp"></jsp:include>
	<script type="text/javascript" src="resources/js/val.js"></script>
</body>
</html>