<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=FISO-8859-1">
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
<link rel="stylesheet" href="../resources/css1/style.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css1/media.css"
	type="text/css">
<script type="text/javascript" src="../resources/js1/bootstrap.js"></script>
<script type="text/javascript" src="../resources/js1/jquery-ui.js"></script>
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
				src="../resources/images/logo.png" style="height: 50px"></a>
			<button class="navbar-toggler ttab" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse back"
				id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="work"
						style="color: #00acc1; font-size: 16px;">HOW IT WORKS<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="../contact"
						style="color: #00acc1; font-size: 16px;">CONTACT US</a></li>
				</ul>
				<%-- <form class="form-inline" action="../index1">
					<input class="btn btn-outline-success my-2 my-sm-0 login1"
						type="submit"
						style="color: #00acc1; float: right; font-size: 14px; border: 1px solid #00acc1; pointer-events: none;"
						value="Login" />
				</form> --%>
				<a class="btn my-2 my-sm-0 login1" href="../index1"
				style="color: #00acc1; float: right; font-size: 14px; border: 1px solid #00acc1;">Login</a>
			</div>
		</nav>
	</div>
	<div class="container-fluid "
		style="padding-left: 50px; padding-right: 50px; padding-top: 105px;">
		<div class="row bg-light" style="padding-top: 10px;">
			<div class="col-md-4 cvt">
				<label class="form-group" style="color: #00acc1; font-size: 14px;">cause</label>
				<c:set var="category" value="${category}"></c:set>
				<div>
					<c:forEach items="${categories}" var="categories">
						<c:if test="${categories.name ==category}">
							<div class="custom-control custom-checkbox custom-control-inline">
								<input style="background-color: #e53b51;" type="checkbox"
									class="custom-control-input" id="${categories.name}" checked>
								<label class="custom-control-label" for="${categories.name}">${categories.name}</label>
							</div>
						</c:if>
						<c:if test="${categories.name != category}">
							<div class="custom-control custom-checkbox custom-control-inline">
								<input style="background-color: #e53b51;" type="checkbox"
									class="custom-control-input" id="${categories.name}"
									name="${categories.name}"> <label
									class="custom-control-label" for="${categories.name}">${categories.name}</label>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-3 scm">
				<label class="form-group" style="color: #00acc1; font-size: 14px;">Country</label>
				<input class="form-control" type="text"
					name="search-result-textcountry" value="${location}">
			</div>
			<div class="col-md-3 acm">
				<div>
					<label style="color: #00acc1; font-size: 14px;">Activity</label>
				</div>
				<div class="form-group">
					<form method="post">
						<select class="custom-select" name="search-result-selectactivity">
							<c:forEach items="${activities}" var="activities">
								<c:set var="activity" value="${activity}"></c:set>
								<c:if test="${activities.name != activity}">
									<option value="${activities.name}">${activities.name}</option>
								</c:if>
								<c:if test="${activities.name== activity}">
									<option value="${activities.name}" selected>${activities.name}</option>
								</c:if>
							</c:forEach>
						</select>
					</form>
				</div>
			</div>
			<div class="co-xs-12 mobile_sr flex-container">
				<div style="padding-top: 40px;">
					<P style="font-size: 14px">
						<span style="color: #00acc1"> ${category} </span>in <span
							style="color: #00acc1"> ${location} </span> for <span
							style="color: #00acc1">${activity} </span> <img
							src="../resources/images/edit-icon.png"
							style="float: right; border: 1px solid #00acc1; border-radius: 0px; margin-right: 7px; height: 20px; width: 20px; margin-bottom: 19px;">
					</P>
				</div>
				<!-- For mobile -->
				<div style="padding-top: 25px">
					<button type="button" class="btn btnmf more-filters-btn"
						data-toggle="modal" data-target="#exampleModal">
						More Filters<span
							style="top: -15px; border-radius: 100%; left: 0px; background-color: #00acc1"
							class="badge badge-light">4</span>
					</button>
					<div class="modal fade more-filters" id="exampleModal"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="row">
										<button type="button" class="close" data-dismiss="modal"
											style="padding-left: 50%">&times;</button>
									</div>
									<div class="row">
										<div class="col-md-4">
											<div>
												<label style="color: #00acc1; font-size: 14px;">Start
													date(range)</label> <input type="reset" class="reset">
											</div>
											<div class="row">
												<div class="col-4">
													<select class="custom-select dpd">
														<option selected>month</option>
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
													</select>
												</div>
												<div class="col-4">
													<select class="custom-select dpd">
														<option selected>dd</option>
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
														<option value="13">13</option>
														<option value="14">14</option>
														<option value="15">15</option>
														<option value="16">16</option>
														<option value="17">17</option>
														<option value="18">18</option>
														<option value="19">19</option>
														<option value="20">20</option>
														<option value="21">21</option>
														<option value="22">22</option>
														<option value="23">23</option>
														<option value="24">24</option>
														<option value="25">25</option>
														<option value="26">26</option>
														<option value="27">27</option>
														<option value="28">28</option>
														<option value="29">29</option>
														<option value="30">30</option>
														<option value="31">31</option>
													</select>
												</div>
												<div class="col-4">
													<select class="custom-select dpd">
														<option selected>yyyy</option>
														<option value="2000">2000</option>
														<option value="2001">2001</option>
														<option value="2002">2002</option>
														<option value="2003">2003</option>
														<option value="2004">2004</option>
														<option value="2005">2005</option>
														<option value="2006">2006</option>
														<option value="2007">2007</option>
														<option value="2008">2008</option>
														<option value="2009">2009</option>
														<option value="2010">2010</option>
														<option value="2011">2011</option>
														<option value="2012">2012</option>
														<option value="2013">2013</option>
														<option value="2014">2014</option>
														<option value="2015">2015</option>
														<option value="2016">2016</option>
														<option value="2017">2017</option>
														<option value="2018">2018</option>
														<option value="2019">2019</option>
														<option value="2020">2020</option>
														<option value="2021">2021</option>
														<option value="2022">2022</option>
														<option value="2023">2023</option>
													</select>
												</div>
											</div>
											<div class="row" style="padding-top: 20px">
												<div class="col-4">
													<select class="custom-select dpd">
														<option selected>month</option>
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
													</select>
												</div>
												<div class="col-4">
													<select class="custom-select dpd">
														<option selected>dd</option>
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
														<option value="13">13</option>
														<option value="14">14</option>
														<option value="15">15</option>
														<option value="16">16</option>
														<option value="17">17</option>
														<option value="18">18</option>
														<option value="19">19</option>
														<option value="20">20</option>
														<option value="21">21</option>
														<option value="22">22</option>
														<option value="23">23</option>
														<option value="24">24</option>
														<option value="25">25</option>
														<option value="26">26</option>
														<option value="27">27</option>
														<option value="28">28</option>
														<option value="29">29</option>
														<option value="30">30</option>
														<option value="31">31</option>
													</select>
												</div>
												<div class="col-4">
													<select class="custom-select dpd">
														<option selected>yyyy</option>
														<option value="2000">2000</option>
														<option value="2001">2001</option>
														<option value="2002">2002</option>
														<option value="2003">2003</option>
														<option value="2004">2004</option>
														<option value="2005">2005</option>
														<option value="2006">2006</option>
														<option value="2007">2007</option>
														<option value="2008">2008</option>
														<option value="2009">2009</option>
														<option value="2010">2010</option>
														<option value="2011">2011</option>
														<option value="2012">2012</option>
														<option value="2013">2013</option>
														<option value="2014">2014</option>
														<option value="2015">2015</option>
														<option value="2016">2016</option>
														<option value="2017">2017</option>
														<option value="2018">2018</option>
														<option value="2019">2019</option>
														<option value="2020">2020</option>
														<option value="2021">2021</option>
														<option value="2022">2022</option>
														<option value="2023">2023</option>
													</select>
												</div>
											</div>
										</div>
										<!----------------------------------------------------------------- this is slider range------------------------------------------------------------------------ -->
										<div class="col-md-4 form-group">
											<label>Duration</label>
											<p>
												<input type="text" id="amount_min"> <input
													type="text" id="amount_max">
											</p>
											<div id="slider-range1" class="price-filter-range"
												name="rangeInput"></div>
										</div>
										<!------------------------------------- this is end of slider --------------------------------------------->
										<div class="col-md-4">
											<div>
												<label style="color: #00acc1; font-size: 14px;">Minimum
													Age</label>
											</div>
											<div style="padding-top: 15px">
												<form class="form-group" method="post">
													<input type="number" class="form-control" name="minage" />
												</form>
											</div>
										</div>
									</div>
								</div>
								<div>
									<div class="container see_results">
										<div class="row">
											<a href="moreFilter/1"><button type="submit"
													class="btn btn-secondary form-control">See Results</button></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- hide when mobile view -->
			<div class="col-md-2 desk1">
				<button type="button" class="btn btnmf more-filters-btn db"
					data-toggle="modal" data-target="#exampleModal1"
					style="float: right;">
					More Filters <span
						style="position: relative; top: -15px; border-radius: 100%; left: 20px; background-color: #00acc1"
						class="badge badge-light">4</span>
				</button>
				<button type="button" class="btn btntab more-filters-btn"
					data-toggle="modal" data-target="#exampleModal1"
					style="float: right;">
					<b style="margin-top: 20px">...</b> <span
						style="position: relative; top: -20px; left: 2px; background-color: #00acc1; border-radius: 100%"
						class="badge badge-light">4</span>
				</button>
				<div class="modal fade" id="exampleModal1" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog " role="document">
						<div class="modal-content side_tab">
							<div class="modal-body">
								<form action="../moreFilter/1" method="post">
									<div class="d-none">
										<c:forEach items="${categories}" var="categories">
											<c:if test="${categories.name ==category}">
												<div class="custom-control custom-checkbox custom-control-inline">
													<input style="background-color: #e53b51;" type="checkbox"
														name="searchbar-category" value="${categories.name}"
														class="custom-control-input" id="${categories.name}"
														checked> <label class="custom-control-label"
														value="${categories.name}">${categories.name}</label> </input>
												</div>
											</c:if>
											<c:if test="${categories.name != category}">
												<div
													class="custom-control custom-checkbox custom-control-inline">
													<input style="background-color: #e53b51;" type="checkbox"
														class="custom-control-input" id="${categories.name}"
														name="${categories.name}"> <label
														class="custom-control-label" for="${categories.name}">${categories.name}</label>
												</div>
											</c:if>
										</c:forEach>
										<input class="form-control" type="text"
											name="searchbar-location" value="${location}"> <select
											class="custom-select" name="searchbar-activity">
											<c:forEach items="${activities}" var="activities">
												<c:set var="activity" value="${activity}"></c:set>
												<c:if test="${activities.name != activity}">
													<option value="${activities.name}">${activities.name}</option>
												</c:if>
												<c:if test="${activities.name== activity}">
													<option value="${activities.name}" selected>${activities.name}</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="row">
										<div class="col-lg-4">
											<div>
												<label style="color: #00acc1; font-size: 14px;">Start
													date(range)</label> <input type="reset" class="reset">
											</div>
											<div class="row">
												<div class="col-4">
													<select class="custom-select" name="month">
														<option selected>month</option>
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
													</select>
												</div>
												<div class="col-4">
													<select class="custom-select" name="day">
														<option selected>dd</option>
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
														<option value="13">13</option>
														<option value="14">14</option>
														<option value="15">15</option>
														<option value="16">16</option>
														<option value="17">17</option>
														<option value="18">18</option>
														<option value="19">19</option>
														<option value="20">20</option>
														<option value="21">21</option>
														<option value="22">22</option>
														<option value="23">23</option>
														<option value="24">24</option>
														<option value="25">25</option>
														<option value="26">26</option>
														<option value="27">27</option>
														<option value="28">28</option>
														<option value="29">29</option>
														<option value="30">30</option>
														<option value="31">31</option>
													</select>
												</div>
												<div class="col-4">
													<select class="custom-select" name="year">
														<option selected>yyyy</option>
														<option value="2000">2000</option>
														<option value="2001">2001</option>
														<option value="2002">2002</option>
														<option value="2003">2003</option>
														<option value="2004">2004</option>
														<option value="2005">2005</option>
														<option value="2006">2006</option>
														<option value="2007">2007</option>
														<option value="2008">2008</option>
														<option value="2009">2009</option>
														<option value="2010">2010</option>
														<option value="2011">2011</option>
														<option value="2012">2012</option>
														<option value="2013">2013</option>
														<option value="2014">2014</option>
														<option value="2015">2015</option>
														<option value="2016">2016</option>
														<option value="2017">2017</option>
														<option value="2018">2018</option>
														<option value="2019">2019</option>
														<option value="2020">2020</option>
														<option value="2021">2021</option>
														<option value="2022">2022</option>
														<option value="2023">2023</option>
													</select>
												</div>
											</div>
											<div class="row" style="padding-top: 20px">
												<div class="col-4">
													<select class="custom-select" name="lmonth">
														<option selected>month</option>
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
													</select>
												</div>
												<div class="col-4">
													<select class="custom-select" name="lday">
														<option selected>dd</option>
														<option value="01">1</option>
														<option value="02">2</option>
														<option value="03">3</option>
														<option value="04">4</option>
														<option value="05">5</option>
														<option value="06">6</option>
														<option value="07">7</option>
														<option value="08">8</option>
														<option value="09">9</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
														<option value="13">13</option>
														<option value="14">14</option>
														<option value="15">15</option>
														<option value="16">16</option>
														<option value="17">17</option>
														<option value="18">18</option>
														<option value="19">19</option>
														<option value="20">20</option>
														<option value="21">21</option>
														<option value="22">22</option>
														<option value="23">23</option>
														<option value="24">24</option>
														<option value="25">25</option>
														<option value="26">26</option>
														<option value="27">27</option>
														<option value="28">28</option>
														<option value="29">29</option>
														<option value="30">30</option>
														<option value="31">31</option>
													</select>
												</div>
												<div class="col-4">
													<select class="custom-select" name="lyear">
														<option selected>yyyy</option>
														<option value="2000">2000</option>
														<option value="2001">2001</option>
														<option value="2002">2002</option>
														<option value="2003">2003</option>
														<option value="2004">2004</option>
														<option value="2005">2005</option>
														<option value="2006">2006</option>
														<option value="2007">2007</option>
														<option value="2008">2008</option>
														<option value="2009">2009</option>
														<option value="2010">2010</option>
														<option value="2011">2011</option>
														<option value="2012">2012</option>
														<option value="2013">2013</option>
														<option value="2014">2014</option>
														<option value="2015">2015</option>
														<option value="2016">2016</option>
														<option value="2017">2017</option>
														<option value="2018">2018</option>
														<option value="2019">2019</option>
														<option value="2020">2020</option>
														<option value="2021">2021</option>
														<option value="2022">2022</option>
														<option value="2023">2023</option>
													</select>
												</div>
											</div>
										</div>
										<!-- --------------------this is slider range----------------------------------------------------------------------------------- -->
										<div class="col-lg-4 form-group">
											<p>
												<label for="amount">Duration:</label> <input type="text"
													id="amount" readonly name="amount"
													style="border: 0; color: #000000;">
											</p>
											<div id="slider-range"></div>
										</div>
										<!-- -------------------------------------------------------------------end of slider range------------------------------------------- -->
										<div class="col-lg-4">
											<div>
												<label style="color: #00acc1; font-size: 14px;">Minimum
													Age</label>
											</div>
											<div style="padding-top: 15px">
												<!-- <form class="form-group"> -->
												<input type="number" class="form-control" name="minage"
													required="required" />
												<!-- </form> -->
											</div>
										</div>
									</div>
									<div>
										<div class="container see_results">
											<div class="row">
												<input type="submit" class="btn form-control text-light"
													value="See Results" />
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
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
		<div class="row search-panel">
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
						<a class="carousel-control-prev"
							href="#${projects.projectCost.id}" role="button"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#${projects.projectCost.id}" role="button"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
					<p></p>
					<P style="font-size: 16px">${projects.projectCost.title}</P>
					<p style="font-size: 14px; color: #00acc1">
						<img src="../resources/images/volunteer-logo01.png"
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
					<li><a
						href="${pi-1}?searchbar-location=${location}&searchbar-activity=${activity}&searchbar-category=${category}"
						aria-label="Previous"> < </a></li>
				</c:if>
			</c:if>
			<c:forEach var="i" begin="1" end="${pages}">
				<li id="page${i}"><a
					href="${i}?searchbar-location=${location}&searchbar-activity=${activity}&searchbar-category=${category}">${i}</a></li>
			</c:forEach>
			<c:if test="${pages ne 0}">
				<c:if test="${pi ne pages}">
					<li><a
						href="${pi+1}?searchbar-location=${location}&searchbar-activity=${activity}&searchbar-category=${category}"
						aria-label="Next"> > </a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
	<div class="footer fixed-bottom">
		<div class="row">
			<a href="homepage"><img src="../resources/images/logo_1.png">
			</a><span> <a href="../contact">CONTACT US</a> <a href="../faq">FAQ</a>
			</span>
		</div>
	</div>
	<script>
		$(function() {
			$("#slider-range")
					.slider(
							{
								range : true,
								min : 1,
								max : 10,
								values : [ 1, 3 ],
								slide : function(event, ui) {
									$("#amount").val(
											ui.values[0] + " weeks- "
													+ ui.values[1]+" weeks");
								}
							});
			$("#amount").val(
					 $("#slider-range").slider("values", 0) + " weeks- "
							+ $("#slider-range").slider("values", 1)+" weeks");
		});
	jQuery("#page${pi}").addClass("active");
	jQuery("#page${pi} a").css("color","white");
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
</body>
</html>