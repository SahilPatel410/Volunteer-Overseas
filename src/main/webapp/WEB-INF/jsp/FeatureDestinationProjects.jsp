<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes.jsp"%>
<link rel="stylesheet" href="../resources/css1/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css1/bootstrap-grid.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css1/bootstrap.css"
	type="text/css">
<script type="text/javascript" src="../resources/js1/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css1/jquery-ui.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css1/navigation.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css1/style.css" type="text/css">
<link rel="stylesheet" href="../resources/css1/media.css" type="text/css">
<script type="text/javascript" src="../resources/js1/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js1/jquery-ui.js"></script>
<script type="text/javascript">$("#"+${pi}).addClass("active");</script>
<style type="text/css">
p img {
	border-radius: 10px;
}

.ui-widget-header {
	background: #00acc1;
}

.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active,
	a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover
	{
	background: #00acc1;
}
</style>
</head>
<body>
	<div class="sch fixed-top">
		<nav class="navbar navbar-expand-lg navbar-light"
			style="border-bottom: 1px solid #fff">
			<a class="navbar-brand tbleft" href="../homepage"><img
				src="../resources/images/logo.png"
				style="height: 50px"></a>
			<button class="navbar-toggler ttab" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse back"
				id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="../work"
						style="color: #00acc1; font-size: 16px;">HOW IT WORKS<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="../contact"
						style="color: #00acc1; font-size: 16px;">CONTACT US</a></li>

				</ul>
				<a class="btn my-2 my-sm-0 login1" href="../index1"
				style="color: #00acc1; float: right; font-size: 14px; border: 1px solid #00acc1;">Login</a>
			</div>
		</nav>
	</div>
	<div class="container-fluid row" style="padding-top: 6%">
		<div class="col-md-12">
			${size} Results
			<div style="float: right;">
				Sort by: <select class="text-dark m-1">
					<option>Name</option>
					<option>Id</option>
				</select>
			</div>
		</div>
	</div>
	<!-- project list row-->
	<div class="search-panel container-fluid row">
		<c:forEach items="${projects}" var="projects">
			<div class="col-md-4">
				<div id="${projects.projectCost.id}"
					class="carousel slide bg-inverse" data-ride="carousel"
					data-interval="false">
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<a
								href="../index?id=${projects.projectCost.id}&cost=${projects.cost}&weeks=${projects.number_of_weeks}">
								<img class="d-block w-100"
								src="../resources/images/${projects.projectCost.image}"
								alt="First slide">
							</a>
							<div class="carousel-caption">
								<div class="caption">
									<p>MEDICAL VOLUNTEERING</p>
								</div>
							</div>
						</div>
						<div class="carousel-item" data-interval="false">
							<a
								href="../index?id=${projects.projectCost.id}&cost=${projects.cost}&weeks=${projects.number_of_weeks}">
								<img class="d-block w-100"
								src="../resources/images/${projects.projectCost.image}"
								alt="Second slide">
							</a>
							<div class="carousel-caption">
								<div class="caption1">
									<p>LOREM IPSUM</p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<a
								href="../index?id=${projects.projectCost.id}&cost=${projects.cost}&weeks=${projects.number_of_weeks}">
								<img class="d-block w-100"
								src="../resources/images/${projects.projectCost.image}"
								alt="Third slide">
							</a>
							<div class="carousel-caption">
								<div class="caption1">
									<p>DOLOR SIT</p>
								</div>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#${projects.projectCost.id}"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next"
						href="#${projects.projectCost.id}" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				<p></p>
				<P style="font-size: 16px">${projects.projectCost.title}</P>
				<p style="font-size: 14px; color: #00acc1">
					<img
						src="../resources/images/volunteer-logo01.png"
						style="width: 20px; height: 20px;">Love Volunteers
				</p>
				<c:set var="y" value="${projects.cost}"></c:set>
				<c:set var="x" value="${projects.number_of_weeks}"></c:set>
				<fmt:parseNumber var="j" type="number" value="${y/x}"
					integerOnly="true" />
				<p style="font-size: 14px;">
					$${j}/week <font style="color: red">.</font> ${x} weeks duration
				</p>
			</div>
		</c:forEach>
	</div>
	<ul class="pagination">
		<c:if test="${pages ne 0}">
			<c:if test="${pi ne 1}">
				<li><a href="${pi-1}?countryId=${CountryId}"
					aria-label="Previous"> < </a></li>
			</c:if>
		</c:if>
		<c:forEach var="i" begin="1" end="${pages}">
			<li id="pageid${i}"><a href="${i}?countryId=${CountryId}">${i}</a></li>
		</c:forEach>
		<c:if test="${pages ne 0}">
			<c:if test="${pi ne pages}">
				<li><a href="${pi+1}?countryId=${CountryId}" aria-label="Next">
						> </a></li>
			</c:if>
		</c:if>
	</ul>
	</div>
	<!-- <div class="footer fixed-bottom">
		<div class="row">
			<a href="../homepage"><img
				src="../resources/images/logo_1.png"> </a><span>
				<a href="../contact">CONTACT US</a> <a href="../faq">FAQ</a>
			</span>
		</div>
	</div> -->
	<script>
	$("#pageid${pi}").addClass("active");
	$("#pageid${pi} a").css("color","white");
		$(function() {
			$("#slider-range").slider({
				range : true,
				min : 1,
				max : 10,
				values : [ 1, 3 ],
				slide : function(event, ui) {
					$("#amount").val(ui.values[0] + " weeks- "+ ui.values[1]+" weeks");
				}
			});
			$("#amount").val(
				$("#slider-range").slider("values", 0) + " weeks- "
					+ $("#slider-range").slider("values", 1)+" weeks");
		});
	</script>
	<script>
	$(window).scroll(function(){
		$('.footer').removeClass("fixed-bottom");
	});
	</script>
	<script type="text/javascript">
		$('more-filters-btn').click(function() {
			$('.modal').css("data-backdrop", "false");
		});
	</script>
	<script type="text/javascript"
		src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript">
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').trigger('focus')
		})
	</script>
	<script type="text/javascript">
		$(".more-filters-btn").click(function() {
			var $this = $(this).closest(".search-panel");
			$this.find(".more-filters").slideToggle();
		}); 
	</script>
	<!-- Initialize Bootstrap functionality -->
	<script>
		// Initialize tooltip component
		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
		})
		// Initialize popover component
		$(function() {
			$('[data-toggle="popover"]').popover()
		})
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