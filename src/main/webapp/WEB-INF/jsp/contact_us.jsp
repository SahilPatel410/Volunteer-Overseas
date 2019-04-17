<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link href="resources/css/main.css"  rel="stylesheet">
	<link href="resources/css1/navigation.css"  rel="stylesheet">
	<link href="resources/css1/style.css"  rel="stylesheet">
	<link href="resources/css1/media.css"  rel="stylesheet">
	<link href="resources/css1/bootstrap.min.css"  rel="stylesheet">
</head>
<body>
	<div id="contact">
		<header>
	    	<div class="row header-row" id ="menu">
	        	<div class="col-lg-2 col-sm-3 col-xs-6 logo-outer">
	            	<a href="homepage" title="Volunteer Overseas" class="logo">
	                	<!--  <img id="logo-default" src="images/logo_1.png" alt=""> -->
	                    <img class="color-logo1" src="resources/images/logo_1.png" alt="">
	                </a>
	            </div>
	            <div class="col-lg-10 col-sm-9 col-xs-6 menu-wrap">
	            	<nav>
	                	<ul>    
	                    	<li><a href="work" title="HOW IT WORKS">HOW IT WORKS</a></li>
	                        <li><a href="contact" title="CONTACT US">CONTACT US</a></li>
	                    </ul>
	                </nav>
	                <div class="right-block">
	                	<a href="index1" class="btn btn-outline-light" title="Login" >Login</a>
	                </div>
	          	 </div>
			</div>
			<a href="#" title="" class="hamburger-icon"><span></span></a>
		</header>
		<div>
			<h1 class="sec1">CONTACT US</h1>
		</div>
	</div>

	<div class="container-fluid" style="margin-top: 30px">
		<div class="row" style="margin-left: 30px;margin-right: 30px">
			<!-- <div class="col-md-2"></div> -->
			<div class="col-md-12" >
				<span style="color: #A0A0A0;">
					Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.
				</span>
			</div>
		</div>
		<br><br>
	</div>

	<div class="container-fluid">
		<form  name="myForm" onsubmit="return validateForm()" method="post" action="savecontact">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4 form-group">
					<input type="text" class="form-control" placeholder="Name" name="name">
				</div>
				<div class="col-md-4 form-group">
				   	<input type="text" class="form-control" placeholder="your@email.com" name="mail">
				</div>
			</div>
			<div class="row">
			   	<div class="col-md-2"></div>
			   	<div class="col-md-8">
	  				<textarea class="form-control textarea" id="comment" name="message" placeholder ="message" style="height: 180px;margin-bottom: 15px"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-sm-2">
					<div class="form-group">
						<input type="submit" class="btn btn-primary form-control" value="Send">
					</div>
				</div>
	 		</div>
		</form>
	</div>

	<!-- <div class="footer fixed-bottom">
		<div class="row">
	    	<a href="homepage"><img src="resources/images/logo_1.png" ></a>
	        <span>
		        <a href="contact">CONTACT US</a>
		        <a href="faq">FAQ</a>
	        </span>
	    </div> 
	 </div> -->
     <script type="text/javascript" src="resources/js1/bootstrap.js" ></script>
     <script type="text/javascript" src="resources/js1/validate.js" ></script>
     <script type="text/javascript" src="resources/js1/default.js" ></script>
     <script type="text/javascript" src="resources/js/jquery.js" ></script>
     <%-- <script type="text/javascript" src="resources/js/main.js" ></script> --%>
 	
	 <script type="text/javascript">
	    $(document).ready(function(){
	        $(window).scroll(function(){
		        if ($(window).scrollTop() >= 10) {
		            $('#menu').addClass('fixed-header2');
		            $('.color-logo1').attr('src','resources/images/logo.png');
		            $('header a').css("color","#00acc1");
		            $('.right-block').css("margin-right","25%");
		        }
		        else {
		            $('#menu').removeClass('fixed-header2');
		            $('.color-logo1').attr('src','resources/images/logo_1.png'); 
		            $('header a').css("color","#FFFFFF");
		            $('.right-block').css("margin-right","0%");
		        }
	    	});
	    });
	</script>
	<footer class="fixed-bottom">
		<img class="footer-img"
			src="resources/images/logo_1.png" height="50px"
			widhth="50px"></img> <span
			style="float: right; color: white; padding-top: 25px; padding-right: 10px;">
			<a href="contact" class="text-light">CONTACT US</a></span> <span
			style="float: right; color: white; padding-top: 25px; padding-right: 10px;"><a href="faq" class="text-light">FAQ
			&nbsp; </a></span>
	</footer>
</body>
</html>