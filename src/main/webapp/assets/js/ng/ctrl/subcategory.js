/**
 * 
 */

	
	mainApp=angular.module('mainApp',  ['datatables']);
	
	mainApp.controller("subcategory", ["$scope", "$http","$window", function($scope, $http, $window) {
		
		$scope.categoryList = [];
		$scope.subcategoryList = [];
		$scope.showTable = true;
		$scope.subcategoryName = "";
		$scope.subcategoryId = "";
		$scope.categoryId = "";
		
		
		var table = $('#dtable').DataTable();
		table.destroy();
		
		$http({
			method: 'GET',
			url: '/admin/api/category'
			})
			.then(function(responses){
					console.log(responses);
					$scope.categoryList = responses.data.data;
					console.log($scope.categoryList);
			});
		
		$http({
			method: 'GET',
			url: '/admin/api/subcategory'
			})
			.then(function(responses){
					console.log(responses);
					$scope.subcategoryList = responses.data.data;
					console.log($scope.subcategoryList);
			});
		
		$window.test();
		
		$scope.saveCategory = ()=>{
			console.log($scope.categoryName);
				$http({
				method: 'PUT',
				url: '/admin/api/subcategory?name='+$scope.subcategoryName+'&categoryid='+$scope.categoryId+'&subcategoryid='+$scope.subcategoryId
				})
				.then(function(responses){
						console.log(responses);
						$scope.subcategoryList = responses.data.data;
						$window.test();
				});
			}
		
		$scope.editCategory = (category)=>{
			console.log(category)
			$scope.subcategoryName = category.subCategoryName;
			$scope.categoryId = category.category.categoryId;
			$scope.subcategoryId = category.subCategoryId;
			
		};
		
	$scope.dataTableOpt = {
	   //custom datatable options 
	  // or load data through ajax call also
	  "aLengthMenu": [[10, 50, 100,-1], [10, 50, 100,'All']],
	  };
		
	}]);
	
	