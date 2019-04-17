<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<title>FAQ</title>
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
					<h1 style="color: #00acc1">FAQ Details</h1>
				</div>
				<form action="AddFAQ" method="POST" id="FaqForm">
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Sequence Number</label> 
								<input id="SequenceNo" type="number"
									class="form-control onFocus ui-autocomplete-input"
									name="SequenceNo" autocomplete="off">
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Question</label>
								<textarea id="Two" class="form-control" name="Question"></textarea>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Answer</label>
								<textarea id="Three" class="form-control" name="Answer"></textarea>
							</div>
						</div>
							<div class="col-sm-12">
								<div class="form-group">
									<div class="button-outer text-center">
										<input type="submit" class="btn btn-fill btn-large"
											value="ADD">
									</div>
								</div>
							</div>
						</div>
				<form>
			</div>
		</div>
		</section> </main>
	</div>
	<jsp:include page="JavaScript.jsp"></jsp:include>
</body>
</html>