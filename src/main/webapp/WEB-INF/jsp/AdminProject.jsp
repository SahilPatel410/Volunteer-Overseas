<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<title>Admin Organization</title>
<link rel="shortcut icon" href="resources/images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
	<div class="wrapper admin-wrapper">
		<jsp:include page="Header.jsp"></jsp:include>
		<main>
		 <section class="admin-section">
		<div class="container">
			<div class="with-box-shadow ">
				<div class="section-title text-center">
					<h1 style="color: #00acc1">Project Details</h1>
					<div class="button-outer">
						<form action="ProjectDetails">
							<input type="button" class="btn btn-fill" value="View All Project">
						</form>
					</div>
				</div>
				<form action="AddProjectDetails" method="POST" id="projectForm">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Organization</label> 
								<select class="custom-dropdown"	id="organization_id" name="organization_id">
									<c:set var="orgname" value="${project.organization.id}"></c:set>
									<c:forEach items="${organizationList}" var="org">
										<c:if test="${org.id == orgname}">
											<option value="${org.id}" selected>${org.name}</option>
										</c:if>
										<c:if test="${org.id != orgname}">
											<option value="${org.id}">${org.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Activity</label> 
								<select class="custom-dropdown"	id="activity_id" name="activity_id">
									<c:set var="actid" value="${project.activity.id}"></c:set>
									<c:forEach items="${ActivitiesList}" var="activity">
										<c:if test="${activity.id == actid}">
											<option value="${activity.id}" selected>${activity.name}</option>
										</c:if>
										<c:if test="${activity.id != actid}">
											<option value="${activity.id}">${activity.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Category</label>
								<select class="custom-dropdown"	id="category_id" name="category_id">
									<c:set var="catid" value="${project.category.id}"></c:set>
									<c:forEach items="${CategoriesList}" var="category">
										<c:if test="${category.id == catid}">
											<option value="${category.id}" selected>${category.name}</option>
										</c:if>
										<c:if test="${category.id != catid}">
											<option value="${category.id}">${category.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Title</label> <input id="title" type="text"
									class="form-control onFocus ui-autocomplete-input" name="title" value="${project.title}"
									autocomplete="off">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Project Image</label>
								<%-- <img width=45 height=45 alt="Sorry.. :)" src='<c:url value="resources/AdminUploads/Images/${project.image}"/>'> --%>
								 <input id="image" type="file"
									class="form-control onFocus ui-autocomplete-input"
									autocomplete="off" value="${project.image}" name="image">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Minimum age</label> <input id="min_age" type="number"
									placeholder="min-age"
									class="form-control onFocus ui-autocomplete-input" value="${project.min_age}"
									autocomplete="off" data-placeholder="min-age" name="min_age" >
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Maximum age</label> <input id="max_age" type="number"
									placeholder="max-age"
									class="form-control onFocus ui-autocomplete-input" value="${project.max_age}"
									autocomplete="off" data-placeholder="max-age" name="max_age">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Overview Description</label>
								<textarea id="One" class="form-control" name="overview_description" value="${project.overview_description}"></textarea>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Accomodation Description</label>
								<textarea id="Two" class="form-control" name="accomodation_description" value="${project.accommodation_description}"></textarea>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Impact Description</label>
								<textarea id="Three" class="form-control" name="impact_description" value="${project.imapact_description}"></textarea>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Project Video URL</label> <input id="title" type="text"
									class="form-control onFocus ui-autocomplete-input"
									name="project_video_url" autocomplete="off">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Country</label>
								<select class="custom-dropdown"	id="country" name="country_id">
									<c:set var="countryid" value="${project.country.id}"></c:set>
									<c:forEach items="${CountryList}" var="country">
										<c:if test="${country.id == countryid}">
											<option value="${country.id}" selected>${country.name}</option>
										</c:if>
										<c:if test="${country.id != countryid}">
											<option value="${country.id}">${country.name}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>City</label>
								<select class="custom-dropdown" id="city" name="city_id">
									
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Volunteer House Address</label> <input id="title"
									type="text" class="form-control onFocus ui-autocomplete-input" value="${project.volunteer_house_address}"
									name="volunteer_house_address" autocomplete="off">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Volunteer House Description</label> <input id="title"
									type="text" class="form-control onFocus ui-autocomplete-input" value="${project.volunteer_house_description}"
									name="volunteer_house_description" autocomplete="off">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Volunteer Work Address</label> <input id="title"
									type="text" class="form-control onFocus ui-autocomplete-input" value="${project.volunteer_work_address}"
									name="volunteer_work_address" autocomplete="off">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Volunteer Work Description</label> <input id="title"
									type="text" class="form-control onFocus ui-autocomplete-input" value="${project.volunteer_work_description}"
									name="volunteer_work_description" autocomplete="off">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Nearest Airport Address</label> <input id="title"
									type="text" class="form-control onFocus ui-autocomplete-input" value="${project.nearest_airport_address}"
									name="nearest_airport_address" autocomplete="off">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Cost Description</label> <input id="title" type="text"
									class="form-control onFocus ui-autocomplete-input" value="${project.cost_description}"
									name="cost_description" autocomplete="off">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Project StartDate Description</label>
								<textarea class="form-control" value="${project.project_startdate_description}"
									name="project_startdate_description"></textarea>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>Is Affordable</label> <select class="custom-dropdown"
										id="isaffordable" name="is_affordable">
										<option>yes</option>
										<option>no</option>
									</select>
								</div>
							</div>
							<input type="hidden" value=1 name="status">
							<c:if test="${project.created_at ne null}">
								<input type="text" value="<%= (new java.util.Date()).toLocaleString()%>" name="created_at">
							</c:if>
							<input type="text" value="<%= (new java.util.Date()).toLocaleString()%>" name="updated_at">

							<div class="col-sm-12">
								<div class="form-group">
									<div class="button-outer text-center">
										<!-- <button type="button" class="btn btn-fill btn-large" onclick="return validate_Admin_Project()">SUBMIT</button> -->
										<!-- <button type="button" class="btn btn-fill btn-large" onclick="org">SUBMIT</button> -->
										<input type="submit" class="btn btn-fill btn-large"
											value="SUBMIT">
									</div>
								</div>
							</div>
						</div>

					</div>
					<form>
			</div>
		</div>
		</section> </main>
	</div>
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/fastclick.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/modernizr.js"></script>
	<script type="text/javascript" src="resources/js/respond.min.js"></script>
	<script type="text/javascript" src="resources/js/dropkick.min.js"></script>
	<script type="text/javascript" src="resources/js/owl.carousel.min.js"></script>
	<script type="text/javascript"
		src="resources/js/owl.carousel2.thumbs.min.js"></script>
	<script type="text/javascript"
		src="resources/js/imagesloaded.pkgd.min.js"></script>
	<script type="text/javascript"
		src="resources/js/jquery-imagefill-min.js"></script>
	<script type="text/javascript" src="resources/js/swiper.jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/select2.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="resources/js/nouislider.min.js"></script>
	<script type="text/javascript"
		src="resources/js/jquery.waypoints.min.js"></script>
	<script type="text/javascript" src="resources/js/wNumb.js"></script>
	<script type="text/javascript" src="resources/js/jquery.sticky.js"></script>
	<script type="text/javascript" src="resources/js/general.js"></script>
	<script type="text/javascript" src="resources/js/validation.js"></script>
	<script type="text/javascript">


	$(document).ready(function(){
		alert("${project.overview_description}");
		$("textarea#One").val("${project.overview_description}");
		$("textarea#Two").val("${project.accommodation_description}");
		$("textarea#Three").val("${project.imapact_description}");
		$(document).on("click","button",function(){
			var action=this.id;
			if(action=="view"){
				$.ajax({
					url:"ProjectDetails",
					success:function(result){
						window.location.href='ProjectDetails';
					}	
				}) 
			}
		})
	});
	
	
	$("#country").change(function(){
		var countryId = $(this).val();
		$.ajax({
				url: "getCities",
				type: "POST",
				data: {	
					countryId: countryId
				},
				 dataType: "json",
				success: function(result){
					 
							    $('#city').empty();
					 $.each(result, function (key, value) {  
						$("#city").append("<option value="+key+">"+value+"</option>");  
                    }) 
                 }	
			});
});
</script>

</body>
</html>