<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html class="no-js " lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

<title>Makeup on Wheels : Admin</title>
<!-- Favicon-->
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">

<!-- Custom Css -->
<link rel="stylesheet" href="/assets/css/main.css">    
<link rel="stylesheet" href="/assets/css/color_skins.css">

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

</head>
<body class="theme-purple">
<div class="authentication"  ng-app="mainApp"   ng-cloak ng-controller="mainController">
    <div class="container">
        <div class="col-md-12 content-center">
        <div class="row clearfix">
            <div class="col-lg-6 col-md-12">
                <div class="company_detail">
                    <h4 class="logo"><img src="/assets/images/logo.svg" alt="Logo"> Makeup on Wheels</h4>
                    <h3><strong>Login In</strong></h3>
                    <p>Admin Dashboard</p> 
                </div>
            </div>                        
            <div class="col-lg-5 col-md-12 offset-lg-1">
                <div class="card-plain">
                    <div class="header">
                        <h5>Log in</h5>
                    </div>
                    <form class="form" method="post"  name= "Login" novalidate>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="User Name" ng-model="username" required>
                            <span style = "color:red; margin-left: 80px;" ng-show = "Login.username.$dirty && Login.username.$invalid">
                            	<span ng-show = "Login.username.$error.required">Username is required.</span> 
                             </span>    
                            <span class="input-group-addon"><i class="zmdi zmdi-account-circle"></i></span>
                        </div>
                        <div class="input-group">
                            <input type="password" style="color: black;" ng-keyup="$event.keyCode == 13 && signInForm()" placeholder="Password" name="password" ng-model = "password"  required class="form-control" />
                            <span style = "color:red" ng-show = "Login.password.$dirty && Login.password.$invalid">
                                <span ng-show = "Login.password.$error.required"><br>Password is required.</span>
                            </span>
                            <span class="input-group-addon"><i class="zmdi zmdi-lock"></i></span>
                        </div>                            
                    </form>
                    <div class="footer">
                        <a href="#" ng-click = "signInForm()"  class="btn btn-primary btn-round btn-block">SIGN IN</a>
                        <div id="submitErrorMessage" ng-model="submitErrorMessage" style="color:red">{{submitErrorMessage}}</div>
                        <a href="sign-up.html" class="btn btn-primary btn-simple btn-round btn-block">SIGN UP</a>
                    </div>
                    <a href="forgot-password.html" class="link">Forgot Password?</a>
                </div>
            </div>
        </div>
        </div>
    </div>
    <div id="particles-js"></div>
</div>


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
<!-- Jquery Core Js -->
<script src="/assets/bundles/libscripts.bundle.js"></script>
<script src="/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->

<script src="/assets/plugins/particles-js/particles.min.js"></script>
<script src="/assets/plugins/particles-js/particles.js"></script>
</body>
</html>