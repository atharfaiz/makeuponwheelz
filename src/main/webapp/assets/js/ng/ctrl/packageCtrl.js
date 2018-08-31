/**
 * 
 */

	mainApp.controller("packageCtrl", ["$scope", "$http","$window", function($scope, $http, $window) {
       
		$scope.packageList = [];
        $scope.packageProductList = [];
        $scope.selctedPackae = {};
        $scope.addPackageDisable = false;
        $http({
			method: 'POST',
			url: '/get/active/packages'
		})
		.then(function(responses){
			console.log(responses.data);
			$scope.packageList = [];
			$scope.packageList = responses.data;
			/*$scope.packageProductList = $scope.packageList[0].packageProduct;
			$scope.selctedPackae = $scope.packageList[0];
			if(localStorage.userProductData == undefined){
	        	localStorage.userProductData = [];
	        }
	        if(localStorage.userPackageData == undefined){
	        	localStorage.userPackageData = [];
	        }*/
	        
		});
        
	}]);