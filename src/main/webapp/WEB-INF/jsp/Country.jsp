<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Country Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="shortcut icon" href="/VolunteerOverseas/resources/images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/VolunteerOverseas/resources/css/main.css">
</head>
<body>
	<div class="wrapper admin-wrapper">
		<jsp:include page="Header.jsp"></jsp:include>
		<main>
			<section class="admin-section">
				<div class="container">
					<div class="with-box-shadow ">
						<div class="section-title text-center row">
							<div class="col-sm-12"><center><h1>Country and City</h1></center></div>
						</div>
						
						<form name="myform" action="AddCategory" method="POST" enctype="multipart/form-data">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Country Name</label>
										<input id="org_cat" type="text" placeholder="Enter Category" 
												class="form-control onFocus ui-autocomplete-input" 
												autocomplete="off" data-placeholder="Enter Category" name="category">
										<input type="hidden" id="page" name="page" value="${page}">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Country Name</label>
										<input id="org_cat" type="text" placeholder="Enter Category" 
												class="form-control onFocus ui-autocomplete-input" 
												autocomplete="off" data-placeholder="Enter Category" name="category">
										<input type="hidden" id="page" name="page" value="${page}">
									</div>
								</div>
								<div class="col-sm-3"></div>
								<div class="col-sm-12">
									<div class="form-group">
										<div class="button-outer text-center">
											<!-- <button type="button" class="btn btn-fill btn-large" onclick="return validate_Admin_Organization()">SUBMIT</button>
											<button type="button" class="btn btn-fill btn-large">CANCLE</button> -->
											<input type="submit" class="btn btn-fill btn-large" value="ADD">
											<!-- <input type="reset" class="btn btn-fill btn-large" value="CANCLE"> -->
										</div>		
									</div>	
								</div>
							</div>
						</form>
						<div class="table-responsive">
							<table id="projectTable"
									class="table admin-table table-bordered table-striped">
						  		<tr>
							  		<th>Country Name</th>
							  		<th>City Name</th>
							  		<!-- <th></th> -->
							  	</tr>
								<c:forEach items="${CityList}" var="city">
									<tr>
										<c:set var="countryname" value="${city.countryCity.name}"/>
										<c:if test="${countryname eq countryname1}">
											<td></td>
										</c:if>
										<c:if test="${countryname ne countryname1}">
											</tr><tr style="height:36px"><td></td><td></td></tr><tr>
											<td align="center" style="color:#e53b51">${city.countryCity.name}</td>
											<c:set var="countryname1" value="${city.countryCity.name}"/>
										</c:if>
										<td style="color:#000">${city.name}</td>
									</tr>
								</c:forEach> 
							</table>
						</div>
					</div>
				</div>
			</section>
		</main>
	</div>
	<jsp:include page="JavaScript.jsp"></jsp:include>
</body>
</html>