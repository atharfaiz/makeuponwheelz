/**
 * 
 */

	mainApp.controller("registerCtrl", ["$scope", "$http","$window", function($scope, $http, $window) {
        
		$scope.registerSubmit = false;
		$scope.otpSubmit = false;
        $scope.name = '';
        $scope.password = '';
        $scope.usermail = '';
        $scope.phone = '';
        $scope.otp = '';
        $scope.address = '';
        $scope.hideDetail = false;
        $scope.msg = '';
        $scope.continueLogin = false;
        $scope.checklog = function(){
        	console.log($scope.continueLogin);
        }
        
        $scope.registerVerify = function(){
        	$scope.registerSubmit = false;
        	$('#mail_success').hide();
            $('#mail_fail').hide();
			
        	if($scope.form_regis.$invalid){
        		$scope.registerSubmit = true;
        	}else{
        		$scope.registerSubmit = false;
        		$scope.msg = '';
            	$scope.hideDetail = false;
                $http({
    				method: 'POST',
    				url: '/user/registration',
    				params: {
    					name: $scope.name,
    					password: $scope.password,
    					mail: $scope.usermail,
    					phone: $scope.phone,
    					address: $scope.address
    				}
    			})
    			.then(function(responses){
    				console.log(responses.data);
    				if(responses.data.status == 'success'){
    					$scope.hideDetail = true;
    					//$scope.otp = responses.data.otp;
    				}else if(responses.data.status == 'already'){
    					$scope.msg = 'Sorry, User Mail already exist..';
    					$('#mail_fail').show();
    				}else{
    					$scope.msg = 'Sorry, error occured this time sending your message.';
    					$('#mail_fail').show();
    				}
    			});
        	}
        	
        }
        
        $scope.otpVerify = function(){
        	$scope.otpSubmit = false;
        	console.log($scope.continueLogin);
        	$('#mail_success').hide();
            $('#mail_fail').hide();
        	
        	if($scope.otp.length==4){
        		$http({
    				method: 'POST',
    				url: '/user/otp/verify',
    				params: {
    					mail: $scope.usermail,
    					otp: $scope.otp
    				}
    			})
    			.then(function(responses){
    				console.log(responses.data);
    				if(responses.data.status == 'success'){
    					$('#mail_success').show();
    					if($scope.continueLogin){
    						$http({
    							method: 'POST',
    							url: '/loginVerify',
    							params: {
    								username: $scope.usermail,
    								password: $scope.password
    							}
    						})
    						.then(function(responses){
    							console.log(responses.data);
    							if(responses.data.message == 'success'){
    								window.location.pathname = '/home';
    							}else{
    								$scope.loginFailed = true;
    								$('#mail_fail').show();
    							}
    						});
    					}
    				}else{
    					$scope.msg = 'Sorry, Otp Mismatch. Please try again.';
    					$('#mail_fail').show();
    				}
    			});
        	}else{
        		$scope.otpSubmit = true;
        	}
        	
        }
        
	}]);