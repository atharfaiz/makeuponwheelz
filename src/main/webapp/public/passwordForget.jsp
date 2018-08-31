<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  
	<script src="/assets/js/angular.min.js"></script>

  <!-- Favicon -->
  <link rel="shortcut icon" href="/assets/img/favicon.ico">

	<!-- <script src="/assets/js/ngApp/forPass.js"></script> -->
  
  <script src="/assets/js/ng-controller/forPassCtrl.js"></script>
  
</head>

<body class="external-page sb-l-c sb-r-c">

  <!-- Start: Main -->
  <div id="main" class="animated fadeIn">

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper"    ng-cloak ng-controller="forPassCtrl">

      <!-- begin canvas animation bg -->
      <div id="canvas-wrapper">
        <canvas id="demo-canvas"></canvas>
      </div>

      <!-- Begin: Content -->
      <section id="content" class="animated fadeIn">
<!-- <div class="alert alert-success animated flipInX" ng-show="succMsg">
		  <strong>Success!</strong> OTP Sent to the Entered Email ID.
		</div> -->
		<div class="alert alert-micro alert-border-left alert-info pastel alert-dismissable mn" ng-view="message"  ng-show="succMsg" ng-cloak>
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <i class="fa fa-info pr10"></i> Success!!!
                  <b>OTP</b> Sent to the entered Email Id
                </div>
        <div class="admin-form theme-info mw500" style="margin-top: 10%;" id="login">
          <div class="row mb15 table-layout">

            <div class="col-xs-6 pln">
              <a href="dashboard.html" title="Return to Dashboard">
                <img src="/assets/img/logos/logo_white.png" title="AdminDesigns Logo" class="img-responsive w250">
              </a>
            </div>

            <div class="col-xs-6 va-b">
              <div class="login-links text-right">
                <a href="#" class="" title="False Credentials">Password Reset</a>
              </div>
            </div>
          </div>

          <div class="panel panel-info heading-border br-n">

            <form id="contact">
              <div class="panel-body p15 pt25">

                <div class="alert alert-micro alert-border-left alert-info pastel alert-dismissable mn" ng-view="message">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <i class="fa fa-info pr10"></i> Enter your
                  <b>Email</b> and instructions will be sent to you!
                </div>

              </div>
              <!-- end .form-body section -->
              <div class="panel-footer p25 pv15">

                <div class="section mn">

                  <div class="smart-widget sm-right smr-80">
                    <label for="email" class="field prepend-icon">
                      <input type="text" name="email" ng-model="email" id="email" class="gui-input" placeholder="Your Email Address">
                      <label for="email" class="field-icon">
                        <i class="fa fa-envelope-o"></i>
                      </label>
                    </label>
                    <label for="email" class="button" ng-click="otpreq()">Reset</label>
                  </div>
                  <!-- end .smart-widget section -->
										<div class="sampleContainer" ng-show="loderEvent">
    											<div class="loader">
        										<span class="dot dot_1"></span>
        										<span class="dot dot_2"></span>
       		 									<span class="dot dot_3"></span>
        										<span class="dot dot_4"></span>
   											 </div>
										</div>
                </div>
                
                <!-- end section -->
        
              </div>
              <!-- end .form-footer section -->

            </form>

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

    // Init CanvasBG and pass target starting location
    CanvasBG.init({
      Loc: {
        x: window.innerWidth / 2.1,
        y: window.innerHeight / 2.2
      },
    });

  });
  </script>

  <!-- END: PAGE SCRIPTS -->

</body>

</html>
