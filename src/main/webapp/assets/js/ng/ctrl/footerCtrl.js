/**
 * 
 */

	mainApp.controller("footerCtrl", ["$scope", "$http","$window", function($scope, $http, $window) {
        
        $scope.workingHour = [];
        $scope.storePhone = '';
        $scope.storeEmail = '';
        $scope.storeAddress = '';
        $scope.storeAlterPhone = '';
        $scope.storeAbout = '';
        $scope.storeAboutMore = false;
        
		$http({
			method: 'POST',
			url: '/get/contact/info'
		})
		.then(function(responses){
			//console.log(responses.data);
			$scope.storePhone = '';
	        $scope.storeEmail = '';
	        $scope.storeAddress = '';
	        $scope.storeAlterPhone = '';
	        $scope.storeAbout = '';
	        $scope.storePhone = responses.data.phone;
	        $scope.storeEmail = responses.data.storeMail;
	        $scope.storeAddress = responses.data.storeAddress;
	        $scope.storeAlterPhone = responses.data.storeAlterNo;
	        $scope.storeAbout = responses.data.storeAbout;
	        $scope.storeAboutSub = responses.data.storeAboutSub;
	        
	        
		});
		
		$http({
			method: 'POST',
			url: '/get/working/hour'
		})
		.then(function(responses){
			//console.log(responses.data);
			$scope.workingHour = [];
			$scope.workingHour = responses.data;
		});
		
		$scope.expandAbout = function(){
			
			$scope.storeAboutMore = true;
			$scope.storeAboutSub = $scope.storeAbout;
		
		}
	
	}]);