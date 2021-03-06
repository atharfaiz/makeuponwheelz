<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <title>AdminDesigns - A Responsive HTML5 Admin UI Framework</title>
  <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
  <meta name="description" content="AdminDesigns - A Responsive HTML5 Admin UI Framework">
  <meta name="author" content="AdminDesigns">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font CSS (Via CDN) -->
  <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

  <!-- Theme CSS -->
  <link rel="stylesheet" type="text/css" href="/assets/skin/default_skin/css/theme.css">
  <link rel="stylesheet" type="text/css" href="/assets/skin/default_skin/css/theme2.css">
  <link rel="stylesheet" type="text/css" href="/assets/skin/default_skin/css/theme3.css">

  <!-- Admin Forms CSS -->
  <link rel="stylesheet" type="text/css" href="/assets/admin-tools/admin-forms/css/admin-forms.css">
<link rel="stylesheet" type="text/css" href="/assets/admin-tools/admin-forms/css/loader.css">
  
  <!-- Favicon -->
  <link rel="shortcut icon" href="/assets/img/favicon.ico">
	<script src="/assets/js/angular.min.js"></script>
	<!-- <script src="/assets/js/ngApp/forget_otp.js"></script> -->
	<script src="/assets/js/ng-controller/forget_otpCtrl.js"></script>
	
</head>

<body class="external-page sb-l-c sb-r-c">

  <!-- Start: Main -->
  <div id="main" class="animated fadeIn">

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">

      <!-- begin canvas animation bg -->
      <div id="canvas-wrapper">
        <canvas id="demo-canvas"></canvas>
      </div>

      <!-- Begin: Content -->
      <section id="content"    ng-cloak ng-controller="forgetotpCtrl">

        <div class="admin-form theme-info mw600" style="margin-top: 13%;" ng-hide="otpVerified">
          <div class="row mb15 table-layout">

            <div class="col-xs-6 pln">
              <a href="dashboard.html" title="Return to Dashboard">
                <img src="/assets/img/logos/logo_white.png" title="AdminDesigns Logo" class="img-responsive w250">
              </a>
            </div>

            <div class="col-xs-6 text-right va-b pr5">
              <div class="login-links">
                <a href="#" class="" title="False Credentials">Not ${user.name}?</a>
              </div>

            </div>

          </div>
          <div class="panel panel-info heading-border br-n">

            <!-- end .form-header section -->
            <form>
              <div class="panel-body bg-light pn">

                <div class="row table-layout">
                  <!-- <div class="col-xs-3 p20 pv15 va-m br-r bg-light">
                    <img class="br-a bw4 br-grey img-responsive center-block" src="/assets/img/avatars/1.jpg" title="AdminDesigns Logo">
                  </div> -->
                  <div class="col-xs-12 p20 pv15 va-m bg-light">

                    <h3 class="mb5"> ${user.name}
                      <small> - Enter 6 digit code sent to your phone  or email
                        

                    </h3>
                    
                    <p class="text-muted"> ${user.userId}</p>
					<h3>{{result}}</h3>

                    <div class="section mt25">
                      <label for="password" class="field prepend-icon">
                        <input type="text" name="otp" ng-model="otp" id="otp" class="gui-input" placeholder="Enter OTP">
                        <label for="password" class="field-icon">
                          <i class="fa fa-lock"></i>
                        </label>
                      </label>
                    </div>
                    <!-- end section -->

                  </div>
                  
                </div>
              </div>
              <!-- end .form-body section -->

            </form>
          </div>
          <button type="submit" ng-click="otpsubmit()" class="button btn-info pull-right">Finish</button>
        </div>


		<div class="admin-form theme-info mw600" style="margin-top: 13%;"  ng-show="otpVerified">
          <div class="row mb15 table-layout">

            <div class="col-xs-12 pln">
              <a href="dashboard.html" title="Return to Dashboard">
                <img src="/assets/img/logos/logo_white.png" title="AdminDesigns Logo" class="img-responsive w250">
              </a>
            </div>

          </div>
          <div class="panel panel-info heading-border br-n">

            <!-- end .form-header section -->
            <form id="contact">
              <div class="panel-body bg-light pn">

                <div class="row table-layout">
                  
                   <div class="col-xs-12 p20 pv15 va-m bg-light">

						<h3>{{result}}</h3>
						<h3>{{pwdmsg}}</h3>
						
						
                    <div class="section mt25">
                      <label for="password" class="field prepend-icon">
                        <input type="password" ng-model="password" name="password" id="password" class="gui-input" placeholder="Enter Password">
                        <label for="password" class="field-icon">
                          <i class="fa fa-lock"></i>
                        </label>
                      </label>
                    </div>
                     <div class="section mt25">
                      <label for="cnfpassword" class="field prepend-icon">
                        <input type="password" ng-model="cnfpassword" name="cnfpassword" id="cnfpassword" class="gui-input" placeholder="Confirm Password">
                        <label for="cnfpassword" class="field-icon">
                          <i class="fa fa-lock"></i>
                        </label>
                      </label>
                    </div>
                    <!-- end section -->

                  </div>
                  
                  
                </div>
              </div>
              <!-- end .form-body section -->

            </form>
          </div>
          <button ng-click="updPwd()" type="submit" class="button btn-info pull-right">Update</button>
        </div>
		<div class="sampleContainer" ng-show="loderEvent">
    											<div class="loader">
        										<span class="dot dot_1"></span>
        										<span class="dot dot_2"></span>
       		 									<span class="dot dot_3"></span>
        										<span class="dot dot_4"></span>
   											 </div>
										</div>
      </section>
      <!-- End: Content -->

    </section>
    <!-- End: Content-Wrapper -->

  </div>
  <!-- End: Main -->

  <!-- BEGIN: PAGE SCRIPTS -->

  <!-- jQuery -->
  <script src="/assets/vendor/jquery/jquery-1.11.1.min.js"></script>
  <script src="/assets/vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

  <!-- CanvasBG Plugin(creates mousehover effect) -->
  <script src="/assets/vendor/plugins/canvasbg/canvasbg.js"></script>

  <!-- Theme Javascript -->
  <script src="/assets/js/utility/utility.js"></script>
  <script src="/assets/js/demo/demo.js"></script>
  <script src="/assets/js/main.js"></script>

  <!-- Page Javascript -->
  <script type="text/javascript">
  jQuery(document).ready(function() {
    "use strict";

    // Init Theme Core      
    Core.init();

    // Init Demo JS
    Demo.init();

    CanvasBG.init({
      Loc: {
        x: window.innerWidth / 2.1,
        y: window.innerHeight / 2.3
      },
    });


  });
  </script>

</body>

</html>
    