/**
 * 
 */

	mainApp.controller("loginCtrl", ["$scope", "$http","$window", function($scope, $http, $window) {
        
        $scope.username = '';
        $scope.password = '';
        $scope.loginSuccess = false;
        $scope.loginFailed = false;
        
        $scope.forgotPwd = false;
        $scope.forgetMail = '';
        $scope.newpassword = '';
        $scope.otp = '';
        $scope.otpVerify = false;
        $scope.forgetPwdSubmitted = false;
        $scope.msg = "";
        $scope.buttonlabel = 'Send Otp';
        
        $scope.loginVerify = function(){
        	$scope.msg = "";
        	$scope.loginSuccess = false;
            $scope.loginFailed = false;
            $('#mail_success').hide();
            $('#mail_fail').hide();
            if($scope.username==''||$scope.password==''){
            	$scope.msg = "Sorry, login mail or passwords can't be blank.";
				$('#mail_fail').show();
            }else{
            	$http({
    				method: 'POST',
    				url: '/loginVerify',
    				params: {
    					username: $scope.username,
    					password: $scope.password
    				}
    			})
    			.then(function(responses){
    				console.log(responses.data);
    				if(responses.data.message == 'success'){
    					$scope.loginSuccess = true;
    					$scope.msg = "Your logined in successfully.";
    					$('#mail_success').show();
    					window.location.pathname = "/home";
    				}else{
    					$scope.loginFailed = true;
    					$scope.msg = "Sorry, login id or passwords have not matched.";
    					$('#mail_fail').show();
    				}
    			});
            }
			
			console.log($scope.loginFailed);
        }
        
        
       $scope.forgetPassword = function(){
    	   $('#mail_success').hide();
           $('#mail_fail').hide();
    	   $scope.forgotPwd = true;
       }
       $scope.loginMode = function(){
    	   $('#mail_success').hide();
           $('#mail_fail').hide();
    	   $scope.forgotPwd = false;
       }
       
       $scope.resetPassword = function(){
    	   //$scope.forgetPwdSubmitted = true;
    	   //$scope.forgetPwdSubmitted = true;
    	   $scope.msg = "";
    	   console.log('====log======'+$scope.forgetPwdSubmitted);
    	   $('#mail_success').hide();
           $('#mail_fail').hide();
           //$scope.buttonlabel = 'Send Otp';
           if ($scope.contactForm.forgetMail.$invalid) {
	    		 $scope.forgetPwdSubmitted = true;
	    		 //console.log('====log===2==='+$scope.forgetPwdSubmitted);
           }else{
        	   //console.log('====log====3=='+$scope.forgetPwdSubmitted);
        	   if($scope.otpVerify){
        		   if($scope.contactForm.$invalid){
        			   $scope.forgetPwdSubmitted = true;
        		   }else{
        			   $http({
       	   				method: 'POST',
       	   				url: '/user/forget/password/reset',
       	   				params: {
       	   					mail: $scope.forgetMail,
       	   					otp : $scope.otp,
       	   					password : $scope.newpassword
       	   				}
       	   			})
       	   			.then(function(responses){
       	   				console.log(responses.data);
       	   				if(responses.data.status == 'success'){
       	   					$scope.otpVerify = true
       	   					$scope.msg = "Password successfully changed.";
       	   					$('#mail_success').show();
       	   					$scope.forgetPwdSubmitted = false;
       	   					$scope.buttonlabel = 'Send Otp';
       	   				}else{
       	   					$scope.msg = "Wrong otp";
       	   					$('#mail_fail').show();
       	   				}
       	   			});
        		   }
        		   
        	   }else{
        		  
    	   			$http({
    	   				method: 'POST',
    	   				url: '/user/forget/password',
    	   				params: {
    	   					mail: $scope.forgetMail
    	   				}
    	   			})
    	   			.then(function(responses){
    	   				console.log(responses.data);
    	   				if(responses.data.status == 'success'){
    	   					$scope.otpVerify = true
    	   					$scope.forgetPwdSubmitted = false;
    	   					$scope.msg = "";
    	   					$scope.buttonlabel = 'Reset Password';
    	   				}else{
    	   					$scope.msg = "Entered mail not available.";
    	   					$('#mail_fail').show();
    	   				}
    	   			});
        	   }
           }
    	   
       }
        
	}]);