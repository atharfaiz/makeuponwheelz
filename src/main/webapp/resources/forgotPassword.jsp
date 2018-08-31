<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html lang="en" class="no-js">
	<!--<![endif]-->
	<!-- start: HEAD -->
	<head>
	
		<!-- start: META -->
		<meta charset="utf-8" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->
		<!-- start: MAIN CSS -->
		
			<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/sgterp/resources/fonts/style.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/main-responsive.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/iCheck/skins/all.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
		<link rel="stylesheet" href="/sgterp/resources/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/theme_light.css" type="text/css" id="skin_color">
		<link rel="stylesheet" href="/sgterp/resources/css/clip/print.css" type="text/css" media="print"/>
		
	</head>
	<!-- end: HEAD -->
	<!-- start: BODY -->
	
	<body class="login example1" onload="Captcha(event);">
	<div style="width: 500px" class="container ">

	<div class="">
		
	</div>
	</div>
	<!-- Jumbotron -->
	
		<div class="main-login col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3" >
			<div class="logo">SGT<i class="clip-users"></i>ERP
			</div>
		<c:if test="${resetPasswordMsg!=null}">	
			<div class="alert alert-block alert-danger" >
										<button data-dismiss="alert" class="close">
											&times;
										</button>
										<i class="fa fa-times-circle"></i>&nbsp;
										${resetPasswordMsg}
					</div>
		</c:if>	<!-- start: LOGIN BOX -->
			<div class="box-login">
				
				<h4>Reset Password</h4>
				
				<form action="/sgterp/resources/resetPassword"  method="post" onsubmit="ValidCaptcha(event)">
					<fieldset>
					<div class="form-group">
							<span class="input-icon">
							<input type="text" class="form-control" name="userId" placeholder="Enter User Id" required>
							<i class="fa fa-user"></i> </span>
						</div>
						<div class="form-group">
							<span class="input-icon">
							<input type="password" class="form-control" name="otp"  placeholder="OTP" required>
							<i class="fa fa-lock"></i> </span>
						</div>
						<div class="form-group">
							<span class="input-icon">
							<input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="New Password" required>
							<i class="fa fa-lock"></i> </span>
						</div>
						<div class="form-group">
							<span class="input-icon">
							<input type="password" class="form-control" name="password" id="confirmPassword"   placeholder="Confirm Password" required>
							<i class="fa fa-lock"></i> </span>
						</div>
					
             <script type="text/javascript">


                 function Captcha(event){
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
					event.preventDefault();
					return false;
                  }
                  function ValidCaptcha(event){
                      var string1 = removeSpaces(document.getElementById('mainCaptcha').value);
                      var string2 = removeSpaces(document.getElementById('txtInput').value);
                      if (string1 == string2){
                        return true;
                      }
                      else{
					$("#txtInput").css("border","2px solid red");
					  	Captcha(event);
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
             <input  readonly id="mainCaptcha" class="captcha1" disabled="disabled"/>
<script>
jQuery("#mainCaptcha").bind("cut copy",function(e){
    e.preventDefault();
});
</script>
            <div class="refresh1">
           <a style=" color:#FFF; text-decoration:none;" href=""> <i class="clip-spinner-4" id="refresh"  onclick="Captcha();"></i> </a>
       </div></div></div>
         <div class="form-group">
        <label class="col-sm-3 control-label" >
                 <spring:message code='prospectus.characters'/><span class="symbol required"></span>

                  </label>
            <div class="col-sm-7" >
            <input type="text"  id="txtInput" class="cap1" onblur="captchaValidate(this.value,this.id)"/>

      <script>
jQuery("#txtInput").bind("cut copy paste drop",function(e){
    e.preventDefault();
});
</script>
              </div></div>
					
					
					
					
					<button type="submit" name="submit" class="btn btn-bricky pull-right" >
								Reset <i class="fa1 fa-arrow-circle-right"></i>
					</button>
					<font size="2px" face="verdana">
						<a href="/sgterp/public/backToHome"><input type="button" class="btn btn-bricky pull-left fa-arrow-circle-left" value="Cancel"/></a>
					</font>
					</fieldset>
				</form>
			</div>
			<!-- end: LOGIN BOX -->
			<!-- start: FORGOT BOX -->
			<!-- end: FORGOT BOX -->
		
				<!-- start: COPYRIGHT -->
				<div class="copyright">
				2014 &copy; Powered By EEBS.
			</div>
			<!-- end: COPYRIGHT -->
			</div>
				
			
			
			

		
				<script src="assets/plugins/jQuery-lib/2.0.3/jquery.min.js"></script>
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
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="/sgterp/resources/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="/sgterp/resources/js/login.js"></script>
		<script src="/sgterp/resources/js/registration/prospectus.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script>
			jQuery(document).ready(function() {
				Main.init();
				Login.init();
			});
			
			
			
		</script>
	</body>
	<!-- end: BODY -->
</html>

