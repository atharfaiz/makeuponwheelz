/**
 * 
 */

	mainApp.controller("welcomeCtrl", ["$scope", "$http","$window", function($scope, $http, $window) {
        
        $scope.storePhone = '';
        $scope.storeEmail = '';
        $scope.storeAddress = '';
       
        $scope.todayStatus = '';
        $scope.openTime = '';
        $scope.closeTime = '';
        $scope.packageList = [];
        $scope.packageProductList = [];
        $scope.selctedPackae = {};
        $scope.addPackageDisable = false;
        $scope.testimonials = [];
        /*$scope.bannerImage1 = '';
        $scope.bannerImage2= '';
        $scope.bannerImage3 = '';*/
        
        /*$http({
			method: 'POST',
			url: '/get/banner/images'
		})
		.then(function(responses){
			console.log(responses.data);
			$scope.bannerImage1 = responses.data.homeBanner1;
	        $scope.bannerImage2= responses.data.homeBanner2;
	        $scope.bannerImage3 = responses.data.homeBanner3;
	     
		});*/
        
		$http({
			method: 'POST',
			url: '/get/contact/info'
		})
		.then(function(responses){
			//console.log(responses.data);
			$scope.storePhone = '';
	        $scope.storeEmail = '';
	        $scope.storeAddress = '';
	        $scope.storePhone = responses.data.phone;
	        $scope.storeEmail = responses.data.storeMail;
	        $scope.storeAddress = responses.data.storeAddress;
	     
		});
		
		$http({
			method: 'POST',
			url: '/get/today/working/hour'
		})
		.then(function(responses){
			//console.log(responses.data);
			$scope.todayStatus = '';
	        $scope.openTime = '';
	        $scope.closeTime = '';
	        $scope.todayStatus = responses.data.today;
	        $scope.openTime = responses.data.opoenTime;
	        $scope.closeTime = responses.data.closeTime;
	     
		});
		$http({
			method: 'POST',
			url: '/get/testimonial'
		})
		.then(function(responses){
			console.log('testimonials========',responses.data);
			$scope.testimonials = [];
	        $scope.testimonials = responses.data.data;
	     
		});
		
		$http({
			method: 'POST',
			url: '/get/active/featured/packages'
		})
		.then(function(responses){
			console.log(responses.data);
			$scope.packageList = [];
			$scope.packageList = responses.data;
			$scope.packageProductList = $scope.packageList[0].packageProduct;
			$scope.selctedPackae = $scope.packageList[0];
			if(localStorage.userProductData == undefined){
	        	localStorage.userProductData = [];
	        }
	        if(localStorage.userPackageData == undefined){
	        	localStorage.userPackageData = [];
	        }
	        
		});
		
		$scope.getPackageAssign = function(selectedpackage){
			 angular.forEach($scope.packageList, function(obj, index) {
	       		 obj.catActive = false;
	            });     

			 selectedpackage.catActive = true;
			console.log(selectedpackage);
			$scope.selctedPackae = selectedpackage;
			$scope.packageProductList = selectedpackage.packageProduct;
		}
		
		$scope.addToCart = function(addpackage){
			console.log(addpackage);
			$scope.userProduct = [];
        	$scope.userPackage = [];
        	var tempUserPackage = [];
        	$scope.addPackageDisable = true;
        	if(localStorage.userPackageData == undefined || localStorage.userPackageData.length==0){
  				localStorage.userPackageData =  $scope.userPackage;
  			}else{
  				$scope.userPackage = JSON.parse(localStorage.userPackageData);
  				tempUserPackage = JSON.parse(localStorage.userPackageData);
  			}
        	localStorage.userProductData = [];
        	if($scope.userPackage.length == 0){
        		addpackage.qty++;
  				$scope.userPackage.push({'packageId' : addpackage.id, 'total': (addpackage.qty*addpackage.sellPrc),
					  'qty': addpackage.qty, 'sellPrc': addpackage.sellPrc, 'name': addpackage.name, 'gst':addpackage.gst}) ;
  				localStorage.userPackageData =  JSON.stringify($scope.userPackage);
  				//return;
  			}else{
  				var flag = 0;
  				angular.forEach(tempUserPackage, function(obj1,index){
  					if(obj1.packageId == addpackage.id){
  						flag = 1;
  						obj1.qty++;
  						addpackage.qty = obj1.qty;
  						$scope.userPackage.splice(index, 1);
  						$scope.userPackage.push({'packageId' : obj1.packageId, 'total': (obj1.qty*obj1.sellPrc),
						  'qty': obj1.qty, 'sellPrc': obj1.sellPrc, 'name': obj1.name, 'gst':obj1.gst}) ;
  						localStorage.userPackageData =  JSON.stringify($scope.userPackage);
  						if(flag==1){
  							window.location= '/appointment';
  							return;
  						}
  							
  					}
  					
  				})
  				if(flag == 0){
  					addpackage.qty++;
  					$scope.userPackage.push({'packageId' : addpackage.id, 'total': (addpackage.qty*addpackage.sellPrc),
					  'qty': addpackage.qty, 'sellPrc': addpackage.sellPrc, 'name': addpackage.name, 'gst':addpackage.gst}) ;
    				localStorage.userPackageData =  JSON.stringify($scope.userPackage);
    				
  				}
  			}
  		  
	      	 window.location.pathname = '/appointment';
		}
		
	}]);