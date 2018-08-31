<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>

<html>

<head>
	<meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.html" />
    <link rel="icon" type="image/png" href="/assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>CSS SOFTLAB PVT. LTD.</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/assets/vendors/material.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="/assets/css/wunder.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="../../../../maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

  
</head>

<body style="background-image: url(/assets/img/bg-home.jpg);">

    <nav class="navbar navbar-primary navbar-transparent navbar-absolute">
      <div class="navbar-header d-flex">
          <a class="navbar-brand" href="#"> CSS SOFTLAB PVT. LTD. </a>
      </div>
    </nav>
    
    <div class="wrapper wrapper-full-page">
        <div class="full-page login-page"  data-color="blue">
            <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
            <div class="content">
                <div class="container">
                    <div class="row" ng-app="mainApp"   ng-cloak ng-controller="mainController">
                        <div class="col-lg-5 col-md-7 mx-auto" style="padding-top: 7%;">
                            <form method="post"  name= "Login" novalidate>
                                <div class="card card-login">
                                    <div class="card-header text-center">
                                        <h4 class="card-title">Login</h4>
                                    </div>
                                    
                                    <div class="card-content">

                                            <div class="social-line">
                                   <!--     	<h5>Connect Using</h5>
                                            <a href="#btn" class="btn btn-just-icon btn-default">
                                                <i class="fa fa-facebook-square"></i>
                                            </a>
                                            <a href="#pablo" class="btn btn-just-icon btn-default">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                            <a href="#eugen" class="btn btn-just-icon btn-default">
                                                <i class="fa fa-google-plus"></i>
                                            </a>             -->
                                        </div>
								<!--		<span class="or-rule">or</span>   
								<!--		<h5 class="text-center">Customized Software Solution Account</h5>     -->
                                        <div class="form-group">
                                          <div class="input-group">  
                                             <div class="input-group-addon"> 
                                                  <i class="material-icons">face</i>
                                              </div>                                                                  
                                       <!--        <input type="text" class="form-control" placeholder="Username">  -->
                                                 <input type="text" name="username" class="form-control" placeholder="User"  ng-model="username" required>
                                          </div>
                                           <span style = "color:red; margin-left: 80px;" ng-show = "Login.username.$dirty && Login.username.$invalid">
                                                        <span ng-show = "Login.username.$error.required">Username is required.</span> 
                                                        
                                                        </span>    

                                        </div>
                                        <div class="form-group">
                                          <div class="input-group">
                                              <div class="input-group-addon">
                                                  <i class="material-icons">lock_outline</i>
                                              </div>
                                 <!--             <input type="password" class="form-control" placeholder="Password">     -->
                                                  <input type="password" class="form-control" ng-keyup="$event.keyCode == 13 && signInForm()" placeholder="Password" name="password" ng-model = "password"  required>
                                          </div>
                                            <span style = "color:red" ng-show = "Login.password.$dirty && Login.password.$invalid">
                                                        <span ng-show = "Login.password.$error.required"><br>Password is required.</span>
                                                       </span>
                                          </div>      
                                          </div>
                                    <div class="text-center">
                                        <button type="button"  ng-click = "signInForm()" class="btn btn-wd btn-lg">Sign In</button>
                                         <div id="submitErrorMessage" ng-model="submitErrorMessage" style="color:red">{{submitErrorMessage}}</div>
                                    </div>
                                       
                                </div>
                            </form>
                        </div>


                    </div>
                </div>
            </div>
    <!--        <footer class="footer">
                <div class="container">
                    <nav class="float-left">
                        <ul>
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <p class="copyright float-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        <a href="http://www.wunder.com/">Wunder</a> BootStrap Admin Dashboard
                    </p>
                </div>
            </footer>     -->
        </div>
    </div>
</body>
<!--   Core JS Files   -->


          <script>
                          var mainApp = angular.module("mainApp", []);

                           mainApp.controller('mainController', function($scope, $http) {
                            
                             $scope.username = "";
                             $scope.password = "";
                             $scope.submitErrorMessage="";
                             
                             $scope.signInForm = function(){
                            	 console.log('username  '+ $scope.username+'  password   '+$scope.password);
                                    if($scope.Login.$valid){
                                        //alert("You have registered succesfully");
                                        $scope.submitErrorMessage="";
                                        $http({
                            				method : 'post',
                            				url : '/loginVerify',
                            				params :{
                            					username : $scope.username,
                            					password : $scope.password
                            				}
                            				})
                            				.then(function(responses){
                            					console.log(responses);
                            					$('#upload-btn').removeAttr('disabled');
                            					
                            					if(responses.data.message == "success")
                            						window.location = "/home";
                            					else if(responses.data.message == "expire")		
                            						$scope.submitErrorMessage = "Your account has been expired. Contact to ADMIN...";
                            					else if(responses.data.message == "inactive"){
                            						$scope.submitErrorMessage = "Your account has been temporary deactivated , Please Contact CSS...";
                            					}
                            					else
                            						$scope.submitErrorMessage = "Username and Password mismatch..";
                            					
                            					if(responses.data.result == "success"){
                            						$('#statusupmsg').show();
                            						$('#statusupmsg').delay(4000).fadeOut();
                            						
                            					}
                            					//$scope.succMsg = true;
                            					//$scope.msg = "Student Fee Uploaded Successfully."
                            				})
                                        
                                    }
                                    else{
                                        //alert("Please fill all the details Correctly");
                                        
                                       // $scope.submitErrorMassage="";
                                        $scope.submitErrorMessage="Please fill all the fields";
                                        return false;
                                    }
                                 }
                              });
          </script>                                   


<script src="/assets/vendors/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="/assets/vendors/jquery-ui.min.js" type="text/javascript"></script>
<script src="/assets/vendors/tether.min.js" type="text/javascript"></script>
<script src="/assets/vendors/bootstrap.min.js" type="text/javascript"></script>

<script src="/assets/vendors/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script src="/assets/vendors/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="/assets/vendors/moment.min.js"></script>
<!--  Charts Plugin -->
<script src="/assets/vendors/chartist.min.js"></script>
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
<!-- Material Dashboard javascript methods -->
<script src="/assets/js/wunder.min.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="/assets/js/demo.min.js"></script>

</html>

