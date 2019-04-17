<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Organization</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="shortcut icon" href="/VolunteerOverseas/resources/images/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/VolunteerOverseas/resources/css/main.css">
	<style type="text/css">
		.d-none{
			display: none;
		}
		.d-block{
			display: block;
		}
	</style>
</head>
<body>
	<div class="wrapper admin-wrapper">
		<jsp:include page="ListingHeader1.jsp"></jsp:include>
		<main>
			<section class="admin-section">
				<div class="container">
					<div class="with-box-shadow ">
						<div class="section-title text-center row">
							<div class="col-sm-12"><center><h1>Add Category</h1></center></div>
						</div>
						<form name="myform" action="AddCategory" method="POST" enctype="multipart/form-data">
							<div class="row">
								<div class="col-sm-3"></div>
								<div class="col-sm-6">
									<div class="form-group">
										<label>Category Name</label>
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
											<input type="submit" class="btn btn-fill btn-large" value="SUBMIT">
											<input type="reset" class="btn btn-fill btn-large" value="CANCLE">
										</div>		
									</div>	
								</div>
							</div>
						</form>
						<div class="table-responsive">
							<table id="projectTable"
									class="table admin-table table-bordered table-striped">
						  		<tr>
							  		<th>Category Name</th>
							  		<th></th>
							  	</tr>
								<c:forEach items="${CatList}" var="category">
									<tr>
										<td>
											<form>
												<input type="hidden" id="editText${category.id}" value="${category.name}">
												<label id="editLabel${category.id}">${category.name}</label>
											</form>
										</td>
										<td>
											<div id="save${category.id}" class="d-none button-outer">
												<button type="button" class="btn btn-fill" value="${category.id}" id="save">Save</button>
											</div>
											<div id="editDelete${category.id}" class="button-outer">
												<button type="button" class="btn btn-fill" value="${category.id}" id="edit">Edit</button>
												<button type="button" class="btn btn-fill" value="${category.id}" id="delete">Delete</button>
											</div>
										</td>
									</tr>
									<input type="hidden" value="${category.id}" id="id">
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
			</section>
		</main>
	</div>
	<jsp:include page="ListingJavaScript.jsp"></jsp:include>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#"+${pi}).addClass("active");
			
			$(document).on("click","button",function(){
				var action=this.id;
				var pid=this.value;
				if(action=="delete"){
					$.ajax({
						url:"../DeleteCategory",
						data:{
							pid:pid
						}, 
						success:function(result){
							confirm("Record Deleted");
							location.reload();
						}	
					}) 
				}
				if(action=="edit"){
					$('#editText'+pid).get(0).type = 'text';
					$('#editText'+pid).css('color','#000');
					$('#editLabel'+pid).css('display','none');
					$("#save"+pid).removeClass("d-none");
					$("#save"+pid).addClass("d-block");
					$("#editDelete"+pid).addClass("d-none");
				}
				if(action=="save"){
					var name = $('#editText'+pid).val();
					$.ajax({
						url:"../EditCategory",
						data:{
							pid:pid,
							name:name
						},
						success:function(result){
							confirm("Record Edited");
							location.reload();
						}	
					}) 
				}
			})
		});
	</script>
</body>
</html>