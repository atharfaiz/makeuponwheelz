/**
 * 
 */

	mainApp.controller("trackingCtrl", ["$scope", "$http","$window" , function($scope, $http, $window) {
        
		
		/*$http({
			method : 'post',
			url : '/upload/school/examination/csv',
			data : formData,
			headers : { 'Content-Type': undefined }
			})
			.then(function(responses){
				$('#processing1').hide();
				console.log(responses.data.result);
				$('#upload-btn').removeAttr('disabled');
				if(responses.data.result == "success"){
					$('#statusupmsg').show();
					$('#statusupmsg').delay(1000).fadeOut();
					$scope.dataView = false;
		    		$scope.examinationList = [];
		    		$scope.examinationArray = [];
		    		$window.location = '/examination/upload';
				}
				//$scope.succMsg = true;
				//$scope.msg = "Examination Uploaded Successfully."
				
				
			})*/
		$scope.schoolList = [];
		$scope.school = "26";
		$scope.gps = {};
		$scope.gps.studentFullApi = "";
		$scope.gps.teacherFullApi = "";
		$scope.studentApi = "";
		$scope.stdApiPar1St = true;
		$scope.stdApiPar2St = true;
		$scope.stdApiPar3St = true;
		$scope.stdApiPar4St = true;
		
		$scope.tchApiPar1St = true;
		$scope.tchApiPar2St = true;
		$scope.tchApiPar3St = true;
		$scope.tchApiPar4St = true;
		
		$scope.schoolChg = function(){
			$http({
				method : 'post',
				url : '/gps/api/school/info',
				params: {
					school: $scope.school
				}
			})
			.then(function(responses){
				console.log(responses.data);
				$scope.gps = responses.data;
			});
		}
		
		$scope.updateStdApi = function(){
			$http({
				method : 'post',
				url : '/gps/api/student/update',
				params: {
					studentApi: $scope.gps.studentApi,
					school: $scope.school
				}
			})
			.then(function(responses){
				console.log(responses.data);
				$scope.gps.studentFullApi = responses.data.api;
				
			});
		};
		
		$scope.updateTchApi = function(){
			$http({
				method : 'post',
				url : '/gps/api/teacher/update',
				params: {
					teacherApi: $scope.gps.teacherApi,
					school: $scope.school
				}
			})
			.then(function(responses){
				console.log(responses.data);
				$scope.gps.teacherFullApi = responses.data.api;
				
			});
		};
		
		$scope.updateParam = function( b, c, d){
			
			console.log("abc"+b+d);
			$http({
				method : 'post',
				url : '/gps/parent/param/update',
				params: {
					count: b,
					name: c,
					value: d, 
					school: $scope.school
				}
			})
			.then(function(responses){
				$scope.gps.teacherFullApi = responses.data.api;
				if(responses.data.data == "success"){
					if(b == 1){
						$scope.stdApiPar1St = true;
					}
					if(b == 2){
						$scope.stdApiPar2St = true;
					}
					if(b == 3){
						$scope.stdApiPar3St = true;
					}
					if(b == 4){
						$scope.stdApiPar4St = true;
					}
				}
			});
		};
		
		$scope.updateParamTeacher = function( b, c, d){
			
			console.log("abc"+b+d);
			$http({
				method : 'post',
				url : '/gps/teacher/param/update',
				params: {
					count: b,
					name: c,
					value: d, 
					school: $scope.school
				}
			})
			.then(function(responses){
				$scope.gps.teacherFullApi = responses.data.api;
				if(responses.data.data == "success"){
					if(b == 1){
						$scope.tchApiPar1St = true;
					}
					if(b == 2){
						$scope.tchApiPar2St = true;
					}
					if(b == 3){
						$scope.tchApiPar3St = true;
					}
					if(b == 4){
						$scope.tchApiPar4St = true;
					}
				}
			});
		};
		
		$http({
			method: 'POST',
			url: '/admin/get/schoolList'
		})
		.then(function(responses){
				console.log(responses.data);
				$scope.schoolList = responses.data.data;
				$scope.schoolChg();
		});
        
       
     }]);
	
	