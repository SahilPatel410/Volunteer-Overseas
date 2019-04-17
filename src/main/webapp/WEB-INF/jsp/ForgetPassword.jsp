<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<title>Volunteer Overseas</title>
	<link rel="shortcut icon" href="resources/images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css"></head>
<body>
<div class="wrapper admin-wrapper admin-login">
		<header>
			<div class="row header-row">
				<div class="col-lg-2 col-sm-3 col-xs-6 logo-outer">
					<a href="index.html" title="Volunteer Overseas" class="logo"><img src="resources/images/logo_1.png" alt=""><img class="color-logo" src="resources/images/logo.png" alt=""></a>
				</div>
				<div class="col-lg-10 col-sm-9 col-xs-6 menu-wrap">
					<nav>
						<ul>
							<li><!-- <a href="#" title="Organization">Organization</a> --></li>
							<li><!-- <a href="#" title="Projects">Projects</a> --></li>
							<li><!-- <a href="#" title="Application">Application</a> --></li>
							<li><!-- <a href="#" title="FAQ">FAQ</a> --></li>
						</ul>
					</nav>
				</div>
			</div>
			
		</header>
		
		<section class="login_wrapper " style="background: url(resources/images/banner-img.jpg);">
			
			<div class="login_outer">
			<h1>Reset Password</h1>
				<form action="index" name="myForm" onsubmit="return validateLoginForm()" method="post">
					<div class="form-group">
						<label>Username</label>
						<p id="nameWrong1" class="d-none" style="color: red">Name is Mandatory..!!</p>
						<div class="input-group">
							<input  type="text" placeholder="Username" id="1" class="form-control" name="email"
							onblur="validate_name(this)" oninput="validate_name(this)">
								<span id="s1" class="input-group-addon" style="background-color: #FFF;">
									<i id="ok1" class="d-none"></i>
									<i id="notok1" class="d-none"></i>
								</span>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<label>What would you like?</label>
							<ul class="radio-listing clearfix">
								<li>
									<input type="radio" value="email" id="volunteer1" name="radio">
									<label for="volunteer1">e-mail verification</label>
								</li>
								<li>
									<input type="radio" value="phone" id="teach1" name="radio">
									<label for="teach1">otp-verification</label>
								</li>
							</ul>
						</div>
					</div>
					<div class="form-group d-none" id="email">
						<label>Email</label>
						<div class="input-group">
							<input id="email" type="text" placeholder="email" class="form-control" name="email" 
									onblur="validate_email(this)" oninput="validate_email(this)">
							<span id="semail" class="input-group-addon" style="background-color: #FFF;">
									<i id="okemail" class="d-none"></i>
									<i id="notokemail" class="d-none"></i>
							</span>
						</div>
					</div>
					<div class="form-group d-none" id="phone">
						<label>Mobile Number</label>
						<div class="input-group">
							<input id="phone" type="number" placeholder="number" class="form-control" name="number"
									onblur="validate_number(this)" oninput="validate_number(this)">
							<span id="sphone" class="input-group-addon" style="background-color: #FFF;">
									<i id="okphone" class="d-none"></i>
									<i id="notokphone" class="d-none"></i>
							</span>
						</div>
					</div>
					<!-- <div class="form-group">
						<label>Password</label>
						<input  type="text" placeholder="Password" class="form-control" name="password">
					</div> -->
					<div class="button-outer text-center">
						<input type="submit" class="btn btn-fill btn-large" value="Reset Password">
					</div>
				</form>
			</div>
		</section>
	</div>
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/fastclick.min.js"></script>	
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/modernizr.js"></script>	
	<script type="text/javascript" src="resources/js/respond.min.js"></script>
	<script type="text/javascript" src="resources/js/dropkick.min.js"></script>
	<script type="text/javascript" src="resources/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="resources/js/owl.carousel2.thumbs.min.js"></script>
	<script type="text/javascript" src="resources/js/imagesloaded.pkgd.min.js"></script>	
	<script type="text/javascript" src="resources/js/jquery-imagefill-min.js"></script>	
	<script type="text/javascript" src="resources/js/swiper.jquery.min.js"></script>	
	<script type="text/javascript" src="resources/js/select2.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>	
	<script type="text/javascript" src="resources/js/nouislider.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.waypoints.min.js"></script>	
	<script type="text/javascript" src="resources/js/wNumb.js"></script>
	<script type="text/javascript" src="resources/js/jquery.sticky.js"></script>		
	<script type="text/javascript" src="resources/js/general.js"></script>
	<script type="text/javascript" src="resources/js/val.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("input[name='radio']").click(function(){
				var a = $("input[name='radio']:checked").val();
				if(a=='email'){
					$('#phone').addClass("d-none");
					$('#email').removeClass("d-none");
				}else if(a=='phone'){
					$('#email').addClass("d-none");
					$('#phone').removeClass("d-none");
				}
			});
			$('.search-btn-outer .search-btn').click(function(){
				window.location.href = 'search-result.html';
				return false;
			});
		});
	</script>
	<script type="text/javascript" src="resources/js/validation.js"></script>
</body>
</html>