<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="shiro" uri="customShiroTags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MAKE UP ON WHEELS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Responsive Minimal Salon Website Template">
    <meta name="keywords" content="barber,beauty,clean,gallery,healthcare,make-up,mashup,massage,menucard,portfolio,products,salon,sauna,skin,spa">
    <meta name="author" content="">


    <!--[if lt IE 9]>
	<script src="/assets/js/html5shiv.js"></script>
	<![endif]-->


    <!-- CSS Files
    ================================================== -->
    <link rel="stylesheet" href="/assets/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/jpreloader.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/animate.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/plugin.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/owl.carousel.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/owl.theme.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/owl.transitions.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/style.css" type="text/css">
    <link rel="stylesheet" href="demo/demo.css" type="text/css">

    <!-- custom background -->
    <link rel="stylesheet" href="/assets/css/bg.css" type="text/css">

    <!-- color scheme -->
    <link rel="stylesheet" href="/assets/css/color.css" type="text/css" id="colors">

    <!-- load fonts -->
    <link rel="stylesheet" href="/assets/fonts/font-awesome/css/font-awesome.css" type="text/css">
    <link rel="stylesheet" href="/assets/fonts/elegant_font/HTML_CSS/style.css" type="text/css">
    <link rel="stylesheet" href="/assets/fonts/et-line-font/style.css" type="text/css">

    <!-- revolution slider -->
    <link rel="stylesheet" href="/assets/rs-plugin/css/settings.css" type="text/css">
    <link rel="stylesheet" href="/assets/css/rev-settings.css" type="text/css">
    
    <link rel="stylesheet" href="/assets/fonts/elegant_font/HTML_CSS/lte-ie7.js" type="text/css">
    <script src="/assets/js/ng/angular.min.js"></script>
	<script src="/assets/js/ng/application.js"></script>
</head>

    <body id="homepage" ng-app="mainApp" ng-clock>

        <div id="wrapper">

        <!-- Top Bar -->
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="sidebar" />


        <!-- Main Content -->
        <tiles:insertAttribute name="body" />
        <tiles:insertAttribute name="footer" />
        </div>

    

    <!-- Javascript Files
    ================================================== -->
    
    <script src="/assets/js/jquery.min.js"></script>
    
	 <script src="/assets/js/jpreLoader.js"></script>   
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/jquery.isotope.min.js"></script>
    <script src="/assets/js/easing.js"></script>
    <script src="/assets/js/jquery.flexslider-min.js"></script>
    <script src="/assets/js/jquery.scrollto.js"></script>
    <script src="/assets/js/owl.carousel.js"></script>
    <script src="/assets/js/jquery.countTo.js"></script>
    <script src="/assets/js/classie.js"></script>
    <script src="/assets/js/video.resize.js"></script>
    <script src="/assets/js/validation.js"></script>
    <script src="/assets/js/wow.min.js"></script>
    <script src="/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="/assets/js/enquire.min.js"></script>
    <script src="/assets/js/jquery.stellar.min.js"></script>
    <script src="/assets/js/designesia.js"></script>
    <script src="/assets/demo/demo.js"></script>

    <!-- SLIDER REVOLUTION SCRIPTS  -->
    <script type="text/javascript" src="/assets/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="/assets/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

    <!-- current page only scripts -->
    <script src="/assets/js/typed.js"></script>
    <script src="/assets/js/typed-custom.js"></script>


    </body>
</html>
