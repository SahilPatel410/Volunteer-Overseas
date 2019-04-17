<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpServletRequest;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Volunteer Overseas</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="shortcut icon" href="/VolunteerOverseas/resources/images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="/VolunteerOverseas/resources/css/main.css">
</head>
<body>
	<div class="wrapper admin-wrapper ">
		<jsp:include page="ListingHeader.jsp"></jsp:include>
		<main> <section class="admin-section">
		<div class="container">
			<div class="with-box-shadow ">
				<div class="section-title text-center">
					<h5>Projects list</h5>
					<div class="button-outer">
						<form action="../project">
							<input type="submit" class="btn btn-fill" value="Add Project">
						</form>
					</div>
				</div>
				<div class="table-responsive">
					<table id="projectTable"
						class="table admin-table table-bordered table-striped">
						<tr>
							<th>Project name</th>
							<th>Location</th>
							<th>Actions</th>
						</tr>
						<c:forEach items="${projects}" var="project">
							<tr>
								<td>${project.title}</td>
								<td>${project.country.name}</td>
								<td>
									<div class="button-outer">
										<a href="../project?id=${project.id}"><button type="button" class="btn btn-fill"
											value="${project.id}" id="edit">Edit</button></a>
										<!-- <form action="project"><input type="button" class="btn btn-fill" value="delete"></form> -->
										<button type="button" class="btn btn-fill"
											value="${project.id}" id="delete">Delete</button>
									</div>
								</td>
							</tr>
							<input type="hidden" value="${project.id}" id="id">
						</c:forEach>
					</table>
				</div>
				<ul class="pagination">
					<c:if test="${pages ne 0}">
						<c:if test="${pi ne 1}">
							<li><a href="${pi-1}" aria-label="Previous"> < </a></li>
						</c:if>							
					</c:if>
					<c:forEach var="i" begin="1" end="${pages}">
						<li id="${i}"><a href="${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pages ne 0}">
						<c:if test="${pi ne pages}">
							<li><a href="${pi+1}" aria-label="Next"> > </a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
		</section> </main>
	</div>
	<jsp:include page="ListingJavaScript.jsp"></jsp:include>
	
	<script type="text/javascript" src="/VolunteerOverseas/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#"+${pi}).addClass("active");
			
			$(document).on("click", "button", function() {
				var action = this.id;
				var pid = this.value;
				if (action == "../delete") {
					$.ajax({
						url : "../DeleteProject",
						data : {
							pid : pid
						},
						success : function(result) {
							confirm("Record Deleted");
							location.reload();
						}
					})
				}
				/* if (action == "edit") {
					$.ajax({
						url : "../projectTest",
						data : {
							pid : pid
						},
						success : function(result) {
							window.location.href = '../project?id='+pid;
						},
						error : function() {
							confirm("Page not Found..!!");
						}
					})
				} */
			});
		});
	</script>
 </body>
</html>