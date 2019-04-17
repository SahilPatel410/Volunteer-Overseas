<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Volunteer Overseas</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<link rel="shortcut icon" href="resources/images/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="resources/css/main.css">
		<link rel="stylesheet" type="text/css" href="resources/css/progress-step.css"/>
		<!-- <script type="text/javascript" src="resources/js/main.js"></script> -->
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
							                <li class="2">Project Gallery</li>
							                <li class="3">Project Costs</li>
							                <li class="4">Project Includes</li>
							                <li class="5">Project Dates</li>
							            </ul>
							         </form>
								</div>
							</div> 
							<div class="section-title text-center">
								<h1>Project Details</h1>
								<div class="button-outer">
									<form action="ProjectListing/1">
										<input type="submit" class="btn btn-fill" value="View All Project">
									</form>
									<!-- <button type="button" class="btn btn-fill" id="view">View All Project</button> -->
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
											<label>Title</label>
											<div class="input-group">
												<input id="title" type="text"
													class="form-control onFocus ui-autocomplete-input" name="title" value="${project.title}"
													autocomplete="off" onblur="validate_name(this)" oninput="validate_name(this)">
												<span id="stitle" class="input-group-addon" style="background-color: #FFF;">
													<i id="oktitle" class="d-none"></i>
													<i id="notoktitle" class="d-none"></i>
												</span>
											</div>
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
											<label>Minimum age</label>
											<div class="input-group">
												<input id="min_age" type="number" placeholder="min-age"
													class="form-control onFocus ui-autocomplete-input" value="${project.min_age}"
													autocomplete="off" data-placeholder="min-age" name="min_age"
													onblur="validate_name(this)" oninput="validate_name(this)">
												<span id="smin_age" class="input-group-addon" style="background-color: #FFF;">
													<i id="okmin_age" class="d-none"></i>
													<i id="notokmin_age" class="d-none"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Maximum age</label>
											<div class="input-group">
												<input id="max_age" type="number" placeholder="max-age"
													class="form-control onFocus ui-autocomplete-input" value="${project.max_age}"
													autocomplete="off" data-placeholder="max-age" name="max_age"
													onblur="valid_age(this)" oninput="valid_age(this)">
												<span id="smax_age" class="input-group-addon" style="background-color: #FFF;">
													<i id="okmax_age" class="d-none"></i>
													<i id="notokmax_age" class="d-none"></i>
												</span>
											</div>
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
											<label>Project Video URL</label>
											<div class="input-group">
												<input id="video_url" type="text" class="form-control onFocus ui-autocomplete-input"
													name="project_video_url" autocomplete="off"
													onblur="validate_web(this)" oninput="validate_web(this)">
												<span id="svideo_url" class="input-group-addon" style="background-color: #FFF;">
													<i id="okvideo_url" class="d-none"></i>
													<i id="notokvideo_url" class="d-none"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Country&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								Add new Country 
								<a onclick="AddCountry()" style="cursor: pointer;">
								<img src="resources/images/add.png" height=20 width=35></a></label>
											
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
									<form enctype ="multipart/form-data" id="formid">
								<div class="col-sm-6 d-none" id="cname">
									<div class="form-group">
										<label>Country Name</label> <input id="countryName"
											type="text" class="form-control onFocus ui-autocomplete-input" 
											name="countryName" autocomplete="off">
									</div>
								</div>
								<div class="col-sm-6 d-none" id="cimage">
									<div class="form-group">
										<label>Country Image</label>
										<%-- <img width=45 height=45 alt="Sorry.. :)" src='<c:url value="resources/AdminUploads/Images/${project.image}"/>'> --%>
										 <input id="countryimage" type="file"
											class="form-control onFocus ui-autocomplete-input"
											autocomplete="off" name="countryimage">
									</div>
								</div>
								<div class="col-sm-12 d-none" id="csubmit">
										<div class="form-group">
											<div class="button-outer text-center">
													
													<button type="button" class="btn btn-fill btn-large" id="addCountry">Add</button>
													
											</div>
										</div>
								</div>
							</form>
									<div class="col-sm-6">
										<div class="form-group">
											<label>City</label>
											<select class="form-control" id="city" name="city_id"><option selected disabled>Select</option></select>
											<!-- <select class="form-control" id="countrydemo" name="city_id"><option selected disabled>Select</option></select> -->
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Volunteer House Address</label>
											<div class="input-group">
												<input id="house_address" type="text" class="form-control onFocus ui-autocomplete-input"
														value="${project.volunteer_house_address}"
														name="volunteer_house_address" autocomplete="off"
														onblur="validate_name(this)" oninput="validate_name(this)">
												<span id="shouse_address" class="input-group-addon" style="background-color: #FFF;">
													<i id="okhouse_address" class="d-none"></i>
													<i id="notokhouse_address" class="d-none"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Volunteer House Description</label>
											<div class="input-group">
												<input id="house_description"
													type="text" class="form-control onFocus ui-autocomplete-input" value="${project.volunteer_house_description}"
													name="volunteer_house_description" autocomplete="off"
													onblur="validate_name(this)" oninput="validate_name(this)">
												<span id="shouse_description" class="input-group-addon" style="background-color: #FFF;">
													<i id="okhouse_description" class="d-none"></i>
													<i id="notokhouse_description" class="d-none"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Volunteer Work Address</label>
											<div class="input-group">
												<input id="work_address"
													type="text" class="form-control onFocus ui-autocomplete-input" value="${project.volunteer_work_address}"
													name="volunteer_work_address" autocomplete="off"
													onblur="validate_name(this)" oninput="validate_name(this)">
												<span id="swork_address" class="input-group-addon" style="background-color: #FFF;">
													<i id="okwork_address" class="d-none"></i>
													<i id="notokwork_address" class="d-none"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Volunteer Work Description</label>
											<div class="input-group">
												<input id="work_description"
													type="text" class="form-control onFocus ui-autocomplete-input" value="${project.volunteer_work_description}"
													name="volunteer_work_description" autocomplete="off"
													onblur="validate_name(this)" oninput="validate_name(this)">
												<span id="swork_description" class="input-group-addon" style="background-color: #FFF;">
													<i id="okwork_description" class="d-none"></i>
													<i id="notokwork_description" class="d-none"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Nearest Airport Address</label>
											<div class="input-group">
												<input id="airport_address"
													type="text" class="form-control onFocus ui-autocomplete-input" value="${project.nearest_airport_address}"
													name="nearest_airport_address" autocomplete="off"
													onblur="validate_name(this)" oninput="validate_name(this)">
												<span id="sairport_address" class="input-group-addon" style="background-color: #FFF;">
													<i id="okairport_address" class="d-none"></i>
													<i id="notokairport_address" class="d-none"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>Cost Description</label>
											<div class="input-group">
												<input id="cost_description" type="text"
													class="form-control onFocus ui-autocomplete-input" value="${project.cost_description}"
													name="cost_description" autocomplete="off"
													onblur="validate_name(this)" oninput="validate_name(this)">
												<span id="scost_description" class="input-group-addon" style="background-color: #FFF;">
													<i id="okcost_description" class="d-none"></i>
													<i id="notokcost_description" class="d-none"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<label>Project StartDate Description</label>
											<textarea id="project_startdate_description" class="form-control" value="${project.project_startdate_description}"
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
													<input type="submit" class="next btn btn-fill btn-large"
														value="SUBMIT">
												</div>
											</div>
										</div>
									</div>
								</div>
							<form>
						</div>
					</div>
				</section>
			</main>
		</div>
		<jsp:include page="JavaScript.jsp"></jsp:include>
		
		<script type="text/javascript" src="resources/js/progress-step.js"></script>
		<script type="text/javascript">
		/* $(document).ready(function() {
			$('#submitFirst').click(function() {
				window.location.href = 'ProjectGallery';
				return false;
			});
		}); */
		
		function fun(){
			window.onbeforeunload = function() {
			    localStorage.setItem("organization_id", $('#organization_id').val());
			    localStorage.setItem("activity_id", $('#activity_id').val());
			    localStorage.setItem("category_id", $('#category_id').val());
			    localStorage.setItem("title", $('#title').val());
			    localStorage.setItem("image", $('#image').val());
			    localStorage.setItem("min_age", $('#min_age').val());
			    localStorage.setItem("max_age", $('#max_age').val());
			    localStorage.setItem("One", $('#One').val());
			    localStorage.setItem("Two", $('#Two').val());
			    localStorage.setItem("Three", $('#Three').val());
			    localStorage.setItem("video_url", $('#video_url').val());
			    localStorage.setItem("house_address", $('#house_address').val());
			    localStorage.setItem("house_description", $('#house_description').val());
			    localStorage.setItem("work_address", $('#work_address').val());
			    localStorage.setItem("work_description", $('#work_description').val());
			    localStorage.setItem("airport_address", $('#airport_address').val());
			    localStorage.setItem("cost_description", $('#cost_description').val());
			    localStorage.setItem("project_startdate_description", $('#project_startdate_description').val());
			    localStorage.setItem("isaffordable", $('#isaffordable').val());
			}
			//window.location.replace(location);//window.location.reload();//window.reload();
			window.onload = function() {
			    var organization_id = localStorage.getItem("organization_id");
			    if (organization_id !== null) $('#organization_id').val(organization_id);
			    var activity_id = localStorage.getItem("activity_id");
			    if (activity_id !== null) $('#activity_id').val(activity_id);
			    var category_id = localStorage.getItem("category_id");
			    if (category_id !== null) $('#category_id').val(category_id);
			    var title = localStorage.getItem("title");
			    if (title !== null) $('#title').val(title);
			    var image = localStorage.getItem("image");
			    if (image !== null) $('#image').val(image);
			    var min_age = localStorage.getItem("min_age");
			    if (min_age !== null) $('#min_age').val(min_age);
			    var max_age = localStorage.getItem("max_age");
			    if (max_age !== null) $('#max_age').val(max_age);
			    var One = localStorage.getItem("One");
			    if (One !== null) $('#One').val(One);
			    var Two = localStorage.getItem("Two");
			    if (Two !== null) $('#Two').val(Two);
			    var Three = localStorage.getItem("Three");
			    if (Three !== null) $('#Three').val(Three);
			    var video_url = localStorage.getItem("video_url");
			    if (video_url !== null) $('#video_url').val(video_url);
			    var house_address = localStorage.getItem("house_address");
			    if (house_address !== null) $('#house_address').val(house_address);
			    var house_description = localStorage.getItem("house_description");
			    if (house_description !== null) $('#house_description').val(house_description);
			    var work_address = localStorage.getItem("work_address");
			    if (work_address !== null) $('#work_address').val(work_address);
			    var work_description = localStorage.getItem("work_description");
			    if (work_description !== null) $('#work_description').val(work_description);
			    var airport_address = localStorage.getItem("airport_address");
			    if (airport_address !== null) $('#airport_address').val(airport_address);
			    var cost_description = localStorage.getItem("cost_description");
			    if (cost_description !== null) $('#cost_description').val(cost_description);
			    var project_startdate_description = localStorage.getItem("project_startdate_description");
			    if (project_startdate_description !== null) $('#project_startdate_description').val(project_startdate_description);
			    var isaffordable = localStorage.getItem("isaffordable");
			    if (isaffordable !== null) $('#isaffordable').val(isaffordable);
		}}
		function AddCountry(){
			$('#cname').removeClass("d-none");
			$('#cimage').removeClass("d-none");
			$('#csubmit').removeClass("d-none");
		}

		$(document).ready(function(){
			$("textarea#One").val("${project.overview_description}");
			$("textarea#Two").val("${project.accommodation_description}");
			$("textarea#Three").val("${project.imapact_description}");
			var iofile=document.getElementById('countryimage');	 
			 var filedata;
			 var filename;
			 iofile.addEventListener("change", function(event){
					 var files = event.target.files;
		            var file = files[0];
		            filename = file.name;
		            
		            var picReader = new FileReader();
		            picReader.addEventListener("load",function(event){
		            	filedata = event.target.result;
		            });
		            picReader.readAsDataURL(file);
			    });
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
				 if(action=="addCountry"){
					var cname=$('#countryName').val();
					$.ajax({
						url:"AddCountry",
						data: {filename:filename,
								filedata:filedata,
								cname:cname
						},
						type:"POST",
						dataType: "json",
						success:function(result){
							/* console.log(result);
							console.log("Id : "+  result.id+"\nImage : "+result.name);
							$("#country").append("<option selected>"+result.id+"</option>");
							$("ul#dk3-listbox").append('<li class="dk-option  dk-option-selected" data-value="'+result.id+'" text="'+result.name+'" role="option" aria-selected="true" id="dk3-'+result.id+'">'+result.name+'</li>');
							$("#dk3-country").append('<div class="dk-selected " tabindex="0" id="dk3-combobox" aria-live="assertive" aria-owns="dk3-listbox" role="combobox" aria-activedescendant="dk3-'+result.id+'">'+result.name+'</div>');
							 */$('#cname').addClass("d-none");
							$('#cimage').addClass("d-none");
							$('#csubmit').addClass("d-none");
							fun();
						}
						
					 })
				}
			})
		});
		
		/* <div class="dk-selected " tabindex="0" id="dk3-combobox" aria-live="assertive" aria-owns="dk3-listbox"
		role="combobox" aria-activedescendant="dk3-70">fdd</div> */
		
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
					$("#city").append("<option selected disabled>Select</option>");
					$.each(result, function (key, value) {
						//var option = new Option(value, key);
						//$('#city').append($(option));
						//$("#city").append(new Option(value, key));
						$("#city").append("<option value="+key+">"+value+"</option>");
					}) 
				}	
			});
		});
	</script>
</body>
</html>