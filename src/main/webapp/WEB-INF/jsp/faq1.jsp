<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="includes1.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css1/navigation.css" rel="stylesheet">
<link href="resources/css1/style.css" rel="stylesheet">
<link href="resources/css1/media.css" rel="stylesheet">
<link href="resources/css1/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div id="contact1">
		<header>
		<div class="row header-row" id="menu">
			<div class="col-lg-2 col-sm-3 col-xs-6 logo-outer">
				<a href="homepage" title="Volunteer Overseas" class="logo">
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
					<a href="index1" class="btn" title="Login">Login</a>
				</div>
			</div>
		</div>
		<a href="#" title="" class="hamburger-icon"><span></span></a> </header>
		<div>
			<h1 class="sec1">FAQ</h1>
		</div>
	</div>
	<c:set var="i" value="1" />
	<c:forEach items="${faq}" var="faq">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-12">
					<div class="accordion" id="accordionExample"
						style="color: #A0A0A0;">
						<div class="card">
							<div class="card-header" id="heading${faq.id}">
								<button style="width: 100%; text-align: left;"
									class="btn-link f1-link b${i}" type="button"
									data-toggle="collapse" data-target=".collapse${faq.id}"
									aria-expanded="true" aria-controls="collapse${faq.id}">
									${faq.question} <img style="float: right;"
										src="resources/images/arrow-toggle.png" class="img${i}">
								</button>
							</div>
						</div>
						<div class="collapse collapse${faq.id}"
							aria-labelledby="heading${faq.id}"
							data-parent="#accordionExample">
							<div class="card-body f2-link">${faq.answer}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:set var="i" value="${i+1}" />
	</c:forEach>
	<!-- <div class="footer">
		<div class="row">
			<a href="homepage"><img src="resources/images/logo_1.png"></a>
			<span> <a href="contact">CONTACT US</a> <a href="faq">FAQ</a>
			</span>
		</div>
	</div> -->
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript">
	   $(document).ready(function(){
	        $(window).scroll(function(){
	        if ($(window).scrollTop() >= 100) {
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
	<c:forEach var="j" begin="1" end="${faqcount+1}">
		<script type="text/javascript">
		$(document).ready(function(){
			    jQuery(".b"+${j}).click(function(){
			      jQuery(".img"+${j}).toggleClass("img-faq");
			    });
		});
	</script>
	</c:forEach>
	<footer>
		<img class="footer-img"
			src="resources/images/logo_1.png" height="50px"
			width="50px"></img> <span
			style="float: right; color: white; padding-top: 25px; padding-right: 10px;">
			<a href="contact" class="text-light">CONTACT US</a></span> <span
			style="float: right; color: white; padding-top: 25px; padding-right: 10px;"><a href="faq" class="text-light">FAQ
			&nbsp; </a></span>
	</footer>
</body>
</html>