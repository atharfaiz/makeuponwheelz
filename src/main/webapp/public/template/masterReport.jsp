<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="customShiroTags" %>
<!DOCTYPE html>
<html ng-app="empRollRootModuleForReport">

<head>

  <meta charset="utf-8">
  <title>CSS SOFTLAB PVT LTD.</title>
 
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600'>

  <!-- Theme CSS -->
  <link rel="stylesheet" type="text/css" href="/assets/skin/default_skin/css/theme.css">
  <link rel="stylesheet" type="text/css" href="/assets/skin/default_skin/css/theme2.css">
  <link rel="stylesheet" type="text/css" href="/assets/skin/default_skin/css/theme3.css">

    <link rel="stylesheet" href="/assets/dist/ladda.min.css">

  <link rel="stylesheet" type="text/css" href="/assets/vendor/plugins/magnific/magnific-popup.css">

  <link rel="stylesheet" type="text/css" href="/assets/admin-tools/admin-forms/css/admin-forms.css">
	
	
  <!-- Favicon -->

<!-- jQuery -->
<script src="/assets/vendor/jquery/jquery-1.11.1.min.js"></script>
<script src="/assets/vendor/jquery/jquery_ui/jquery-ui.min.js"></script>
  <!-- Page Plugins -->
  <script src="/assets/vendor/plugins/magnific/jquery.magnific-popup.js"></script>

<!-- angular lib -->

  <!-- BEGIN: PAGE SCRIPTS -->

  <!-- HighCharts Plugin -->
  <script src="/assets/vendor/plugins/highcharts/highcharts.js"></script>

    <!-- Select2 Plugin Plugin -->
  <script src="/assets/vendor/plugins/select2/select2.min.js"></script>

  <!-- Simple Circles Plugin -->
  <script src="/assets/vendor/plugins/circles/circles.js"></script>

  <!-- JvectorMap Plugin + US Map (more maps in plugin/assets folder) -->
  <script src="/assets/vendor/plugins/jvectormap/jquery.jvectormap.min.js"></script>
  <script src="/assets/vendor/plugins/jvectormap/assets/jquery-jvectormap-us-lcc-en.js"></script> 

  <!-- Theme Javascript -->
  <script src="/assets/js/utility/utility.js"></script>
  <script src="/assets/js/demo/demo.js"></script>

  <!-- Widget Javascript -->
  <script src="/assets/js/demo/widgets.js"></script>
  
<!--   <script src="/assets/js/ngApp/body.js"></script> -->
  <!-- <script src="/assets/js/ng-controller/bodyController.js"></script> -->
  
    <script src="https://unpkg.com/moment@2.17.1"></script>
    <script src="https://unpkg.com/interactjs@1"></script>
    <script src="https://unpkg.com/angular@1.6.2/angular.js"></script>
    <script src="/assets/angular-animate.js"></script>
    <script src="https://unpkg.com/angular-ui-bootstrap@2/dist/ui-bootstrap-tpls.js"></script>
    <script src="https://unpkg.com/rrule@2"></script>
    <script src="https://unpkg.com/angular-bootstrap-colorpicker@3"></script>
    <script src="https://unpkg.com/angular-bootstrap-calendar"></script>
  
  
       <!-- csv utility js -->
  <script src="/assets/report/angular-sanitize.js"></script>
  <script src="/assets/report/ng-csv.js"></script>
  
    <!-- excel utility js -->
   <script src="/assets/report/alasql.min.js"></script>
   <script src="/assets/report/xlsx.core.min.js"></script>
   
    <!-- angular data table -->
    <script src="/assets/report/angularDataTable/angular-datatables.js"></script>
	<script src="/assets/report/angularDataTable/angular-datatables.directive.js"></script>
	<script src="/assets/report/angularDataTable/angular-datatables.factory.js"></script>
	<script src="/assets/report/angularDataTable/angular-datatables.bootstrap.js"></script>
  
   <!-- angular rootModule ,subModules ,custom directive and utility -->
   <script type="text/javascript" src="/assets/js/ng-app/empRollRootModule.js"></script>
   <script type="text/javascript" src="/assets/js/ng-app/empRollSubModules.js"></script>
   <script type="text/javascript" src="/assets/js/ng-app/customDirective.js"></script>
   <script type="text/javascript" src="/assets/js/ng-app/customServices.js"></script>
    
</head>

<body class="dashboard-page sb-l-o sb-r-c">

  <!-- Start: Main -->
  <div id="main">

    <!-- Start: Header -->
    <tiles:insertAttribute name="header" />
      
    
    <aside id="sidebar_left" class="nano nano-primary affix">

      <!-- Start: Sidebar Left Content -->
      <div class="sidebar-left-content nano-content">

        <!-- Start: Sidebar Header -->
        <header class="sidebar-header">

          <!-- Sidebar Widget - Menu (Slidedown) -->
          <div class="sidebar-widget menu-widget">
            <div class="row text-center mbn">
              <div class="col-xs-4">
                <a href="dashboard.html" class="text-primary" data-toggle="tooltip" data-placement="top" title="Dashboard">
                  <span class="glyphicon glyphicon-home"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_messages.html" class="text-info" data-toggle="tooltip" data-placement="top" title="Messages">
                  <span class="glyphicon glyphicon-inbox"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_profile.html" class="text-alert" data-toggle="tooltip" data-placement="top" title="Tasks">
                  <span class="glyphicon glyphicon-bell"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_timeline.html" class="text-system" data-toggle="tooltip" data-placement="top" title="Activity">
                  <span class="fa fa-desktop"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_profile.html" class="text-danger" data-toggle="tooltip" data-placement="top" title="Settings">
                  <span class="fa fa-gears"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_gallery.html" class="text-warning" data-toggle="tooltip" data-placement="top" title="Cron Jobs">
                  <span class="fa fa-flask"></span>
                </a>
              </div>
            </div>
          </div>

          <!-- Sidebar Widget - Author (hidden)  -->
          <div class="sidebar-widget author-widget hidden">
            <div class="media">
              <a class="media-left" href="#">
                <img src="/assets/img/avatars/3.jpg" class="img-responsive">
              </a>
              <div class="media-body">
                <div class="media-links">
                   <a href="#" class="sidebar-menu-toggle">User Menu -</a> <a href="pages_login(alt).html">Logout</a>
                </div>
                <div class="media-author">Michael Richards</div>
              </div>
            </div>
          </div>

          <!-- Sidebar Widget - Search (hidden) -->
          <div class="sidebar-widget search-widget hidden">
            <div class="input-group">
              <span class="input-group-addon">
                <i class="fa fa-search"></i>
              </span>
              <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
            </div>
          </div>

        </header>
        <!-- End: Sidebar Header -->

               <!-- Start: Sidebar Left Menu -->
       <tiles:insertAttribute name="sidebar" />
        <!-- End: Sidebar Menu -->

	      <!-- Start: Sidebar Collapse Button -->
	      <div class="sidebar-toggle-mini">
	        <a href="#">
	          <span class="fa fa-sign-out"></span>
	        </a>
	      </div>
	      <!-- End: Sidebar Collapse Button -->

      </div>
      <!-- End: Sidebar Left Content -->

    </aside>
    <!-- End: Sidebar Left -->

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper" onload="getPopup();">

      <!-- Start: Topbar-Dropdown -->
      <div id="topbar-dropmenu">
        <div class="topbar-menu row">
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile">
              <span class="glyphicon glyphicon-inbox"></span>
              <span class="metro-title">Messages</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile">
              <span class="glyphicon glyphicon-user"></span>
              <span class="metro-title">Users</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile">
              <span class="glyphicon glyphicon-headphones"></span>
              <span class="metro-title">Support</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile">
              <span class="fa fa-gears"></span>
              <span class="metro-title">Settings</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile">
              <span class="glyphicon glyphicon-facetime-video"></span>
              <span class="metro-title">Videos</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile">
              <span class="glyphicon glyphicon-picture"></span>
              <span class="metro-title">Pictures</span>
              </a>
          </div>
        </div>
      </div>
      <!-- End: Topbar-Dropdown -->

      
     <tiles:insertAttribute name="body" />

    </section>
    <!-- End: Content-Wrapper -->


  </div>
  <!-- End: Main -->
<shiro:hasRole name="COMPANY_ADMIN">

<!-- <script src="/assets/js/ngApp/companyAccSetup.js"></script> -->
<script src="/assets/js/ng-controller/accSetupController.js"></script>

                   <!-- Admin Form Popup -->
        <div id="attendance" class="popup-basic popup-lg admin-form mfp-with-anim mfp-hide">
          <div class="panel">
          
            <form method="post" action="" id="comment">
              <div class="panel-body p25">

                  <section id="content" class="animated fadeIn"    ng-cloak ng-controller="accSetupCtrl">

                <!--<h2 class="lh30 mt15 text-center"><b class="text-system">Setting Wizard</b> </h2>-->
                <p class="lead mb20 text-center">Few steps to setup your account in few minutes.</p>
                <div class="row" ng-init="getpop()">
                    <div class="col-md-12 center-block">
                        <div class="bg-light br-a br-light p15 mb20 text-center text-muted">
                            <div class="row wizard-options">
                                <div class="col-xs-4 col-sm-3 ph10">
                                    <a href="#tab1_cmp" id="companytab" data-toggle="tab" class="holder-style p15 " data-steps-style="steps-left">
                                        <span class="fa fa-building  holder-icon"></span>
                                        <br> Organization<br>
                                        <span class="glyphicons glyphicons-circle_ok  holder-icon hidden" id="cmpicon" ng-model="org" name="orgname"  ng-maxlength="80" ng-pattern="/^[A-Za-z\s]+$/" required ></span>
                                        <span ng-show="orgform.orgname.$error.pattern"> Enter valid Input.</span>
                                        
                                    </a>
                                </div>
                                <div class="col-xs-4 col-sm-3 ph10">
                                    <a href="#tab1_shift" id="shifttab" data-toggle="tab" class="holder-style p15" data-steps-style="steps-left">
                                        <span class="fa fa-clock-o  holder-icon"></span>
                                        <br> Shift<br>
                                        <span class="glyphicons glyphicons-circle_ok  holder-icon hidden" id="shifticon"></span>
                                        
                                    </a>
                                </div>
                                <div class="col-xs-4 col-sm-3 ph10">
                                    <a href="#tab1_rules" id="rulestab" data-toggle="tab" class="holder-style p15" data-steps-style="steps-left">
                                        <span class="glyphicon glyphicon-list-alt holder-icon"></span>
                                        <br> Rules<br>
                                        <span class="glyphicons glyphicons-circle_ok  holder-icon hidden" id="rulesicon"></span>
                                        
                                    </a>
                                </div>
                                <div class="col-xs-4 col-sm-3 ph10">
                                    <a href="#tab1_emp" id="codetab" data-toggle="tab" class="holder-style p15" data-steps-style="steps-left">
                                        <span class="fa fa-users  holder-icon"></span>
                                        <br> Employee<br>
                                        <span class="glyphicons glyphicons-circle_ok  holder-icon hidden" id="codeicon"></span>
                                        
                                    </a>
                                </div>
                                
                             </div>
                        </div>

                        <!-- Form Wizard -->
                        <div class="admin-form   theme-system">
                        <div class="tab-content pn br-n admin-form">
                            <div id="tab1_2" class="tab-pane ">
                            <form method="post"  id="form-wizard" class="form-wizard " novalidate="novalidate">
                                <div class="wizard steps-bg steps-left clearfix" role="application" id="steps-uid-0">
                                    <div class="steps clearfix">
                                    <ul role="tablist">
                                        <li role="tab" class="first current" aria-disabled="false" aria-selected="true"><a id="steps-uid-0-t-0" href="#steps-uid-0-h-0" aria-controls="steps-uid-0-p-0"><span class="current-info audible">current step: </span><span class="number">1.</span> <i class="fa fa-user pr5"></i> User Details</a></li>
                                        <li role="tab" class="disabled" aria-disabled="true"><a id="steps-uid-0-t-1" href="#steps-uid-0-h-1" aria-controls="steps-uid-0-p-1"><span class="number">2.</span> <i class="fa fa-dollar pr5"></i> Payment</a></li>
                                        <li role="tab" class="disabled last" aria-disabled="true"><a id="steps-uid-0-t-2" href="#steps-uid-0-h-2" aria-controls="steps-uid-0-p-2"><span class="number">3.</span> <i class="fa fa-shopping-cart pr5"></i> Checkout</a></li>
                                    </ul>
                                    </div>
                                    <div class="content clearfix">

                                    <!-- Wizard step 1 -->
                                    <h4 class="wizard-section-title title current" id="steps-uid-0-h-0" tabindex="-1"><i class="fa fa-user pr5"></i> User Details</h4>
                                    <section class="wizard-section body current" id="steps-uid-0-p-0" role="tabpanel" aria-labelledby="steps-uid-0-h-0" aria-hidden="false">

                                        <div class="section">
                                            <label for="username" class="field-label">Choose your username</label>
                                            <div class="smart-widget sm-right smr-120">
                                                <label for="username" class="field prepend-icon">
                                                    <input type="text" name="username" id="username" class="gui-input" placeholder="john-doe">
                                                    <label for="username" class="field-icon"><i class="fa fa-user"></i>
                                                    </label>
                                                </label>
                                                <label for="username" class="button">.envato.com</label>
                                            </div>
                                            <!-- end .smart-widget section -->
                                        </div>
                                        <!-- end section -->

                                        <div class="section">
                                            <label for="password" class="field-label">Create a password</label>
                                            <label for="password" class="field prepend-icon">
                                                <input type="password" name="password" id="password" class="gui-input">
                                                <label for="password" class="field-icon"><i class="fa fa-lock"></i>
                                                </label>
                                            </label>
                                        </div>
                                        <!-- end section -->

                                    </section>

                                    <!-- Wizard step 2 -->
                                    <h4 class="wizard-section-title title" id="steps-uid-0-h-1" tabindex="-1"><i class="fa fa-dollar pr5"></i> Payment</h4>
                                    <section class="wizard-section body" id="steps-uid-0-p-1" role="tabpanel" aria-labelledby="steps-uid-0-h-1" aria-hidden="true" style="display: none;">

                                        <div class="section">
                                            <label for="firstname" class="field prepend-icon">
                                                <input type="text" name="firstname" id="firstname" class="gui-input" placeholder="First name...">
                                                <label for="firstname" class="field-icon"><i class="fa fa-user"></i>
                                                </label>
                                            </label>
                                        </div>
                                        <!-- end section -->

                                        <div class="section">
                                            <label for="lastname" class="field prepend-icon">
                                                <input type="text" name="lastname" id="lastname" class="gui-input" placeholder="Last name...">
                                                <label for="lastname" class="field-icon"><i class="fa fa-user"></i>
                                                </label>
                                            </label>
                                        </div>
                                        <!-- end section -->

                                    </section>

                                    <!-- Wizard step 3 -->
                                    <h4 class="wizard-section-title title" id="steps-uid-0-h-2" tabindex="-1"><i class="fa fa-shopping-cart pr5"></i> Checkout</h4>
                                    <section class="wizard-section body" id="steps-uid-0-p-2" role="tabpanel" aria-labelledby="steps-uid-0-h-2" aria-hidden="true" style="display: none;">

                                        <div class="section">
                                            <label for="email" class="field prepend-icon">
                                                <input type="email" name="email" id="email" class="gui-input" placeholder="Email address">
                                                <label for="email" class="field-icon"><i class="fa fa-envelope"></i>
                                                </label>
                                            </label>
                                        </div>
                                        <!-- end section -->

                                        <div class="section">
                                            <label for="mobile" class="field prepend-icon">
                                                <input type="tel" name="mobile" id="mobile" class="gui-input" placeholder="Telephone / moble number">
                                                <label for="mobile" class="field-icon"><i class="fa fa-phone-square"></i>
                                                </label>
                                            </label>
                                        </div>
                                        <!-- end section -->

                                    </section>
                                </div><div class="actions clearfix"><ul role="menu" aria-label="Pagination"><li class="disabled" aria-disabled="true"><a href="#previous" role="menuitem">Previous</a></li><li aria-hidden="false" aria-disabled="false"><a href="#next" role="menuitem">Next</a></li><li aria-hidden="true" style="display: none;"><a href="#finish" role="menuitem">Finish</a></li></ul></div></div>
                                <!-- End: Wizard -->

                            </form>
                            <!-- End Account2 Form -->
                        </div>
    
                      <div class="alert alert-success animated flipInX" ng-show="nameMsg" ng-cloak>
                <strong>Success!</strong> Company Name Added Successfully.
            </div>
            <div class="alert alert-danger animated flipInX" ng-show="nameFailMsg" ng-cloak>
                <strong>Failure!</strong> Company Name Already Exist.
            </div>
                    <div id="tab1_cmp" class="tab-pane active">
                        <div class="panel theme-system">
                        <form name="companyNameForm"  ng-submit="companyNameSubmit();" novalidate>
                                  <div class="panel-body p25">
                                     <div class="section-divider  mt10 mb40">
                                        <span>Company Details</span>
                                    </div>
                                    <div class="admin-form theme-system">
                                    <div class="col-md-12 pl15">
                                        <div class="section row mb10">
                                            <div class="col-md"><h6 class="fw400">Company Name</h6>
                                               <label for="cmpname" class="field prepend-icon">
                                                     <input ng-model="company.organisationName" type="text" name="cmpname"  class="event-name gui-input br-light light" placeholder="Company Name" value="" ng-pattern="/^[A-Za-z\s]+$/" ng-maxlength="50"required >
                                                         <span ng-show="companyNameForm.compname.$error.maxlength"> Enter valid Inputtt.</span>
                                                      <span ng-show="companyNameForm.compname.$error.pattern"> Enter valid Input.</span>
                                                     <label for="cmpname" class="field-icon"><i class="fa fa-tag"></i>
                                                     </label>
                                                 </label>
                                            </div>

                                        </div>
                                        <div class="section row mb10">
                                            <div class="col-md-6"><h6 class="fw400">Country</h6>
                                                 <label class="field select">
                                                     <select name="country" ng-model="company.countryId">
                                                        <option value="95" selected="selected" required>India</option>
                                                      </select>
                                                     <i class="arrow double"></i>
                                                 </label>
                                             </div>
                                            <div class="col-md-6"><h6 class="fw400">State</h6>
                                                  <label class="field select" id="statedropdown1">
                                                     <select name="state" ng-model="company.stateId" required>
                                                        <option value="{{state.stateId}}" ng-repeat="state in stateList">
                                                          {{state.stateName}}
                                                        </option>
                                                    </select>
                                                     <i class="arrow double"></i>
                                                 </label>
                                            </div>

                                        </div>                                       

                                    </div>


                                    </div>


                            </div>
                                <!-- end .form-body section -->
                                <div class="panel-footer submit-footer text-right">
                                    <button type="submit" id="CitySubmit" name="CitySubmit" data-btntext-sending="Saving..." class="button btn-system sending">Next</button>         
                                </div>
                                <!-- end .form-footer section -->
                            </form>
                            </div>
                    </div>
                            
                            <div class="alert alert-success animated flipInX" ng-show="succMsg" ng-cloak>
                <strong>Success!</strong> Shift Added Successfully.
              </div>
              <div class="alert alert-danger animated flipInX" ng-show="failMsg" ng-cloak>
                <strong>Failure!</strong> Shift Already Exists.
              </div>
                        <div id="tab1_shift" class="tab-pane">
                        <div class="panel theme-system">
                       



                        <form  ng-submit="companyShiftSubmit();" name="companyShiftForm" class="form-wizard" novalidate="novalidate">
                                                    <div class="panel-body p25">
                            <div class="section-divider  mt10 mb40">
                               <span>Shift Setting</span>
                           </div>
                             <!-- Form Wizard -->
                            <div class="admin-form theme-system">
             
                                <div class="section row mb10">
                                    <div class="col-md-6">
                                        <h6 class="fw400">Shift Name</h6>
                                        <label for="shift_name" class="field prepend-icon">
                                            <input type="text" 
                                            ng-model="company.branchShiftName" 
                                            name="shift_name" 
                                            id="shift_name" 
                                            class="gui-input letNumSpace" 
                                            placeholder="Enter shift name" 
                                            aria-required="true" ng-maxlength="20" required>
                                           
                                            
                                            <label for="shift_name" class="field-icon"><i class="fa fa-tag"></i>
                                            </label>
                                        </label>
                                    </div>

                                    
                                     <div class="col-md-6"> <h6 class="fw400">Processing Type </h6>
                                                    <label class="field select">
                                                        <select id="shift_processing_type" 
                                                        name="shift_processing_type"
                                                        ng-model="company.shiftProcessingType" ng-class=" {'ng-dirty' : submitted}" required>
                                                            <option value="">Select Processing Type</option>
                                                            <option value="FILO">First IN Last OUT</option>
                                                            <option value="FISOTIFO">1st IN 2nd OUT 3rd IN 4th OUT</option>
                                                        </select>
                                                        <i class="arrow double"></i>                    
                                                    </label>  
                                                </div>
                                </div>                              
                                 <div class="section row mb10">
                            <div class="col-md-2">
                                <h6 class="fw400">Start Time</h6>
                                <div class="section">
                                  <label for="timepicker1" class="field">
                                    <input type="text" id="timepicker1" name="timepicker1" class="gui-input" placeholder="Start Time" ng-model="company.startTime">
                                  </label>
                                </div>
                            </div>
                            <div class="col-md-2"><h6 class="fw400">Start Day</h6>
                                <label class="field select">
                                    <select id="startTimeDay" name="startTimeDay" ng-model="company.startTimeDay">
                                        <option value="" selected="selected">Day</option>
                                        <option value="1">1</option>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                            <div class="col-xs-1">
                                <h6 class="fw400">&nbsp;</h6>
                                <label for="to" class="field">  
                                    <input type="text" name="to" id="to" class="gui-input disabled " placeholder=" - " disabled="">
                                    </label>
                                
                            </div>
                            <div class="col-md-2">
                                <h6 class="fw400">End Time</h6> 
                                <div class="section">
                                  <label for="timepicker2" class="field">
                                    <input type="text" id="timepicker2" name="timepicker2" class="gui-input" placeholder="End Time" ng-model="company.endTime">
                                  </label>
                                </div>
                            </div>
                            <div class="col-md-2"><h6 class="fw400">End Day</h6>
                                <label class="field select">
                                    <select id="startTimeDay" name="startTimeDay" ng-model="company.endTimeDay">
                                        <option value="" selected="selected">Day</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                    </select>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                            <div class="col-xs-1">
                                <h6 class="fw400">&nbsp;</h6>
                                <label for="to" class="field">  
                                    <input type="text" name="to" id="to" class="gui-input disabled" placeholder=" = " disabled="">
                                    </label>
                               
                            </div>
                            <div class="col-md-2  ">
                                 <h6 class="fw400">Total Hrs</h6>
                                <label for="hr_tottime" class="field prepend-icon">
                                    <input type="text" name="hr_tottime" id="hr_tottime" class="gui-input tp" placeholder="00:00:00" value="" required="" aria-required="true">
                                    <label for="hr_tottime" class="field-icon"><i class=""></i>
                                    </label>
                                </label>
                            </div>        
                             <div class="col-md-1 hidden">
                             <h6 class="fw400">Is shift end on Next Day :</h6> 
                             <div class="mb10">
                                    <label class="block mt15 option option-system">
                                        <input type="checkbox" name="hr_nextday" id="hr_nextday">
                                        <span class="checkbox"></span>
                                        <a href="javascript:;" class="smart-link">  </a>
                                    </label>
                                 
                                </div>
                        </div>
                        </div>
                            </div>
                        </div>

                            <div class="panel-footer submit-footer text-right">
                              <span ng-show="shiftMsg" style="float: left; ng-cloak"><strong>Shift Already Defined....</strong></span>
                                <button type="submit" id="CitySubmit" name="CitySubmit" data-btntext-sending="Saving..." class="button btn-system  "  ng-click="submitted=true">Next</button>

                            </div>
                        </form>
                       </div>
                    </div>
                            
                            <div class="alert alert-success animated flipInX" ng-show="ruleMsg" ng-cloak>
                <strong>Success!</strong> Shift Rule Added Successfully.
              </div>
              <div class="alert alert-danger animated flipInX" ng-show="ruleFail" ng-cloak>
                <strong>Failed!</strong> Shift Rule Already exist.
              </div>
              <div class="alert alert-danger animated flipInX" ng-show="ruleFail" ng-cloak>
                <strong>Failed!</strong> Shift Rule not checked.
              </div>
                    <div id="tab1_rules" class="tab-pane">
                        <div class="panel theme-system">
                        <form ng-submit="companyShiftRuleSubmit();" id="RulesForm" class="form-wizard" novalidate="novalidate">

                                <div class="panel-body p25">
                                     <div class="section-divider  mt10 mb40">
                                        <span>Shift Rules</span>
                                    </div>
                                    <div class="admin-form theme-system">
                                    
                                            <div class="section row">
                            <div class="col-md">
                                <div class="mb10">
                                       <label class="block mt15 option option-system">
                                           <input type="checkbox" name="rules1" id="rules1" ng-true-value="1" ng-false-value="0"
                                            ng-model="check" ng-change="check_rule(check)" ng-disabled="checkdis == 'disabled'">
                                           
                                           <span class="checkbox"></span>Holiday as Overtime          
                                       </label>
                                   </div>
                           </div>
                        </div><input type="hidden" name="rules_new1" id="rules_new1" value="0">
                                   
                         </div>

                            </div>
                                <!-- end .form-body section -->
                                <div class="panel-footer  submit-footer text-right">
                                  <span ng-show="ruleExist" style="float: left;"><strong>Shift rule Already selected....</strong></span>
                               <button type="submit" id="CitySubmit" name="CitySubmit" data-btntext-sending="Saving..." class="button btn-system  ">Next</button>
                            
                                </div>
                                <!-- end .form-footer section -->
                            </form>
                            </div>
                    </div>
                            
                            <div class="alert alert-success animated flipInX" ng-show="codeSubmit" ng-cloak>
                <strong>Success!</strong> Employee Code Added Successfully.
              </div>
              <div class="alert alert-danger animated flipInX" ng-show="codeFail" ng-cloak>
                <strong>Failed!</strong> Employee Code Already exist.
              </div>
                            <div id="tab1_emp" class="tab-pane">
                        <div class="panel theme-system">
                        
                        <form ng-submit="companyEmployeeCodeSubmit();" name="companyEmployeeCode" id="EmpcodeForm" class="form-wizard" novalidate="novalidate">
                        <div class="panel-body p25">
                            <div class="section-divider  mt10 mb40">
                               <span>Employee Code Setting</span>
                           </div>
                                                         <!-- Form Wizard -->
                            <div class="admin-form theme-system">
                            
                            
                                <div class="section row" ng-model=rd ng-init="company.radio = rd">

                                    <p class="text-muted ml15"> <span class="fa fa-circle text-default fs10 pr5"></span> Method of generating employee code :</p>
                                    <div class="section col-md-6">
                                        <div class="radio-custom radio-system mb5">
                                                    <input ng-disabled="radioDisable == 'disable'" type="radio" id="Manual" name="inputtype" ng-value=0
                                                      ng-model="company.radio" ng-click="changeRadio(company.radio)" >
                                                    <label for="Manual">Manual</label>
                                                  
                                                </div>
                                    </div>
                                    <!-- end section -->
                                    
                                    <div class="section col-md-6">
                                        <div class="radio-custom radio-system mb5">
                                            <input ng-disabled="radioDisable == 'disable'" type="radio" id="Autogenerated" name="inputtype" ng-value=1
                                              ng-model="company.radio" ng-click="changeRadio(company.radio)">
                                            <label for="Autogenerated">Autogenerated </label>
                                            <!--<span class="label label-warning label-sm  lh20 h-20 mt5 mr5 ml5 fw10" > </span>-->
                                            <span class="glyphicons glyphicons-circle_question_mark ml5 text-warning h-20 lh20 fw10" data-container="body" data-trigger="hover" data-toggle="popover" data-placement="right" title="" data-content="Generate employee code automatically one after the other" data-original-title="Autogenerated"></span>
                                        </div>

                                    </div>
                                    <!-- end section -->

                                    

                                </div>
             
                                <div class="section row"  ng-show="generate">
                                    <p class="text-muted ml15"> <span class="fa fa-circle text-default fs10 pr5"></span> Want an Employee Code Prefix? </p>

                                        
                                    <div class="col-md-6 ">
                                        <label class="block switch switch-system">
                                                               <input type="checkbox" name="prefixchk" id="prefixchk" onclick="var input = document.getElementById('prefix'); if(this.checked){ input.disabled = false; input.focus();}else{input.disabled=true;}"
                                                               ng-true-value="1" ng-false-value="0" ng-model="precode" ng-change="preCodeChange(precode)">

                                                                
                                                               <label for="prefixchk" data-on="YES" data-off="NO"></label>
                                                               <span> Prefix
                                                                 <span class="glyphicons glyphicons-circle_question_mark ml5 text-warning h-20 lh20 fw10" data-container="body" data-trigger="hover" data-toggle="popover" data-placement="right" title="" data-content="a word or letter before the employee code number (eg: NWT007, NWT is the prefix)" data-original-title="dsds"> </span>

                                                                  
                                                               </span>  
                                                           </label>
                                    
                                  </div>
                                   <!-- end section -->

                                   <div class="col-md-6 ">
                                       <div class="section">
                                           <label class="field prepend-icon">
                                               <input type="text" ng-pattern="/^[A-Za-z]+$/" name="prefix" id="prefix" ng-model="company.prefix" class="gui-input NumLetHyRegex" placeholder="Code Prefix" value="" disabled="disabled">
                                               <label for="prefix" class="field-icon"><i class="fa fa-angle-left"></i>
                                               </label>
                                           </label>
                                       </div>
                                   </div>
                                    <!-- end section -->
                                </div>
                                <!-- end .section row section -->

                                <div class="section row"  ng-show="generate">
                                  <p class="text-muted ml15"> <span class="fa fa-circle text-default fs10 pr5"></span>Want an Employee Code Postfix?</p>
                                    <div class="col-md-6 ">
                                        <label class="block mt15 switch switch-system">
                                                               

                                                               <input type="checkbox" name="postfixchk" id="postfixchk" onclick="var input = document.getElementById('postfix'); if(this.checked){ input.disabled = false; input.focus();}else{input.disabled=true;}"
                                                               ng-true-value="1" ng-false-value="0" ng-model="postcode" ng-change="postCodeChange(postcode)">

                                                                 <label for="postfixchk" data-on="YES" data-off="NO"></label>
                                                               <span> Postfix
                                                               <span class="glyphicons glyphicons-circle_question_mark ml5 text-warning h-20 lh20 fw10" data-container="body" data-trigger="hover" data-toggle="popover" data-placement="right" title="" data-content="a word or letter after the employee code number (eg: 007NWT, NWT is the postfix)" data-original-title="Postfix"></span>
                                                               </span>
                                                           </label>

                                   </div>
                                   <!-- end section -->

                                   <div class="col-md-6">
                                        <div class="section">
                                            <label class="field prepend-icon">
                                                <input type="text" name="postfix" id="postfix" ng-model="company.postfix" class="gui-input NumLetHyRegex" placeholder="Code Postfix" ng-pattern="/^[A-Za-z]+$/" value="" disabled="disabled">
                                                <label for="postfix" class="field-icon"><i class="fa fa-angle-right"></i>
                                                </label>
                                            </label>
                                        </div>
                                    </div>
                                    <!-- end section -->
                                </div>
                                <!-- end .section row section -->

                                <div id="autodiv">

                                <div class="section row" ng-show="generate">

                                     <div class="col-md-6">
                                         <div class="mb10">
                                                <label class="block mt15 option option-system">
                                                    <input type="checkbox" name="numericstartchk" id="numericstartchk"  onclick="var input = document.getElementById('numericstart'); if(this.checked){ input.disabled = false; input.focus();}else{input.disabled=true;}" >
                                                    <span class="checkbox"></span> Select starting number for employee code?
                                                        <span class="glyphicons glyphicons-circle_question_mark ml5 text-warning h-20 lh20 fw10" data-container="body" data-trigger="hover" data-toggle="popover" data-placement="right" title="" data-content="enter start number in the same format (eg: if employee code starts at NWT007, type 007 in the box below)" data-original-title="Autogenerated"></span>
                                                    
                                                </label>
                                            </div>
                                    </div>
                                     <!--end section--> 

                                    <div class="col-md-6">
                                        <div class="section">
                                            <label class="field prepend-icon">
                                                <input type="text" name="numericstart" id="numericstart" class="gui-input" placeholder="Start Number" ng-model="company.startingValue" value="" disabled="disabled" ng-pattern="/^[0-9]+$/">
                                                <label for="numericstart" class="field-icon"><i class="fa fa-sort-numeric-asc"></i>
                                                </label>
                                            </label>
                                        </div>
                                    </div>
                                     <!--end section--> 
                                </div>
                                </div>
                            </div> <!-- admin form -->
            
                        </div>
                        <!-- end .form-body section -->
                            <div class="panel-footer  submit-footer text-right">
                                <span ng-show="codeExist" style="float: left;" ng-cloak><strong>Employee Code Already selected....</strong></span>
                               <button type="submit" id="CitySubmit" name="CitySubmit" data-btntext-sending="Saving..." class="button btn-system  ">
                                    Next                                </button>
                              
                            </div>
                        </form>
                       </div>
                    </div>
    
                            
                            <div id="tab1_payroll" class="tab-pane">
                        <div class="panel theme-system">
                        <form method="post" action="/" id="PayrollForm" class="form-wizard" novalidate="novalidate">

                                <div class="panel-body p25">
                                     <div class="section-divider  mt10 mb40">
                                        <span>Payroll Setting</span>
                                    </div>
                                    <div class="admin-form theme-system">
                                    
                                                            <div class="section row">
                            <div class="col-md-4">
                                <!--<h6 class="fw400">&nbsp;</h6>--> 
                                <div class="mb10">
                                       <label class="block mt15 option option-system">
                                           <input type="checkbox" name="rules5" id="rules5">
                                           
                                           <span class="checkbox"></span>LWF                                          
                                       </label>
                                   </div>
                           </div>
                        </div><input type="hidden" name="rules_new5" id="rules_new5" value="5">
                                           
                                            <div class="section row">
                            <div class="col-md-4">
                                <!--<h6 class="fw400">&nbsp;</h6>--> 
                                <div class="mb10">
                                       <label class="block mt15 option option-system">
                                           <input type="checkbox" name="rules4" id="rules4">
                                           
                                           <span class="checkbox"></span>TDS                                          
                                       </label>
                                   </div>
                           </div>
                        </div><input type="hidden" name="rules_new4" id="rules_new4" value="4">
                                           
                                            <div class="section row">
                            <div class="col-md-4">
                                <!--<h6 class="fw400">&nbsp;</h6>--> 
                                <div class="mb10">
                                       <label class="block mt15 option option-system">
                                           <input type="checkbox" name="rules3" id="rules3">
                                           
                                           <span class="checkbox"></span>PT                                          
                                       </label>
                                   </div>
                           </div>
                        </div><input type="hidden" name="rules_new3" id="rules_new3" value="3">
                                           
                                            <div class="section row">
                            <div class="col-md-4">
                                <!--<h6 class="fw400">&nbsp;</h6>--> 
                                <div class="mb10">
                                       <label class="block mt15 option option-system">
                                           <input type="checkbox" name="rules2" id="rules2">
                                           
                                           <span class="checkbox"></span>PF                                          
                                       </label>
                                   </div>
                           </div>
                        </div><input type="hidden" name="rules_new2" id="rules_new2" value="2">
                                           
                                            <div class="section row">
                            <div class="col-md-4">
                                <!--<h6 class="fw400">&nbsp;</h6>--> 
                                <div class="mb10">
                                       <label class="block mt15 option option-system">
                                           <input type="checkbox" name="rules1" id="rules1">
                                           
                                           <span class="checkbox"></span>ESIC                                          
                                       </label>
                                   </div>
                           </div>
                        </div><input type="hidden" name="rules_new1" id="rules_new1" value="1">
                                           
                    

                                    </div>


                            </div>
                                <!-- end .form-body section -->
                                <div class="panel-footer  submit-footer text-right">
                                    
                                <button type="submit" id="CitySubmit" name="CitySubmit" data-btntext-sending="Saving..." class="button btn-system  " ng-click="submitted=true">Finish</button>
                                
                                    <!--<button type="submit" id="CitySubmit" name="CitySubmit" class="button btn-system" value="submit">Finish</button>-->

                                </div>
                                <!-- end .form-footer section -->
                            </form>
                            </div>
                    </div>
     </div>
                        </div>
                        <!-- end: .admin-form -->

                    </div>

                </div>

            </section>
              
              </div>
              

            </form>
          </div>
          
</shiro:hasRole>

  <script src="/assets/js/main.js"></script>
     <!-- End: Content -->
      <script type="text/javascript">

    "use strict";

    // Init Theme Core      
    Core.init();

    // Init Demo JS
    Demo.init();

    jQuery(document).ready(function() {

    $('#datetimepicker1').datetimepicker({
       pickTime: false
    });
    $('#datetimepicker2').datetimepicker({
       pickTime: false
    });

    // Init DateTimepicker - inline + range detection
    $('#datetimepicker3').datetimepicker({
      defaultDate: "9/4/2014",
      inline: true,
      format: 'DD-MM-YYYY'
    });

    // Init DateTimepicker - fields + Date disabled (only time picker)
    $('#datetimepicker5').datetimepicker({
      defaultDate: "9/25/2014",
      pickDate: false,
      format: 'DD-MM-YYYY'
    });
    // Init DateTimepicker - fields + Date disabled (only time picker)
    $('#datetimepicker6').datetimepicker({
      defaultDate: "9/25/2014",
      pickDate: false,
    });
    // Init DateTimepicker - inline + Date disabled (only time picker)
    $('#datetimepicker7').datetimepicker({
      defaultDate: "9/25/2014",
      pickDate: false,
      inline: true
    });
});
</script>
<script type="text/javascript">
var Popup = function(){
  $.magnificPopup.open({
      removalDelay: 500, 
      items: {
        src: '#attendance'
      },
      // overflowY: 'hidden', // 
      callbacks: {
        beforeOpen: function(e) {
          var Animation = $("#animation-switcher").find('.active-animation').attr('data-effect');
          this.st.mainClass = Animation;
        }
      },
      midClick: true 
    });
    };


  </script>
<script>
	<shiro:hasRole name="COMPANY_ADMIN">
	<c:if test="${loginnedUser.companySetup != true}">
	 if(location.href.indexOf("/home")>0){
	    // Inline Admin-Form example 
	    
	    Popup();
	         }
	 </c:if>
	
	</shiro:hasRole>

</script>
</body>

</html>
