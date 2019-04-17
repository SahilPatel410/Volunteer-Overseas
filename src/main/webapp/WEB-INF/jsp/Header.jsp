<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession;"
     session="true"%>
<body>
	<header>
		<div class="row header-row">
			<div class="col-lg-2 col-sm-3 col-xs-6 logo-outer">
				<a href="index.html" title="Volunteer Overseas" class="logo"><img src="resources/images/logo_1.png" alt="">
				<img class="color-logo" src="resources/images/logo.png" alt=""></a>
			</div>
			<div class="col-lg-10 col-sm-9 col-xs-6 menu-wrap">
				<nav>
					<ul>
						<li><a href="AdminOrganization" title="Organization">Organization</a></li>
						<li><a href=project title="Projects">Projects</a></li>
						<li><a href="UserListing/1" title="USERS">USERS</a></li>
						<li><a href="Category/1" title="CATEGORIES">CATEGORIES</a></li>
						<li><a href="Activity/1" title="ACTIVITIES">ACTIVITIES</a></li>
						<li><a href="Faq" title="FAQ">FAQ</a></li>
						<li><a href="ApplicationListing/1" title="Application">Application</a></li>
						<li><a href="#" title="CONTACT INQUIRIES">CONTACT INQUIRIES</a></li>
					</ul>
				</nav>
				<%
							String userName=null;  
							if(session.getAttribute("UserName") == null){
								%><jsp:forward page="/index" /><%//response.sendRedirect("index");
							}else{  
								userName=session.getAttribute("UserName").toString();
							} 
				%>
				<div class="right-block">
					<label id="loginName"><%=userName%></label>
					<a href="logout" class="btn" title="Login">Logout</a>
				</div>
			</div>
		</div>
		<a href="#" title="" class="hamburger-icon"><span></span></a>
	</header>
</body>
