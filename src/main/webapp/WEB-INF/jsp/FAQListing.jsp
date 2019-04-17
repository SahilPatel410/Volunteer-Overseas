<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Volunteer Overseas</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="shortcut icon" href="resources/images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
<div class="wrapper admin-wrapper ">
		<jsp:include page="Header.jsp"></jsp:include>
		<main>
			<section class="admin-section">
				<div class="container">
					<div class="with-box-shadow ">
						<div class="section-title text-center">
							<h5>FAQ list</h5>
							<div class="button-outer">
								<form action="loadAddFAQ">
									<input type="submit" class="btn btn-fill" value="Add FAQ">
								</form>
								<!-- <button type="button" class="btn btn-fill">Add FAQ</button> -->
							</div>
						</div>
						<div class="table-responsive">
							<table id="projectTable"
									class="table admin-table table-bordered table-striped">
						  		<tr>
							  		<th>Questions</th>
							  		<th>Answers</th>
							  		<th>Sequence Number</th>
							  		<th>Actions</th>
							  	</tr>
								<c:forEach items="${faq}" var="faq">
									<tr>
										<td>
											<form>
												<input style="width:100%" type="hidden" id="editQuestionText${faq.id}" value="${faq.question}">
												<label id="editQuestionLabel${faq.id}">${faq.question}</label>
											</form>
										</td>
										<td>
											<form>
												<input type="hidden" id="editAnswerText${faq.id}" value="${faq.answer}">
												<label id="editAnswerLabel${faq.id}">${faq.answer}</label>
											</form>
										</td>
										<td>
											<form>
												<input type="hidden" id="editSequenceText${faq.id}" value="${faq.sequence_number}">
												<label id="editSequenceLabel${faq.id}">${faq.sequence_number}</label>
											</form>
										</td>
										<td>
											<div id="save${faq.id}" class="d-none button-outer">
												<button type="button" class="btn btn-fill" value="${faq.id}" id="save">Save</button>
											</div>
											<div id="editDelete${faq.id}" class="button-outer">
												<button type="button" class="btn btn-fill" value="${faq.id}" id="edit">Edit</button>
												<button type="button" class="btn btn-fill" value="${faq.id}" id="delete">Delete</button>
											</div>
										</td>
									</tr>
									<input type="hidden" value="${faq.id}" id="id">
								</c:forEach> 
							</table>
						</div>
						
						<ul class="pagination">
							
						</ul>
					</div>
				</div>
			</section>
		</main>
	</div>
	<jsp:include page="JavaScript.jsp"></jsp:include>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(document).on("click","button",function(){
				var action=this.id;
				var pid=this.value;
				if(action=="delete"){
					$.ajax({
						url:"DeleteFAQ",
						data:{
							pid:pid
						}, 
						success:function(result){
							location.reload();
							confirm("Record Deleted");
						}	
					}) 
				}
				if(action=="edit"){
					$('#editQuestionText'+pid).get(0).type = 'text';
					$('#editQuestionText'+pid).css('color','#000');
					$('#editQuestionLabel'+pid).css('display','none');
					$('#editAnswerText'+pid).get(0).type = 'text';
					$('#editAnswerText'+pid).css('color','#000');
					$('#editAnswerLabel'+pid).css('display','none');
					$('#editSequenceText'+pid).get(0).type = 'text';
					$('#editSequenceText'+pid).css('color','#000');
					$('#editSequenceLabel'+pid).css('display','none');
					$("#save"+pid).removeClass("d-none");
					$("#save"+pid).addClass("d-block");
					$("#editDelete"+pid).addClass("d-none");
				}
				if(action=="save"){
					var Question = $('#editQuestionText'+pid).val();
					var Answer = $('#editAnswerText'+pid).val();
					var Sequence = $('#editSequenceText'+pid).val();
					$.ajax({
						url:"EditFAQ",
						data:{
							pid:pid,
							Question:Question,
							Answer:Answer,
							Sequence:Sequence
						},
						success:function(result){
							location.reload();
							confirm("Record Edited");
						}	
					}) 
				}
			})
		});
	
	</script>
</body>
</html>