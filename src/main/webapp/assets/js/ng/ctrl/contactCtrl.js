/**
 * 
 */

	mainApp.controller("contactCtrl", ["$scope", "$http","$window", function($scope, $http, $window) {
        
        $scope.userMobile = '';
        $scope.userMail = '';
        $scope.userMessage = '';
        $scope.userName = '';
        $scope.queryStatus = '';
        $scope.mailProcess = false;
        
        $scope.sendUserMail = function(){
        	$scope.mailProcess = true;
        	$scope.queryStatus = '';
        	$('#mail_success').hide();
            $('#mail_fail').hide();
        	$http({
    			method: 'POST',
    			url: '/send/user/mail/query',
    			params: {
    				userMail : $scope.userMail,
    				userMobile : $scope.userMobile,
    				userMessage : $scope.userMessage,
    				userName : $scope.userName
    			}
    		})
    		.then(function(responses){
    			//console.log(responses.data);
    			$scope.mailProcess = false;
    			$scope.queryStatus = '';
    	        $scope.queryStatus = responses.data.status;
    	       if($scope.queryStatus == 'success'){
    	    	   $('#mail_success').show();
    	       }else{
    	    	   $('#mail_fail').show();
    	       }
    	     
    		});
        	
        }
		
	}]);