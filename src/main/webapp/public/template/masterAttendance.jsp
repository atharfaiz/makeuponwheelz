<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="customShiroTags" %>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.html" />
    <link rel="icon" type="image/png" href="/assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>CSS SOFTLAB PVT LTD.</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    
    <!-- <link href="/assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css"/> -->
    <!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="/assets/vendors/moment.min.js"></script>
      <link href="/assets/plugins/bootstrap-select2/select2.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/assets/vendors/material.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="/assets/css/wunder.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
    <link href="/assets/vendors/material-design-iconic-font/dist/css/material-design-iconic-font.min.css" rel="stylesheet">
	<script src="/assets/vendors/jquery-3.1.1.min.js" type="text/javascript "></script>
	<%-- <script src="<c:url value="/assets/plugins/jquery-1.8.3.min.js"/>" type="text/javascript"></script> --%>
	<script src="<c:url value="/assets/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js"/>" type="text/javascript"></script>
	<!-- <script src="/assets/plugins/bootstrap-multiselect/bootstrap-multiselect.css"></script> -->
	<!-- <link href="/assets/plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/> -->
	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script> -->
	<!-- <script src="/assets/plugins/angular-bootstrap-multiselect/angular-bootstrap-multiselect.min.js"></script> -->
	
	<!-- <script src="/assets/js/ng/application.js"></script>
	 -->
	 
	 <style>
	.navbar[data-topbar-color="blue"] {
  			background-color: #F44336;
  			color: #FFFFFF;
  	}
	</style>
</head>

<body>
    <div class="wrapper">
        <!-- Start: Sidebar Left Menu -->
       <tiles:insertAttribute name="sidebar" />
        <!-- End: Sidebar Menu -->
        <div class="main-panel">
           <tiles:insertAttribute name="header" />
            <tiles:insertAttribute name="body" />
            <tiles:insertAttribute name="footer" />
        </div>
      
    </div>
</body>
<!--   Core JS Files   -->
<script src="/assets/vendors/jquery-ui.min.js" type="text/javascript "></script>
<script src="/assets/vendors/tether.min.js" type="text/javascript"></script>
<script src="/assets/vendors/bootstrap.min.js" type="text/javascript "></script>
<script src="/assets/vendors/perfect-scrollbar.jquery.min.js" type="text/javascript "></script>
<!-- Forms Validations Plugin -->
<script src="/assets/vendors/jquery.validate.min.js"></script>

<script src="/assets/plugins/jquery-block-ui/jqueryblockui.js" type="text/javascript"></script>
      <script src="/assets/plugins/jquery-unveil/jquery.unveil.min.js" type="text/javascript"></script>
<script src="/assets/plugins/bootstrap-select2/select2.min.js" type="text/javascript" defer></script>
<!--  Plugin for the Wizard -->
<script src="/assets/vendors/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script src="/assets/vendors/bootstrap-notify.js"></script>
<!-- DateTimePicker Plugin -->
<script src="/assets/vendors/bootstrap-datetimepicker.js"></script>

<!-- Vector Map plugin -->
<script src="/assets/vendors/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script src="/assets/vendors/nouislider.min.js"></script>
<!--  DataTables.net Plugin    -->
<script src="/assets/vendors/datatable/jquery.dataTables.min.js"></script>
<script src="/assets/vendors/datatable/dataTables.bootstrap4.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<!-- Select Plugin -->
<script src="/assets/vendors/jquery.select-bootstrap.js"></script>
<!-- Sweet Alert 2 plugin -->
<script src="/assets/vendors/sweetalert/sweetalert2.min.js"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="/assets/vendors/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="/assets/vendors/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="/assets/vendors/jquery.tagsinput.js"></script>
<!-- <script src="/assets/plugins/bootstrap-multiselect/bootstrap-multiselect.js"></script> -->

<!-- Material Dashboard javascript methods -->
<script src="/assets/js/wunder.min.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="/assets/js/demo.min.js"></script>
<script src="/assets/js/charts/flot-charts.min.js"></script>
<script src="/assets/js/charts/chartjs-charts.min.js"></script>

</html>
