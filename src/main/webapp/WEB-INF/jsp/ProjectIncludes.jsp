<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<link rel="stylesheet" type="text/css" href="resources/css/progress-step.css"/>
		<style type="text/css">
			[type="radio"]:not(:checked), [type="radio"]:checked{
				opacity: 1;
			}
		</style>
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
											<li class="active">Project Includes</li>
											<li class="5">Project Dates</li>
										</ul>
									</form>
								</div>
							</div>
							<div class="section-title text-center">
								<h1>Project Included</h1>
							</div>
							<form action="ProjectIncludes" method="POST" id="projectForm">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Name</label>
											<input type="hidden" id="pid" name="pid" value="${project.id}">
											<input id="name" type="text" disabled class="form-control onFocus ui-autocomplete-input"
												name="name" value="${project.title}">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Description</label>
											<input id="description" type="text"
												class="form-control onFocus ui-autocomplete-input"
												autocomplete="off" name="description">
										</div>
									</div>
									<div class="col-sm-6">
										<label>Is Included</label>
										<div class="radio col-md-12" style="display: inline-block;">
											<label class="col-md-2" style="display: inline;">
												<input type="radio" name="isIncluded" value="Yes">
											Yes</label>
											<label class="col-md-2" style="display: inline;">
												<input type="radio" name="isIncluded" value="No">
											No</label>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<div class="button-outer text-center">
												<button type="button" id="add" class="btn btn-fill btn-large">Add</button>
												<input type="submit" class="next btn btn-fill btn-large" value="SUBMIT">
											</div>
										</div>
									</div>
								</div>
							</form>
							<div class="table-responsive">
								<table id="projectTable" class="table admin-table table-bordered table-striped">
									<tr>
										<th>ID</th>
										<th>Description</th>
										<th>Yes/No</th>
										<th>Remove</th>
									</tr>
									<c:if test="${projectIncludeChecks ne null}">
										<c:forEach items="${projectIncludeChecks}" var="projectIncludeChecks">
											<tr>
												<td>${projectIncludeChecks.id}</td>
												<td>${projectIncludeChecks.description}</td>
												<td>${projectIncludeChecks.is_included}</td>
												<td>
													<div class="button-outer">
													<button type='button' class='btn btn-fill' id='remove' 
															name="${projectIncludeChecks.id}">Remove</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</table>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$(document).on("click", "button", function() {
				var action = this.id;
				var description = $("#description").val();
				var choose = $("input[name='isIncluded']:checked").val();
				var pid = $("#pid").val();
				if (action == "add") {
					$.ajax({
						url : 'addDesc',
						type : "POST",
						data : {
							description : description,
							choose : choose,
							pid : pid
						},
						success : function(result) {
							console.log(result);
							$("#projectTable").append( "<tr><td>"+result.id+"</td><td>"+result.description+"</td><td>"
									+result.is_included+"</td><td>"
									+"<div class='button-outer'>"
									+"<button type='button' class='btn btn-fill' id='remove' name='"+result.id+"'>Remove</button>"
									+"</div></td></tr>" );
							$("#description").val("");
							$("input[name='isIncluded']:checked").prop("checked", false);
							alert("Successfully Added.");
						},
						error : function() {
							alert("Something went wrong..!!");
						},
					})
				}
				if (action == "remove") {
					var rid = this.name;
					$.ajax({
						url : "removeDesc",
						data : {
							rid : rid
						},
						success : function() {
							alert("Successfully Removed.");
							location.reload();//window.location.href = 'project?id='+pid;
						},
						error : function() {
							confirm("Something went wrong..!!");
						}
					})
				}
			});
		});
	</script>
</body>
</html>