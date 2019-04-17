<%@page import="java.awt.Window"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Organization</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="shortcut icon" href="resources/images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<style type="text/css">
		.d-none{
			display : none;
		}
	</style>
	<link rel="stylesheet" type="text/css" href="resources/css/LoadingImage.css">
</head>
<body>
	<div class="wrapper admin-wrapper">
		<jsp:include page="Header.jsp"></jsp:include>
		<main>
			<section class="admin-section">
				<div class="container">
					<div class="with-box-shadow ">
						<div class="section-title text-center">
							<h1>Add Organization</h1>
						</div>
						<form name="myform" action="AddOrganization" method="POST" enctype="multipart/form-data">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label>Select User</label>
										<select class="custom-dropdown" name="userName">
											<c:forEach items="${UserList}" var="user">
												<option value="${user.id}">${user.email}</option>	
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Organization name</label>
										<div class="input-group">
											<input id="org_name" type="text" placeholder="Organization name" 
													class="form-control onFocus ui-autocomplete-input" autocomplete="off" 
													data-placeholder="Organization name" name="organizationName"
													onblur="validate_name(this)" oninput="validate_name(this)">
											<span id="sorg_name" class="input-group-addon" style="background-color: #FFF;">
												<i id="okorg_name" class="d-none"></i>
												<i id="notokorg_name" class="d-none"></i>
											</span>
										</div>
									</div>
								</div>	
								<div class="col-sm-6">
									<div class="form-group">
										<label>Organization Website</label>
										<div class="input-group">
											<input id="org_web" type="text" placeholder="Enter Website" 
													class="form-control onFocus ui-autocomplete-input" autocomplete="off" 
													data-placeholder="Enter Website" name="website"
													onblur="validate_web(this)" oninput="validate_web(this)">
											<span id="sorg_web" class="input-group-addon" style="background-color: #FFF;">
												<i id="okorg_web" class="d-none"></i>
												<i id="notokorg_web" class="d-none"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Organization Email</label>
										<div class="input-group">
											<input id="org_mail" type="text" placeholder="Enter Email" 
													class="form-control onFocus ui-autocomplete-input" autocomplete="off" 
													data-placeholder="Enter Email" name="email"
													onblur="validate_email(this)" oninput="validate_email(this)">
											<span id="sorg_mail" class="input-group-addon" style="background-color: #FFF;">
												<i id="okorg_mail" class="d-none"></i>
												<i id="notokorg_mail" class="d-none"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Contact Name</label>
										<div class="input-group">
											<input id="contact_name" type="text" placeholder="Enter Contact Name" 
													class="form-control onFocus ui-autocomplete-input" autocomplete="off" 
													data-placeholder="Enter Contact Name" name="contact"
													onblur="validate_name(this)" oninput="validate_name(this)">
											<span id="scontact_name" class="input-group-addon" style="background-color: #FFF;">
												<i id="okcontact_name" class="d-none"></i>
												<i id="notokcontact_name" class="d-none"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<label>Organization Description</label>
										<textarea class="form-control" placeholder="Textarea" name="organizationdesc"></textarea>
									</div>
								</div>
								<div id="loader" class="d-none">
									
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Organization Image</label>
										<input id="tags" type="file" class="form-control onFocus ui-autocomplete-input" 
												autocomplete="off" value="Browse" name="logo">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Organization Video</label>
										<input id="tags" type="file" class="form-control onFocus ui-autocomplete-input" 
												autocomplete="off" value="Browse" name="video">
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<div class="button-outer text-center">
											<input type="submit" class="btn btn-fill btn-large" value="SUBMIT" onclick="myFunction()">
											<input type="reset" class="btn btn-fill btn-large" value="CANCLE">
										</div>		
									</div>	
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>
		</main>
	</div>
	
	<jsp:include page="JavaScript.jsp"></jsp:include>
	<script type="text/javascript">
		var myvar;
		function myFunction() {
			myvar = setInterval($('#loader').removeClass("d-none"),1000);
		}
	</script>
</body>
</html>