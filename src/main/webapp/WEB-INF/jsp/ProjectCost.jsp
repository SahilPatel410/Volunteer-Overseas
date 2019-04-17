<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<link rel="stylesheet" type="text/css" href="resources/css/progress-step.css"/>
</head>
<body>
<div class="wrapper admin-wrapper ">
		<jsp:include page="Header.jsp"></jsp:include>
		<main> 
		<section class="admin-section">
		<div class="container">
			<div class="with-box-shadow ">
				<div class="row">
					<div class="col-md-12">
						<form id="msform">
							<!-- progressbar -->
							<ul id="progressbar">
								<li class="active">Personal Details</li>
								<li class="active">Project Gallery</li>
								<li class="active">Project Costs</li>
								<li class="4">Project Includes</li>
								<li class="5">Project Dates</li>
							</ul>
						</form>
					</div>
				</div>
				<div class="section-title text-center">
					<h1>Project Costs</h1>
				</div>
					<form action="ProjectCost"  method="POST" id="projectForm">
					<div class="row">
						<input type="hidden" name="pid" value="${project.id}">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Name</label> <input id="name" type="text" disabled
									class="form-control onFocus ui-autocomplete-input" name="name" value="${project.title}"
									autocomplete="off">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Number of Weeks</label> <input id="numberOfWeeks" type="number"
									class="form-control onFocus ui-autocomplete-input" name="numberOfWeeks"
									value="" autocomplete="off">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Cost</label> <input id="cost" type="number"
									class="form-control onFocus ui-autocomplete-input" name="cost" value=""
									autocomplete="off">
							</div>
						</div>
						<div class="col-sm-12">
								<div class="form-group">
									<div class="button-outer text-center">
										<input type="submit" class="next btn btn-fill btn-large"
											value="SUBMIT">
									</div>
								</div>
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
		</section>
		 </main>
	</div>
	<jsp:include page="JavaScript.jsp"></jsp:include>
<!-- <script type="text/javascript" src="resources/js/jquery.js"></script>
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
		<script type="text/javascript" src="resources/js/validation.js"></script> -->
		
		<script type="text/javascript" src="resources/js/progress-step.js"></script>
	
</body>
</html>