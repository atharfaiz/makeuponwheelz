/**
 * 
 */

	mainApp.controller("subcatCtrl", ["$scope", "$http","$window", function($scope, $http, $window) {
        console.log(window.location.host);
        console.log(window.location.hostname);
        $scope.hostPrefix = 'http://35.154.27.124';
		var locationArr = window.location.pathname.split("/");
        $scope.subcatAlias = locationArr[2];
        $scope.catalias = locationArr[1];
        console.log(locationArr);
        $scope.productList = [];
        $scope.productListLen = 0;
        $http({
			method: 'POST',
			url: '/get/subcat/products',
			params: {
				subcatAlias: $scope.subcatAlias,
				catAlias : $scope.catalias
			}
		})
		.then(function(responses){
			console.log(responses.data);
			$scope.productList = [];
			$scope.productList = responses.data;
			$scope.productListLen = $scope.productList.length;
		});
        
	}]);