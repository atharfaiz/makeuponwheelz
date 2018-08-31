<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.List" %>
								<!DOCTYPE html>

<html lang="en" class="no-js">
	<!--<![endif]-->
	<!-- start: HEAD -->
<head>

		
	
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main.css">
        		<link rel="stylesheet" href="/sgterp/resources/css/bootstrap.min.css">
		

</head>
<body class="login example1">

					<div class="main-login col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-5">
						<div class="col-sm-12" style="margin-top:15%;">
							<!-- start: TEXT FIELDS PANEL -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="fa fa-external-link-square"></i>
									<p style="margin-left:20px;">Congratulation !! ${firstName } ${"  "} ${lastName} </p> 
								</div>
								<div class="panel-body" style="background-color:#099;">
								<form action="registrationform" method="POST"  class="smart-wizard form-horizontal" id="form" name="frm">
										<input type="hidden" name="email" value="${email}"></input>
										
										
								<p style="margin-left:20px;">Your provisional registration is successfull in SGT University. </p> 
								<p style="margin-left:20px;">Provisional Registration No is : ${tempReg}.</p> 				
								<p style="margin-left:20px;">Please make available this registration no for further admission process.</p> 			
												
								</form>	
								</div>
							</div>
						</div>
					</div>
				</div>
				<script>
			jQuery(document).ready(function() {
				Main.init();
				Login.init();
			});
		</script>
</body>
</html>