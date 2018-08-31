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
<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/sgterp/resources/fonts/style.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main.css">
        <link rel="stylesheet" href="/sgterp/resources/plugins/iCheck/skins/all.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main-responsive.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/theme_light.css" type="text/css" id="skin_color">
		<link rel="stylesheet" href="/sgterp/resources/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
		<link rel="stylesheet" href="/sgterp/resources/css/print.css" type="text/css" media="print"/>
</head>
<body class="login example1" style="width:100%" onload="Captcha();">

	<div class="main-login col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">
		<div class="col-sm-12" style="margin-top:5%;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-external-link-square"></i>
					<p style="margin-left:20px;"><spring:message code='alumni.registration'/></p>
				</div>
				<div class="panel-body" style="background-color:#099;">
					<form  class="smart-wizard  form-horizontal" action="/sgterp/resources/alumniRegistration" method="post" onsubmit="return submitForm();">
						<div id="wizard" class="swMain">
							<div class="col-sm-12">
								<div class="form-group">
									<label class="col-sm-3 control-label">
										<spring:message code='registrationNo'/><span class="symbol required"></span>
									</label>
									<div class="col-sm-7">
										<input type="text" class="form-control  input-sm" name="registrationNo" required>
									</div>
								</div><br/>
								<script type="text/javascript">
									function Captcha(){
										var alpha = new Array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','1','2','3','4','5','6','7','8','9','0','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p');
										var i;
										for (i=0;i<6;i++){
											var a = alpha[Math.floor(Math.random() * alpha.length)];
											var b = alpha[Math.floor(Math.random() * alpha.length)];
											var c = alpha[Math.floor(Math.random() * alpha.length)];
											var d = alpha[Math.floor(Math.random() * alpha.length)];
											var e = alpha[Math.floor(Math.random() * alpha.length)];
											var f = alpha[Math.floor(Math.random() * alpha.length)];
											var g = alpha[Math.floor(Math.random() * alpha.length)];
										}
										var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
										document.getElementById("mainCaptcha").value = code
									}
									function ValidCaptcha(){
										var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
										var string2 = removeSpaces(document.getElementById('txtInput').value);
										if (string1 == string2){
											return true;
										}
										else{
											Captcha();
											return false;
										}
									}
									function removeSpaces(string){
										return string.split(' ').join('');
									}
								</script>

								<label class="col-sm-12" style="margin-top:-10px; margin-left:6%">
										<spring:message code='prospectus.captcha'/>
								</label>
								<div class="form-group">
									<label class="col-sm-3 control-label" >
										 <spring:message code='prospectus.captcha1'/><span class="symbol required"></span>
									</label>
									<div class="col-sm-7" >
										<input  readonly id="mainCaptcha" class="captcha" disabled="disabled"/>
										<script>
											jQuery("#mainCaptcha").bind("cut copy",function(e){
												e.preventDefault();
											});
										</script>
										<div class="refresh">
											<a style=" color:#FFF; text-decoration:none;" href=""> <i class="clip-spinner-4" id="refresh"  onclick="Captcha();"></i> </a>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" >
										<spring:message code='prospectus.characters'/><span class="symbol required"></span>
									</label>
									<div class="col-sm-7" >
										<input type="text"  id="txtInput" class="form-control input-sm cap " required />
										<script>
											jQuery("#txtInput").bind("cut copy paste drop",function(e){
												e.preventDefault();
											});
										</script>
									</div>
								</div>
								<div class="form-group">
									<div class="row space20">
										<div class="col-sm-3" style="margin-left:26%;">
											<div class="nbutton" >
												<button  onclick="window.location='/sgterp/protected/home';" class="btn btn-blue right" type="button"  style="background-color:#f5f5f5; color:#000;">	<i class="fa fa-arrow-circle-left"></i>
													<spring:message code='header.home'/>&nbsp;
												</button>
											</div>
										</div>
										<div class="col-sm-5">
											<div class="nbutton">
												<button class="btn btn-yellow left"  type="submit">
													<spring:message code='next'/>&nbsp;
													<i class="fa fa-arrow-circle-right"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
				
				
							
	<script src="/sgterp/resources/plugins/jQuery-lib/2.0.3/jquery.min.js"></script>
		<!--<![endif]-->
		<script src="/sgterp/resources/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
		<script src="/sgterp/resources/plugins/blockUI/jquery.blockUI.js"></script>
		<script src="/sgterp/resources/plugins/iCheck/jquery.icheck.min.js"></script>
		<script src="/sgterp/resources/plugins/perfect-scrollbar/src/jquery.mousewheel.js"></script>
		<script src="/sgterp/resources/plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
		<script src="/sgterp/resources/plugins/less/less-1.5.0.min.js"></script>
		<script src="/sgterp/resources/plugins/jquery-cookie/jquery.cookie.js"></script>
		<script src="/sgterp/resources/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
		<script src="/sgterp/resources/js/main.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
			});
			function submitForm()
			{
				if(removeSpaces($("#mainCaptcha").val())!=removeSpaces($("#txtInput").val())){
					alert("Characters not matched with picture text");
					$("#txtInput").val("");
					Captcha();
					return false;
				}
				else
					return true;
			}
		</script>

</body></html>
