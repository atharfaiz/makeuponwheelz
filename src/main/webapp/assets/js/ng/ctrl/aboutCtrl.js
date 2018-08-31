/**
 * 
 */

	mainApp.controller("aboutUsCtrl", ["$scope", "$http","$window", function($scope, $http, $window) {
        
        $scope.artistList = [];
        
        $http({
			method: 'POST',
			url: '/get/stylist/artist/data'
		})
		.then(function(responses){
			
			$scope.artistList = [];
			$scope.artistList = responses.data;
		});
		
	}]);