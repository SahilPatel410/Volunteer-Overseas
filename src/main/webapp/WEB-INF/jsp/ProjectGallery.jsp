<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
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
										<li class="3">Project Costs</li>
										<li class="4">Project Includes</li>
										<li class="5">Project Dates</li>
									</ul>
								</form>
							</div>
						</div>
						<div class="section-title text-center">
							<h1>Project Gallery</h1>
						</div>
						<form action="ProjectGallery" method="POST" id="projectForm" enctype="multipart/form-data"> <!-- action="ProjectGallery" -->
						<!-- <form method="POST" id="projectForm" action="addGallery" enctype="multipart/form-data"> -->
							<input id="num" type="text" name="num">
							<div class="row">
								<input type="hidden" name="pid" value="${project.id}">
								<div class="col-sm-12">
									<label>Images name</label>
									<div class="gal"></div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Name</label> <input id="name" type="text" disabled
											class="form-control onFocus ui-autocomplete-input" name="name" value="${project.title}"
											autocomplete="off">
									</div>
								</div>
								<div class="col-sm-6" id="divimages">
									<div class="form-group">
										<label>Project Image</label>
										<%-- <img width=45 height=45 alt="Sorry.. :)" src='<c:url value="resources/AdminUploads/Images/${project.image}"/>'> --%>
										<input multiple	id="gallery-photo-add" type="file"
											class="form-control onFocus ui-autocomplete-input"
											autocomplete="off" name="image" >
									</div>
									<input type="hidden" name="totalimages" id="totalimages">
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<div class="button-outer text-center">
											<!-- <button type="button" class="btn btn-fill btn-large" onclick="return validate_Admin_Project()">SUBMIT</button> -->
											<!-- <button type="button" class="btn btn-fill btn-large" onclick="org">SUBMIT</button> -->
											<input type="submit" id="upload" class="next btn btn-fill btn-large"
												value="Upload" ><!-- value="SUBMIT"> -->
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<label>Your Images</label>
									<div class="gallery">
									</div>
									<!-- <table id="gallery" style="background-color:#ccc"></table> -->
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>
		</main>
	</div>
	<jsp:include page="JavaScript.jsp"></jsp:include>
	<script type="text/javascript" src="resources/js/progress-step.js"></script>
		<script>

		 var filesInput = document.getElementById('gallery-photo-add');
	        filesInput.addEventListener("change", function(event){
	            var files = event.target.files; //FileList object
	            var output = $("div.gallery");
	            var counter=0;
	            var fname = null;
	            var l=files.length;
	           //$("#totalimages").val(l);
	            for(var i = 0; i< files.length; i++)
	            {
	                var file = files[i];
	                fname = file.name;
	               	$("#divimages").append('<input type="hidden" value="'+fname+'" name="totalimages'+i+'" id="totalimages">');
	                //Only pics
	                if(!file.type.match('image'))
	                    continue;
	                var picReader = new FileReader();
	                picReader.addEventListener("load",function(event){
	                    $($.parseHTML('<img name='+i+' id='+counter+' name='+event.target.name+' height=200 width=200 style="margin:2px; border:2px solid red">'+
	                    				'<input type="hidden" value='+event.target.result+' name="totalimages1'+counter+'" id="totalimages1'+(counter++)+'">'))
	                    .attr('src',event.target.result).appendTo(output);
	                	/* var picFile = event.target;
	                    var tr = document.createElement("tr");
						var td = document.createElement("td");
						td.innerHTML = "<img class='thumbnail' height=220 width=220 style='margin:2px;border:2px solid red' id='"+counter+"' src='" + picFile.result + "'" +
						"title='" + picFile.name + "'/><input type='hidden' value="+picFile.result+" name='totalimages1"+counter+"' id='totalimages1"+(counter++)+"'>";
						output.insertBefore(td,null);*/
	                     });
	                //Read the image
	                picReader.readAsDataURL(file);
	            }
	            var len = $("#totalimages").val();
	            if(!len)len=0;
	            var n = parseInt(len)+parseInt(files.length);
	            $("#totalimages").val(n);
		    }); 

	</script>
		

</body>
</html>