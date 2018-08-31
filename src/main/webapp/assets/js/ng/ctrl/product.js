/**
 * 
 */

	
	mainApp=angular.module('mainApp',  ['datatables']);
	
	mainApp.controller("product", ["$scope", "$http","$window", function($scope, $http, $window) {
		
		$scope.categoryList = [];
		$scope.subcategoryList = [];
		$scope.productList = [];
		$scope.showTable = true;
		$scope.productName = "";
		$scope.subcategoryId = "";
		$scope.categoryId = "";
		$scope.productId = "";
		
		
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
		$http({
			method: 'GET',
			url: '/admin/api/product'
			})
			.then(function(responses){
					console.log(responses);
					$scope.productList = responses.data.data;
					console.log($scope.productList);
			});
		
		$window.test();
		
		$scope.saveCategory = ()=>{
			console.log($scope.categoryName);
				$http({
				method: 'PUT',
				url: '/admin/api/product?name='+$scope.productName+'&categoryid='+$scope.categoryId+'&subcategoryid='+$scope.subcategoryId+'&productid='+$scope.productId
				})
				.then(function(responses){
						console.log(responses);
						$scope.productList = responses.data.data;
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
	
	