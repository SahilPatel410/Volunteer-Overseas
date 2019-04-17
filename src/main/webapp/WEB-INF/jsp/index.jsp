<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.lang.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/css1/main.css" rel="stylesheet">
<link href="resources/css1/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js1/bootstrap.js"></script>
<script type="text/javascript">
	$('.divId').addClass("intro2");
</script>
<link href="resources/css1/jquery-ui.css" rel="stylesheet">
<link href="resources/css1/navigation.css" rel="stylesheet">
<link href="resources/css1/owl.carousel.min.css" rel="stylesheet">
<link href="resources/css1/style.css" rel="stylesheet">
<link href="resources/css1/media.css" rel="stylesheet">
<script type="text/javascript" src="resources/js1/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js1/owl.carousel.js"></script>
<style type="text/css">
html {
	scroll-behavior: smooth;
}

div#owl-table table {
	border: 1px solid #ccc;
}

div#owl-table table th {
	text-align: center;
	background-color: #00ACC1;
	color: white;
	font-size: 18px;
	width: 25%;
}

div#owl-table table td {
	text-align: center;
	font-size: 16px;
	color: #00ACC1;
}

div#owl-table table td b {
	color: red;
	font-size: 18px;
}

div#owl-table .owl-nav button.owl-prev {
	left: 1%;
	bottom: 80%;
	position: absolute;
}

div#owl-table .owl-nav button.owl-next {
	right: 1%;
	bottom: 80%;
	position: absolute;
}

div#owl-table .owl-nav button.owl-prev img {
	height: 25px;
	width: 15px;
}

div#owl-table .owl-nav button.owl-next img {
	height: 25px;
	width: 15px;
}
</style>
</head>
<body>
	<!-- header -->
	<div id="intro1">
		<header>
		<div class="row header-row" id="menu">
			<div class="col-lg-2 col-sm-3 col-xs-6 logo-outer">
				<a href="homepage" title="Volunteer Overseas" class="logo"> <img
					class="color-logo1" src="resources/images/logo_1.png" alt="">
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
					<a href="index1" class="btn btn-outline-light" title="Login">Login</a>
				</div>
			</div>
		</div>
		<a href="#" title="" class="hamburger-icon"><span></span></a> </header>
		<div>
			<h1 class="sec1">${project.title}</h1>
		</div>
		<div>
			<button class="view1" data-toggle="modal" data-target="#img_gallery">
				<img src="resources/images/photos-icon.png" />View Photos
			</button>
		</div>
	</div>
	<!-- Content Part -->
	<section class="container" id="content">
	<div class="row">
		<div class="col-md-8">
			<div class="div1 row">
				<div class="column col-md-8">
					<h2 class="n1">
						<b>${project.title}</b>
					</h2>
				</div>
				<div class="column col-md-4">
					<p class="kumasi_ghana">
						<img src="resources/images/pin.png" /> ${project.city.name},
						${project.country.name}
					</p>
				</div>
			</div>
			<div class="div2 row" style="align-items: center">
				<img src="resources/images/${project.organization.logo}" />
				<h2 style="color: #00acc1">
					<b>&nbsp;&nbsp;${project.organization.name}</b>
				</h2>
			</div>
			</br>
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<img src="resources/images/icon1.png">&nbsp;&nbsp;From
					${cost} for ${weeks} weeks</img>
				</div>
				<div class="col-md-4 col-sm-6">
					<img src="resources/images/icon2.png">&nbsp;&nbsp; ${weeks}
					weeks</img>
				</div>
				<div class="col-md-4 col-sm-6">
					<img src="resources/images/icon4.png">&nbsp;&nbsp;${project.min_age}
					And older</img>
				</div>
			</div>
			<nav id="navbar-example2">
			<ul>
				<div class="link-style scroll_2">
					<a href="#DESCRIPTION" class="btn">DESCRIPTION</a> <a
						href="#LOCATION" class="btn">LOCATION</a> <a href="#COST"
						class="btn">COST</a> <a href="#DATES" class="btn">DATES</a> <a
						href="#ORGANIZATION" class="btn">ORGANIZATION</a>
				</div>
			</ul>
			</nav>

			<!-- Description -->
			<div>
				<br> <br>
				<h2 style="color: #00acc1" id="DESCRIPTION">
					<b>Description</b>
				</h2>
				<c:forEach items="${gallery}" var="g">
					<c:out value=""></c:out>
					<c:out value="${g.images}"></c:out>
				</c:forEach>

				<h4 style="color: #e53b51; font-size: 25px;">Overview</h4>

				<p class="text">${project.overview_description}
					${project.overview_description} ${project.overview_description}</p>
				<h4 style="color: #e53b51; font-size: 25px;">field conditions</h4>

				<p class="text">${project.accommodation_description}</p>

				<br>
				<h4 style="color: #e53b51; font-size: 25px;">Your Impact</h4>

				<p class="text">${project.imapact_description}
				<p class="text">${project.imapact_description}</p>
				<p class="text">${project.imapact_description}</p>
				</p>
				<video width="100%" height="340" controls> <source
					src="resources/images/${project.project_video_url}"
					type="video/mp4"></video>
			</div>

			<!-- Location -->
			<div style="border-top: 3px solid #ccc; margin-top: 40px;"
				id="LOCATION">
				<br>
				<h2 style="color: #00acc1">
					<b>Location</b>
				</h2>
				<img src="resources/images/pin.png"
					style="display: inline-block; padding-top: 10px">
				<p
					style="padding-top: 20px; color: #e53b51; display: inline-block; font-size: 20px; padding-top: 10px">
					Tatvasoft,Ahmedabad</p>
				</img>
				<div>
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3671.698164678886!2d72.49826931496798!3d23.03485218494687!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e8352e403437b%3A0xdc9d4dae36889fb9!2sTatvaSoft!5e0!3m2!1sen!2sin!4v1546931298556"
						height="450" frameborder="0" style="border: 0; width: 100%"
						allowfullscreen></iframe>
				</div>
			</div>
			<!-- Cost -->
			<div style="border-top: 3px solid #ccc; margin-top: 40px;" id="COST">
				<br>
				<h2 style="color: #00acc1">
					<b>Cost</b>
				</h2>
				<p class="text">${project.cost_description}</p>
			</div>
			<br>
			<!-- first table -->
			<div class="table-responsive">
				<table class="table cost_table" cellpadding="3px">
					<tr>
						<td style="border-right: 1px solid #ccc">
							<h4 style="color: #00acc1">
								<img src="resources/images/icon2.png"
									style="padding-right: 10px"><b>Duration</b> <select
									style="margin-left: 20px" id="d1">
									<c:set var="weeks" value="${projectsweeks.number_of_weeks}"></c:set>
									<option value="0">select Duration</option>
									<c:forEach items="${projectDurationCost}" var="projectsweeks">
										<c:set var="cost" value="${projectsweeks.id}"></c:set>
										<option value="${cost}">${projectsweeks.number_of_weeks}
											Weeks</option>
									</c:forEach>
								</select>
							</h4>
						</td>
						<td>
							<h4 style="color: #00acc1">
								<img src="resources/images/icon1.png"
									style="padding-right: 10px"><b>Cost: </b> <b
									style="color: #e53b51; margin-left: 40px" id="c1"> </b>
							</h4>
						</td>
					</tr>
				</table>
			</div>
			<div class="table-responsive">
				<table class="table" style="width: 100%; color: color: #3d3d3d;">
					<tr>
						<td><h3
								style="color: #fff; background-color: #00acc1; text-align: center;">
								<b>Whats's Included</b>
							</h3></td>
						<td><h3
								style="color: #fff; background-color: #e53b51; text-align: center;">
								<b>Whats's not Included</b>
							</h3></td>
					</tr>
					<tr>
						<td><c:forEach items="${included}" var="include">
								<img src="resources/images/new-tick.png"
									style="height: 20px; width: 20px"> ${include.description}</br>
							</c:forEach></td>
						<td><c:forEach items="${notincluded}" var="notincluded">
								<img src="resources/images/check.png"
									style="height: 20px; width: 20px"> ${notincluded.description}</br>
							</c:forEach></td>
					</tr>

				</table>
			</div>
			<hr>
			<!-- Dates -->
			<div id="DATES">
				<h2 style="color: #00acc1">
					<b>Project Start Dates</b>
				</h2>
				<p class="text">${project.project_startdate_description}</p>
				<!-- div of last table-->
				<div class="owl-carousel owl-theme" id="owl-table">
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
					<div class="item">
						<table class="table ">
							<th>January 2018</th>
							<tr>
								<td><b>07</b> Sunday</td>
							</tr>
							<tr>
								<td><b>21</b> Sunday</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<!-- Organization -->
			<div id="ORGANIZATION">
				<h2 style="color: #00acc1">
					<b>Organization</b>
				</h2>
				<p class="text">${project.organization.description}</p>
			</div>
			<div class="container views">
				<button type="submit" class="btn btn-primary form-control"
					data-toggle="modal" data-target="#exampleModall" id="apply_now"
					value="0" onclick="validate_apply_now()">Apply Now ^</button>
			</div>
			<!-- col 8 s div -->
		</div>
		<!-- col 4 started -->
		<div class="col-md-4 secnd-clm">
			<div>
				<form class="right1 form-group" ac>
					<label class="text-light" style="background: rgba(0, 0, 0, 0.1);"><b>23
							people</b> searching this project</label> <label for="date"
						class="form-group text-light">Project Start date</label>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1"><img
								src="resources/images/icon3.png" /></span>
						</div>

						<input type="text" class="form-control" id="datepicker"
							aria-label="Default" required>
					</div>
					<label for="duration" class="form-group text-light">Duration</label>
					<select class="form-control dur1" id="select_week">
						<option selected value="">Choose one</option>
						<option value="2">2 weeks</option>
						<option value="3">3 weeks</option>
						<option value="4">4 weeks</option>
					</select> <br>
					<button type="button" class="btn btn-primary form-control"
						data-toggle="modal" data-target="#exampleModall" id="apply_now1"
						value="0" onclick="validate_apply_now()">Apply Now</button>
					<br> <br> <label id="right-below">Applying
						through volunteer Overseats gets you access to exclusive <u>travel
							scholarship</u> and a no-fee <u> fundraising plateform </u>
					</label> <br> <br>
				</form>
			</div>
		</div>
		<!-- rows div -->
	</div>
	</section>
	<!-- model section -->
	<div class="sign_up modal fade" id="exampleModall" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
		href="#myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title" id="exampleModalLabel">
						<b>SIGN UP</b>
					</h6>
				</div>
				<div class="modal-body">
					<div class="container-fluid row">
						<div id="apply_for_signup">
							<form class="form-group" name="signup" action="signup"
								method="get">
								<label class="form-group">Full Name</label> <input type="text"
									id="Full_name" name="Full_name" class="form-control" required>
								<label style="padding-top: 10px;">Project Start Date</label>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1"><img
											src="resources/images/icon3.png" /></span>
									</div>
									<input type="text" class="form-control" id="datepicker1"
										name="datepicker1">
								</div>
								<label class="form-group">Duration</label> <select
									class="form-control dur1" name="dur1" id="select_week1">
									<option value="" selected>Choose one</option>
									<option value="2">2 weeks</option>
									<option value="3">3 weeks</option>
									<option value="4">4 weeks</option>
								</select> <label class="form-group" style="padding-top: 10px;">Email</label>
								<input type="text" id="mail" class="form-control" name="mail">
								<label class="form-group" style="padding-top: 10px;">Phone</label>
								<input type="text" class="form-control"
									onkeydown="javascript: return event.keyCode == 69 ? false : true"
									id="phone" name="phone" required> <input type="hidden"
									value="575.0" name="projectCost"> <input type="hidden"
									value="2" name="projectWeeks"> <input type="hidden"
									value="${project.id}" name="projectid">
								<button type="submit" class="btn btn-primary"
									onclick="return validate_sign_up()">Sign up</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="img_gallery" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog phn_view" role="document">
			<div class="modal-content"
				style="background-color: transparent; margin-top: 9%; left: 30%">
				<div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"><img
							src="resources/images/cross.png" class="img_arrow"></span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container cmg">
						<c:forEach items="${gallery}" var="g">
							<div class="mySlides">
								<img src="resources/images/${g.images}"
									style="width: 1000px; height: 400px">
							</div>
						</c:forEach>
						<a class="prev" onclick="plusSlides(-1)"><img
							src="resources/images/left-arrow-big.png" class="img_arrow"></a>
						<a class="next" onclick="plusSlides(1)"><img
							src="resources/images/right-arrow-big.png" class="img_arrow"></a>
						<div class="row"
							style="margin-right: 0; margin-left: 0; width: 142%">
							<c:set var="j" value="1"></c:set>
							<c:forEach items="${gallery}" var="ga">
								<c:set var="j" value="${j+1}"></c:set>
							</c:forEach>
							<c:set var="i" value="1"></c:set>
							<c:forEach items="${gallery}" var="g">
								<div class="column">
									<img class="demo cursor" src="resources/images/${g.images}"
										style="width: 142px; height: 90px"
										onclick="currentSlide(${i})">
								</div>
								<c:set var="i" value="${i+1}"></c:set>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="footer">
		<div class="row">
			<a href="homepage"><img src="resources/images/logo_1.png"></a>
			<span> <a href="contact">CONTACT US</a> <a href="faq">FAQ</a>
			</span>
		</div>
	</div> -->
	<!-- Script Part -->
	<script type="text/javascript" src="resources/js1/validate.js"></script>
	<script type="text/javascript" src="resources/js/validation.js"></script>
	<script type="text/javascript">
		$('#owl-table')
				.owlCarousel(
						{
							nav : true,
							navText : ['<img src="resources/images/left-white-arrow.png">',
									'<img src="resources/images/right-orange-arrow.png">'],
							responsive : {
								0 : {
									items : 2
								},

								425 : {
									items : 2
								},
								769 : {
									items : 3
								},
								1024 : {
									items : 4
								}
							}
						})
	</script>
	<script type="text/javascript">
         $( function() {
    $( "#datepicker" ).datepicker();
	  } );
         $( function() {
        	    $( "#datepicker1" ).datepicker();
        	  } );
</script>
	<script type="text/javascript">
     $(document).ready(function(){
        $('#apply_now1').click(function(){
        var prev_date = $('#datepicker').val();
        var prev_select = $('#select_week').val();
        $('#datepicker1').val(prev_date);
        $('#select_week1').val(prev_select);
      })
     });    
    </script>
	<script type="text/javascript">
   		$(document).ready(function(){
				$('#d1').change(function() {
					var idx = $(this).val();
					$.ajax({
						url: "index/ProjectCost",
						type: "GET",
						data: {	
							id:idx
						},
						 dataType: "json",
						success: function(result){
							if(result==0){
								$("#c1").html(" ");
							}else{
							$("#c1").html(result);	
							}
						}
					})
				})			
		});
   </script>
	<script type="text/javascript">
   $(window).scroll(function() {
          if($(window).scrollTop() > 500){
            $(".scroll_2").addClass('small-header-1');
            $(".scroll_2").css("border-top","none");
             $(".scroll_2").css("left","0");
            $(".scroll_2").addClass('dis-blk');
            $(".scroll_2").removeClass('dis-none');
            $
          }
          else{
            $(".scroll_2").removeClass('small-header-1');
            $(".scroll_2").css("border-top","1px solid #ccc");            
          }
    });
   </script>
	<script type="text/javascript">
    $(document).ready(function(){
        $(window).scroll(function(){
        if ($(window).scrollTop() >= 10) {
            $('#menu').addClass('fixed-header2');
            $('nav ul li a').css("color","#00acc1");
            $('.color-logo1').attr('src','resources/images/logo.png');
            $('header a').css("color","#00acc1");
            $('.right-block').css("margin-right","10%");
        }
        else {
            $('#menu').removeClass('fixed-header2');
            $('.color-logo1').attr('src','resources/images/logo_1.png'); 
            $('header a').css("color","#FFFFFF");
            $('.right-block').css("margin-right","0%");
        }
    });
    $(window).scroll(function(){
        if ($(window).scrollTop() >= 300) {
            $('.right1').addClass('right-col-scroll');
        }
        else {
            
            $('.right1').removeClass('right-col-scroll');     
        }
    });
    });    
</script>
	<script>
var slideIndex = 1;
showSlides(slideIndex);
function plusSlides(n) {
  showSlides(slideIndex += n);
}
function currentSlide(n) {
  showSlides(slideIndex = n);
}
function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}
</script>
	<script type="text/javascript">
	$('div#intro1').css("background-image","linear-gradient(to bottom, rgba(0, 0, 0, 0)0%, rgba(0, 0, 0, 0.06) 10%, rgba(0, 0, 0, 0.15) 22%,rgba(0, 0, 0, 0.72) 75%, rgba(0, 0, 0, 0.84) 89%, rgba(0, 0, 0, 0.91) 100%),url('resources/images/${project.image}')");
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