<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/css1/bootstrap.min.css"	
	rel="stylesheet">
<link href="resources/css1/bootstrap-grid.css"
	rel="stylesheet">
<link href="resources/css1/jquery-ui.css"
	rel="stylesheet">
<link href="resources/css1/owl.carousel.min.css"
	rel="stylesheet">
<link href="resources/css1/temp.css"  rel="stylesheet">
<link href="resources/css1/MediaHome.css"
	rel="stylesheet">
<style type="text/css">
option{
background: white;
color:black;
}
.owl-carousel .owl-dots.disabled, .owl-carousel .owl-nav.disabled {
    display: none;
}
.owl-nav{
 display: none;
}
</style>
</head>
<body>
	<header class="search-banner container-fluid">
		<nav class="navbar navbar-expand-sm navbar-light ">
			<img src="resources/images/logo_1.png"
				style="margin-right: 20px;" />
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarText" aria-controls="navbarText"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="work">HOW
							IT WORKS</a></li>
					<li class="nav-item"><a class="nav-link" href="contact">CONTACT
							US</a></li>
				</ul>
				<a class="btn my-2 my-sm-0 login1" href="index1"
				style="color: #00acc1; float: right; font-size: 14px; border: 1px solid #00acc1;">Login</a>
			</div>
		</nav>
		<nav class="navbar navbar-expand-sm navbar-light d-none">
			<img class="img-responsive"
				src="resources/images/logo.png" height="50px"
				widhth="40px"></img>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item "><a class="nav-link" href="#">HOW IT
							WORKS</a></li>
					<li class="nav-item "><a class="nav-link" href="contact">CONTACT
							US</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<button class="form-control btn btn-outline-success my-2 my-sm-0" 
						style="color: white; background:#00acc1;"
						type="submit">Login</button>
				</form>
			</div>
		</nav>
		<div>
			<h1>Discover Yourself, Discover the World</h1>
			<h3>Apply to your perfect volunteer, intern, or teach abroad
				program.</h3>

			<div class="container-fluid search-bar">
				<form action="search_result/1" method="post" name="searchform">
				<div class="row">
					<div class="col-sm-3 form-group">
						<label>Type</label> <select class="form-control home-select-1"
							id="searchbar-category" name="searchbar-category">
							 <c:forEach items="${categories}" var="category">
								<option value="${category.name}">${category.name}</option>
							 </c:forEach> 
						</select>
					</div>
					<div class="col-sm-4 form-group">
						<label>Location</label> <input type="text" id="searchbar-location" name="searchbar-location"
							class="form-control search-input" required="required" placeholder="Anyhwhere">
					</div>
					<div class="col-sm-3 form-group">
						<label>Activity</label> <select  id="searchbar-activity" class="form-control home-select-2" name="searchbar-activity">
						 <c:forEach items="${activities}" var="activities">
							<option value="${activities.name}">${activities.name}</option>
						</c:forEach> 
						</select>
					</div>
					<div class="col-sm-2 form-group">
						<button type="submit" class=" btn-danger">Search</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</header>
	<div class="container-fluid">

		<div class="container-fluid" id="slider1">
			<h2>Trending Projects</h2>
			<div class="owl-carousel">
			<c:forEach items="${projectsTrending}" var="projects">
				<div class="item s1item">
					<a href="index?id=${projects.projectCost.id}&cost=${projects.cost}&weeks=${projects.number_of_weeks}"><img
						src="resources/images/${projects.projectCost.image}" /></a>
					<div>
						<label class="label1">${projects.projectCost.country.name}</label>
						<h6>${projects.projectCost.activity.name}</h6>
						<p>${projects.projectCost.organization.name}</p>
						<label class="label2">12 people researching this project</label>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		<div class="container-fluid" id="slider2">
			<h2>Feature Destinations</h2>
			<div class="owl-carousel">
				<c:forEach items="${projectFeaturedest}" var="projects" varStatus="status">
				<div class="item s2item">
					<a href="search_FeaturResult/1?countryId=${projects.country.id}"><img style="height:250px"
						src="resources/images/${projects.image}" /></a>
					<div>
						<label class="slider2-label"> ${PIN[status.index]} Projects in </label>
						<h6>${projects.country.name}</h6>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="container-fluid " id="slider3">
			<h2>Most Affordable Project</h2>
			<div class="owl-carousel">
				<c:forEach items="${projectsMostAffordable}" var="projectsMostAffordable">
				<div class="item s3item">
					<a href="index?id=${projectsMostAffordable.projectCost.id}&cost=${projectsMostAffordable.cost}&weeks=${projectsMostAffordable.number_of_weeks}"> <img
						src="resources/images/${projectsMostAffordable.projectCost.image}">
					</a>
					<div>
						<label class="slider3-label1">Starting At </label>
						<c:set var="y" value="${projectsMostAffordable.cost}"></c:set>
						<c:set var="x" value="${projectsMostAffordable.number_of_weeks}"></c:set>
						<fmt:parseNumber var = "j" type = "number" value = "${y/x}" integerOnly = "true" />
						<h4>${j}/Weeks</h4>
						<label class="slider3-label1">for ${x} weeks</label>
						<h6>${projectsMostAffordable.projectCost.activity.name}</h6>
					</div>
					<figcaption>
						<label>${projectsMostAffordable.projectCost.country.name}</label>
						<h6>${projectsMostAffordable.projectCost.organization.name}</h6>
					</figcaption>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@include file="includes1.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#slider1>div').owlCarousel();
			$('#slider2>div').owlCarousel();
			$('#slider3>div').owlCarousel();
		});
		$('#slider1>div')
				.owlCarousel(
						{
							loop : true,
							margin : 10,
							nav : true,
							navText : [
									"<img src='resources/images/left-white-arrow.png'>",
									"<img src='resources/images/right-white-arrow.png'>" ],
							responsiveClass : true,
							responsive : {
								0 : {
									items : 1,
								},
								425 : {
									items : 2,
								},
								1024 : {
									items : 4,

								}
							}
						});
		$('#slider2>div')
				.owlCarousel(
						{
							loop : true,
							margin : 10,
							nav : true,
							navText : [
									"<img src='resources/images/left-white-arrow.png'>",
									"<img src='resources/images/right-white-arrow.png'>" ],
							responsiveClass : true,
							responsive : {
								0 : {
									items : 2,

								},
								425 : {
									items : 3,

								},
								1024 : {
									items : 6,
									nav : true
								}
							}
						});

		$('#slider3>div')
				.owlCarousel(
						{
							loop : true,
							margin : 10,
							nav : true,
							responsiveClass : true,
							responsive : {
								0 : {
									items : 1,

								},
								425 : {
									items : 3,

								},
								1000 : {
									items : 5,

								}
							}
						});
	</script>
	<script type="text/javascript">
		$(window).scroll(
				function() {
					if ($(window).scrollTop() > 0) {
						/*$("header.head-index nav:first").hide();*/
						$("header.search-banner nav:eq(1)").removeClass(
								'd-none');
						$("header.search-banner nav:eq(1)").addClass(
								'fixed-header');
						$(".nav-link").css("color","#00acc1");
					} else {
						/*$("header.head-search nav:first").show();*/
						$("header.search-banner nav:eq(1)").addClass('d-none');
						$("header.search-banner nav:eq(1)").removeClass(
								'fixed-header');
						$(".nav-link").css("color","white");
					}
				});
	</script>
	<footer>
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