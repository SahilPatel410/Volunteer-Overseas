<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
						<div class="row">
							<div class="col-md-12">
								<center>
									<img src="resources/images/tenor.gif" id="img1" >
									<div class="d-none" id="afterimg">
										<h4>Project Added Successfully..!!</h4>
										</br></br>
										<form action="ProjectListing/1">
											<div class="col-sm-12">
												<div class="form-group">
													<div class="button-outer text-center">
														<input type="submit" value="Projects List" class="next btn btn-fill btn-large">
													</div>
												</div>
											</div>
										</form>
									</div>
								</center>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
		<jsp:include page="JavaScript.jsp"></jsp:include>
		<script type="text/javascript">
			setTimeout(function() {
			        $('#img1').attr('src',"");
			        $('#afterimg').removeClass('d-none');
			}, 3200)
		</script>
	</div>
	
</body>
</html>