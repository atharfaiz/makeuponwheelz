/**
 * 
 */

	mainApp.controller("bookingCtrl", ["$scope", "$http","$window","$timeout", function($scope, $http, $window, $timeout) {
        
        $scope.categoryProduct = [];
        $scope.categoryPackage = [];
        $scope.categoryPackageReplica = [];
        $scope.categoryProductReplica = [];
        $scope.selectedDate = "";
        $scope.selectedTime = '';
        $scope.currenttime = 0;
        $scope.sameDate = false;
        $scope.prevDate = false;
        $scope.previousDate = '';
        $scope.timeSlot = [];
        $scope.dateused = '';
        $scope.userProduct = [];
        $scope.userPackage = [];
        $scope.userPackageReplica = [];
        $scope.userProductReplica = [];
        
        $scope.userName = '';
        $scope.userMail = '';
        $scope.userPhone = '';
        $scope.userPhoneAlter = '';
        $scope.userAddress = '';
        $scope.orderProcess = false;
        $scope.personMessage = '';
        $scope.disableTime = false;
        
        $scope.serviceTakenBy = 'Man';
        $scope.familyMember = '1';
        $scope.errmsg = '';
        $scope.authen = '';
        $scope.userOtp = 'otp';
        $scope.otpRec = false;
        $scope.verifyRegister = false;
        $scope.userPassword = 'pwd';
        $scope.buttonValue = 'BOOK NOW';
        
        $scope.subTotal = 0.0;
        $scope.totalTax = 0.0;
        $scope.totalAmount = 0.0;
        
        $scope.totalOrderAmount = 0.0;
        
        $scope.showOrderBooked = false;
        $scope.orderSubmitted = false;
        $scope.orderSubmitted1 = false;
        
        $scope.otpVerClick = false;
        
        $http({
			method: 'POST',
			url: '/get/user/authentication/data'
		})
		.then(function(responses){
			//console.log(responses.data)
			$scope.userName = responses.data.userName;
	        $scope.userMail = responses.data.userMail;
	        $scope.userPhone = responses.data.userPhone;
	        $scope.userAddress = responses.data.userAddress;
	        $scope.authen = responses.data.authen;
	        
	        console.log('==='+$scope.authen);
	        
		});
        
        $http({
			method: 'POST',
			url: '/category/data'
		})
		.then(function(responses){
			console.log(responses.data)
			$scope.categoryProduct = [];
	        $scope.categoryPackage = [];
	        $scope.categoryProduct = responses.data.catProdcut;
	        $scope.categoryPackage = responses.data.catPackage;
	        $scope.categoryPackageReplica = responses.data.catPackage[0];
	        $scope.categoryProductReplica = responses.data.catProdcut[0];
	        
	        if(localStorage.userProductData == undefined){
	        	localStorage.userProductData = [];
	        }
	        if(localStorage.userPackageData == undefined){
	        	localStorage.userPackageData = [];
	        }
	        localStorage.userProductDataReplica = [];
	        localStorage.userPackageDataReplica = [];
	        
	        
	        $scope.getAddeddProductOrPackage();
	        
		});
        
        $scope.serviceTaken = function(selectedOne){
        	$scope.serviceTakenBy = selectedOne;
        }
        
        $scope.showOrderProduct = function(){
        	$scope.userPackageReplica = [];
            $scope.userProductReplica = [];
            console.log(localStorage.userProductDataReplica);
            console.log(localStorage.userPackageDataReplica);
        	if(localStorage.userProductDataReplica.length != 0){
        		//tempUserProduct = JSON.parse(localStorage.userProductData);
        		$scope.userProductReplica = JSON.parse(localStorage.userProductDataReplica);
        		 console.log($scope.userProductReplica);
	        }
        	if(localStorage.userPackageDataReplica.length != 0){
        		//tempUserPackage = JSON.parse(localStorage.userPackageData);
        		$scope.userPackageReplica = JSON.parse(localStorage.userPackageDataReplica);
        		console.log($scope.userPackageReplica);
	        }
        	 console.log($scope.userPackageReplica);
             console.log($scope.userProductReplica);
        }
        
        $scope.getAddeddProductOrPackage = function(){
        	console.log('=====in ');
        	var tempUserProduct = [];
        	if(localStorage.userProductData.length != 0){
        		tempUserProduct = JSON.parse(localStorage.userProductData);
        		$scope.userProduct = JSON.parse(localStorage.userProductData);
            	
	        }
        	console.log(localStorage.userProductData);
    		console.log(tempUserProduct);
        	angular.forEach($scope.categoryProduct, function(obj, index) {
    			//console.log('==================log1');
    			angular.forEach(obj.catProductList, function(obj1, index1) {
    				//console.log('==================log2');
    				angular.forEach(tempUserProduct, function(obj2, index2) {
    					//console.log('================log3');
    					if(obj2.productId == obj1.productId){
    						//console.log('=================log4');
    						obj1.qty = obj2.qty
    					}
    				})
    			})
            })  
    		
        	var tempUserPackage = [];
        	if(localStorage.userPackageData.length != 0){
        		tempUserPackage = JSON.parse(localStorage.userPackageData);
        		$scope.userPackage = JSON.parse(localStorage.userPackageData);
	        }
        	console.log(localStorage.userPackageData);
    		console.log(tempUserPackage);
    		angular.forEach($scope.categoryPackage, function(obj, index) {
    			//console.log('=================log1');
    			angular.forEach(obj.catPackageList, function(obj1, index1) {
    				//console.log('=================log2');
    				angular.forEach(tempUserPackage, function(obj2, index2) {
    					//console.log('=================log3');
    					if(obj2.packageId == obj1.id){
    						obj1.qty = obj2.qty;
    					}
    				})
    			})
            }) 
            $scope.calculateTotalAmount();
  			
        }
        
        $scope.calculateTotalAmount = function(){
        	$scope.subTotal = 0.0;
            $scope.totalTax = 0.0;
            $scope.totalAmount = 0.0;
            if($scope.userProduct.length>0){
            	angular.forEach($scope.userProduct, function(obj, index) {
    				//console.log('================log3');
            		$scope.subTotal += obj.total;
            		$scope.totalTax += obj.qty*obj.productSellPrc*obj.gst/100;
            		
    			})
            }
            if($scope.userPackage.length>0){
            	angular.forEach($scope.userPackage, function(obj, index) {
    				//console.log('================log3');
            		$scope.subTotal += obj.total;
            		$scope.totalTax += obj.qty*obj.sellPrc*obj.gst/100;
    			})
            }
            $scope.totalAmount = $scope.subTotal +$scope.totalTax;
            
        }
        
        $scope.getpackageAssign = function(catPro){
        	 angular.forEach($scope.categoryPackage, function(obj, index) {
        		 obj.catActive = false;
             });     

        	catPro.catActive = true;
        	$scope.categoryPackageReplica = catPro;
        }
        
        $scope.getProductAssign = function(catPro){
       	 angular.forEach($scope.categoryProduct, function(obj, index) {
       		 obj.catActive = false;
            });     

       	catPro.catActive = true;
       	$scope.categoryProductReplica = catPro;
       }
        
        $scope.addPackageToCart = function(addpackage){
        	//console.log(addpackage);
        	$scope.userProduct = [];
        	$scope.userPackage = [];
        	var tempUserPackage = [];
        	if(localStorage.userPackageData == undefined || localStorage.userPackageData.length==0){
  				localStorage.userPackageData =  $scope.userPackage;
  			}else{
  				$scope.userPackage = JSON.parse(localStorage.userPackageData);
  				//console.log($scope.userProduct);
  				tempUserPackage = JSON.parse(localStorage.userPackageData);
  			}
        	localStorage.userProductData = [];
        	angular.forEach($scope.categoryProductReplica.catProductList, function(obj, index) {
          		obj.qty = 0;
          		
               }); 
	      	 angular.forEach($scope.categoryPackageReplica.catPackageList, function(obj, index) {
	      		if(obj.id == addpackage.id){
	      			
	      			if($scope.userPackage.length == 0){
	      				obj.qty++;
          				$scope.userPackage.push({'packageId' : obj.id, 'total': (obj.qty*obj.sellPrc),
							  'qty': obj.qty, 'sellPrc': obj.sellPrc, 'name': obj.name, 'gst':obj.gst}) ;
          				localStorage.userPackageData =  JSON.stringify($scope.userPackage);
          				return;
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
          						if(flag==1)
          							return;
          					}
          					
          				})
          				if(flag == 0){
          					obj.qty++;
          					$scope.userPackage.push({'packageId' : obj.id, 'total': (obj.qty*obj.sellPrc),
  							  'qty': obj.qty, 'sellPrc': obj.sellPrc, 'name': obj.name, 'gst':obj.gst}) ;
            				localStorage.userPackageData =  JSON.stringify($scope.userPackage);
            				return;
          				}
          			}
	      		}
	           });     
	      	$scope.calculateTotalAmount();
         }
        
        $scope.removePackage = function(packageObj){
        	//console.log(packageObj);
        	var tempUserPackage = [];
        	tempUserPackage = JSON.parse(localStorage.userPackageData);
        	$scope.userPackage = JSON.parse(localStorage.userPackageData);
        	angular.forEach($scope.categoryPackageReplica.catPackageList, function(obj, index) {
          		if(obj.id == packageObj.packageId){
          			obj.qty = 0;
          			packageObj.qty = 0;
          			//console.log('remove');
          			angular.forEach(tempUserPackage, function(obj1,index){
      					if(obj1.packageId == packageObj.packageId){
      						flag = 1;
      						$scope.userPackage.splice(index, 1);
      						
      						localStorage.userPackageData =  JSON.stringify($scope.userPackage);
      						
      						
      					}
      					
      				})
          		}
               }); 
        	$scope.calculateTotalAmount();
        }
        
        $scope.removeFromCart = function(removepackage){
        	var tempUserPackage = [];
        	tempUserPackage = JSON.parse(localStorage.userPackageData);
        	$scope.userPackage = JSON.parse(localStorage.userPackageData);
        	angular.forEach($scope.categoryPackageReplica.catPackageList, function(obj, index) {
          		if(obj.id == removepackage.id){
          			obj.qty--;
          			//console.log('remove');
          			angular.forEach(tempUserPackage, function(obj1,index){
      					if(obj1.packageId == removepackage.id){
      						flag = 1;
      						obj1.qty--;
      						if(obj1.qty>0){
      							$scope.userPackage.splice(index, 1);
          						$scope.userPackage.push({'packageId' : obj1.packageId, 'total': (obj1.qty*obj1.sellPrc),
      							  'qty': obj1.qty, 'sellPrc': obj1.sellPrc, 'name': obj1.name, 'gst':obj1.gst}) ;
          						localStorage.userPackageData =  JSON.stringify($scope.userPackage);
      						}else{
      							$scope.userPackage.splice(index, 1);
          						
          						localStorage.userPackageData =  JSON.stringify($scope.userPackage);
      						}
      						
      						return;
      						
      					}
      					
      				})
          		}
               }); 
        	$scope.calculateTotalAmount();
        }
        
        
        $scope.addProductToCart = function(addproduct){
        	$scope.userPackage = [];
        	console.log('===in add product');
        	$scope.userProduct = [];
        	var tempUserProduct = [];
        	var i = 1;
        	if(localStorage.userProductData == undefined || localStorage.userProductData.length==0 ){
  				localStorage.userProductData =  $scope.userProduct;
  			}else{
  				$scope.userProduct = JSON.parse(localStorage.userProductData);
  				tempUserProduct = JSON.parse(localStorage.userProductData);
  				//console.log($scope.userProduct);
  			}
        	localStorage.userPackageData = [];
        	
        	angular.forEach($scope.categoryPackageReplica.catPackageList, function(obj, index) {
          		obj.qty = 0;
          		
               });
          	 angular.forEach($scope.categoryProductReplica.catProductList, function(obj) {
          		if(obj.productId == addproduct.productId){
          			console.log('1st'+i);
          			if($scope.userProduct.length == 0){
          				obj.qty++;
          				$scope.userProduct.push({'productId' : obj.productId,'total': (obj.qty*obj.productSellPrc),
							  'qty': obj.qty, 'productSellPrc': obj.productSellPrc, 'productName': obj.productName, 'gst':obj.gst}) ;
          				localStorage.userProductData =  JSON.stringify($scope.userProduct);
          				
          				return;
          				console.log('pout');
          			}else{
          				var flag = 0;
          				console.log('else'+i);
          				//console.log(tempUserProduct);
          				angular.forEach(tempUserProduct, function(obj1,index){
          					//console.log(obj1);
          					if(obj1.productId == addproduct.productId){
          						//console.log(obj1.productId===addproduct.productId);
          						//console.log(addproduct.productId+"==================="+obj1.productId +' =======2nd === '+(i++) );
          						flag = 1;
          						obj1.qty++;
          						obj.qty = obj1.qty;
          						$scope.userProduct.splice(index, 1);
          						$scope.userProduct.push({'productId' : obj1.productId, 'total': (obj1.qty*obj1.productSellPrc),
			  						'qty': obj1.qty, 'productSellPrc': obj1.productSellPrc, 'productName': obj1.productName, 'gst':obj1.gst}) ;
          						localStorage.userProductData =  JSON.stringify($scope.userProduct);
          						//console.log($scope.userProduct);
          						if(flag==1)
          							return;
          						console.log('pout');
          					}
          					
          				})
          				if(flag == 0){
          					obj.qty++;
          					$scope.userProduct.push({'productId' : addproduct.productId, 'total': (addproduct.qty*addproduct.productSellPrc),
		  						'qty': addproduct.qty,'productSellPrc': addproduct.productSellPrc, 'productName': addproduct.productName, 'gst':addproduct.gst}) ;
          					
          					localStorage.userProductData =  JSON.stringify($scope.userProduct);
          					//console.log($scope.userProduct);
          					return;
          					//console.log('pout');
          				}
          			}
          			//console.log('add package');
          		}
               });     
          	$scope.calculateTotalAmount();
         }
        
        $scope.removeProduct = function(removepro){
        	console.log(removepro);
        	$scope.userProduct = JSON.parse(localStorage.userProductData);
        	var tempUserProduct = [];
        	tempUserProduct = JSON.parse(localStorage.userProductData);
        	 angular.forEach($scope.categoryProductReplica.catProductList, function(obj) {
           		if(obj.productId == removepro.productId){
           			removepro.qty = 0;
           			obj.qty = 0;
           			angular.forEach(tempUserProduct, function(obj1,index){
        				if(obj1.productId == removepro.productId){
        					obj1.qty = 0;
        					
        					
        						$scope.userProduct.splice(index, 1);
        						localStorage.userProductData =  JSON.stringify($scope.userProduct);
        					
        				}
        					
        			})
           		}
        	 })
        	
			$scope.calculateTotalAmount();	 
        }
        
        $scope.removeProductFromCart = function(removeproduct){
        	
        	$scope.userProduct = JSON.parse(localStorage.userProductData);
        	var tempUserProduct = [];
        	tempUserProduct = JSON.parse(localStorage.userProductData);
        	angular.forEach(tempUserProduct, function(obj1,index){
				if(obj1.productId == removeproduct.productId){
					obj1.qty--;
					removeproduct.qty = obj1.qty;
					if(obj1.qty > 0){
						$scope.userProduct.splice(index, 1);
						$scope.userProduct.push({'productId' : obj1.productId, 'total': (obj1.qty*obj1.productSellPrc),
	  						'qty': obj1.qty, 'productSellPrc': obj1.productSellPrc,'productName': obj1.productName, 'gst':obj1.gst}) ;
						localStorage.userProductData =  JSON.stringify($scope.userProduct);
						
					}else{
						$scope.userProduct.splice(index, 1);
						localStorage.userProductData =  JSON.stringify($scope.userProduct);
					}
					return;
				}
					
			})
			$scope.calculateTotalAmount();	 
        }
        
       
        $scope.timeSelect = function(){
        	//console.log('==in timeselect==='+document.getElementById("date").value);
        	var sdate = document.getElementById("date").value;
        	var sdateArr = sdate.split("/");
        	console.log('==========into time select===log4'+sdateArr);
        	
        	$scope.selectedDate = sdateArr[0]+'-'+sdateArr[1]+'-'+sdateArr[2];
        	//console.log('==in timeselect==='+$scope.selectedDate);
        	
    		$http({
				method: 'POST',
				url: '/get/user/available/time/slot',
				params: {
					selectedDate : $scope.selectedDate
				}
			})
			.then(function(responses){
				//$scope.disableTime = true;
				//console.log(responses.data);
				$scope.timeSlot = [];
				$scope.timeSlot = responses.data;
				//$scope.timeSelect();
			});
    		var currentDate = new Date();
    		
    		$scope.sameDate = false;
    		if(currentDate.getDate()==parseInt(sdateArr[0])){
    			$scope.sameDate = true;
    		}
        	$scope.currenttime = new Date().getHours()+1;
        	//console.log($scope.currenttime+" === "+$scope.sameDate);
        }
        
        
        $scope.submitOrder = function(){
        	$scope.showOrderBooked = false;
        	$scope.orderSubmitted = false;
        	console.log('=================process order');
        	  debugger;
	    	 
	    	 $scope.errmsg = '';
	    	 $('#mail_success').hide();
	    	 $('#mail_fail').hide();
	    	 if ($scope.form_booking.$invalid) {
	    		 $scope.orderSubmitted = true;
	    	 }else{
	    		 $scope.orderProcess = true;
	    		 if($scope.authen == 'authen'){
	        	 	 $scope.verifyRegister = false;
	        	 }
	    		 if(localStorage.userPackageData.length == 0 && localStorage.userProductData.length == 0){
		    		 $scope.orderProcess = false;
		    		 $scope.errmsg = 'Please Add Atleast One Product Or Package';
		    		 $('#mail_fail').show();
			     }else{
			    	 if($scope.authen == 'authen'){
			    		 $http({
					 			method: 'POST',
					 			url: '/user/order/finish',
					 			params : {
					 				userName : $scope.userName,
					 				userMail : $scope.userMail,
					 				userPhone : $scope.userPhone,
					 				userPhoneAlter : $scope.userPhoneAlter,
					 				userAddress : $scope.userAddress,
					 				serviceTakenBy : $scope.serviceTakenBy,
					 				familyMember : $scope.familyMember,
					 				selectedDate : $scope.selectedDate,
					 				selectedTime : $scope.selectedTime,
					 				selectedProduct : localStorage.userProductData,
					 				selectedPackage : localStorage.userPackageData,
					 				personMessage : $scope.personMessage
					 			}
				     		})
				     		.then(function(responses){
				     			console.log(responses.data)
				     			$scope.orderProcess = false;
				     			if(responses.data.status == "success"){
				     				if(localStorage.userProductDataReplica == undefined){
				     		        	localStorage.userProductDataReplica = [];
				     		        }
				     		        if(localStorage.userPackageDataReplica == undefined){
				     		        	localStorage.userPackageDataReplica = [];
				     		        }
				     		        localStorage.userProductDataReplica = localStorage.userProductData;
				     		        localStorage.userPackageDataReplica = localStorage.userPackageData;
				     				localStorage.userPackageData = [];
				     				localStorage.userProductData = [];
				     				$scope.showOrderProduct();
				     				 $scope.totalOrderAmount = responses.data.totalAmount;
				     				 $('#mail_success').show();
				     				$scope.getAddeddProductOrPackage();
				     				$scope.showOrderBooked = true;
				     			}else{
				     				$scope.errmsg = 'Something went wrong!!!';
				   	    		 $('#mail_fail').show();
				     			}
				     	        
				     		});
			    	 }else{
			    		 $scope.orderProcess = true;
//			    		 $scope.errmsg = 'Please Login or Register First...';
			    		 console.log('else registe');
			    		 
			    		 if($scope.verifyRegister){
			    			 
			    			 if($scope.otpRec && $scope.otpVerClick){
			    				 $http({
			    						method: 'POST',
			    						url: '/user/otp/verify',
			    						params: {
			    							mail: $scope.userMail,
			    							otp: $scope.userOtp
			    						}
			    					})
			    					.then(function(responses){
			    						console.log(responses.data);
			    						if(responses.data.status == 'success'){
			    							$http({
		    									method: 'POST',
		    									url: '/loginVerify',
		    									params: {
		    										username: $scope.userMail,
		    										password: $scope.userPassword
		    									}
		    								})
		    								.then(function(responses){
		    									console.log(responses.data);
		    									$scope.orderProcess = false;
		    									if(responses.data.message == 'success'){
		    										//window.location.pathname = window.location.pathname;
		    										$scope.authen = 'authen';
		    										$scope.buttonValue = 'BOOK NOW';
		    										$scope.orderProcess = false;
			    			    					$scope.verifyRegister = false;
			    			    					$('#myModal3').modal('toggle');
			    			    					$scope.submitOrder();
		    									}else{
		    										$scope.errmsg = 'Problem with verification...';
		    										$('#mail_fail').show();
		    										$scope.buttonValue = 'VERIFY OTP';
		    										$scope.orderProcess = false;
			    			    					//$scope.verifyRegister = false;
		    									}
		    								});
			    							
			    						}else{
			    							$scope.orderProcess = false;
			    							$scope.errmsg = 'Wrong Otp...';
			    							$('#mail_fail').show();
			    							$scope.buttonValue = 'VERIFY OTP';
			    							$scope.orderProcess = false;
	    			    					//$scope.verifyRegister = false;
			    						}
			    					});
			    			 }
			    			 
			    			 else{
			    				 if($scope.otpVerClick){
			    				 $http({
										method: 'POST',
										url: '/loginVerify',
										params: {
											username: $scope.userMail,
											password: $scope.userPassword
										}
									})
									.then(function(responses){
										console.log(responses.data);
										$scope.buttonValue = 'BOOK NOW';
										$scope.orderProcess = false;
										if(responses.data.message == 'success'){
											//window.location.pathname = window.location.pathname;
											$scope.authen = 'authen';
											$scope.buttonValue = 'BOOK NOW';
											$scope.orderProcess = false;
					    					$scope.verifyRegister = false;
					    					$('#myModal3').modal('toggle');
										}else{
											$scope.errmsg = 'Problem with login verification...';
											$('#mail_fail').show();
											$scope.buttonValue = 'LOGIN';
										}
									});
			    			 }
			    			 }
			    			 
			    			 if($scope.otpRec && !$scope.otpVerClick){
			    				 $http({
				    					method: 'POST',
				    					url: '/user/registration/booking',
				    					params: {
				    						name: $scope.userName,
				    						mail: $scope.userMail,
				    						phone: $scope.userPhone,
				    						address: $scope.userAddress
				    						
				    					}
				    				})
				    				.then(function(responses){
				    					$scope.orderProcess = false;
				    					$scope.verifyRegister = true;
				    					console.log(responses.data);
				    					if(responses.data.status == 'success'){
				    						$scope.userOtp = '';
				    						$scope.buttonValue = 'VERIFY OTP';
				    				        $scope.otpRec = true;
				    				        //$scope.userOtp = responses.data.otp;
				    				        $scope.errmsg = '';
				    						$scope.userPassword = responses.data.pwd
				    						$('#myModal3').modal('toggle');
				    					}else if(responses.data.status == 'already'){
				    						$scope.userPassword = '';
				    						$scope.errmsg = '';
				    						$scope.otpRec = false;
				    						$scope.buttonValue = 'LOGIN';
				    						$('#myModal3').modal('toggle');
				    					}else{
				    						$scope.errmsg = 'Problem with registration ...';
				    						$('#mail_fail').show();
				    					}
				    				});
//			    				 $('#myModal3').modal('toggle');
			    			 }
			    		 }else{
			    			 console.log($scope.userName+'===='+ $scope.userMail+"====="+$scope.userAddress);
			    			 $http({
			    					method: 'POST',
			    					url: '/user/registration/booking',
			    					params: {
			    						name: $scope.userName,
			    						mail: $scope.userMail,
			    						phone: $scope.userPhone,
			    						address: $scope.userAddress
			    						
			    					}
			    				})
			    				.then(function(responses){
			    					$scope.orderProcess = false;
			    					$scope.verifyRegister = true;
			    					console.log(responses.data);
			    					if(responses.data.status == 'success'){
			    						$scope.userOtp = '';
			    						$scope.buttonValue = 'VERIFY OTP';
			    				        $scope.otpRec = true;
			    				        //$scope.userOtp = responses.data.otp;
			    				        $scope.errmsg = '';
			    						$scope.userPassword = responses.data.pwd
			    						$('#myModal3').modal('toggle');
			    					}else if(responses.data.status == 'already'){
			    						$scope.userPassword = '';
			    						$scope.errmsg = '';
			    						$scope.otpRec = false;
			    						$scope.buttonValue = 'LOGIN';
			    						$('#myModal3').modal('toggle');
			    					}else{
			    						$scope.errmsg = 'Problem with registration ...';
			    						$('#mail_fail').show();
			    					}
			    				});
			    		 }
			    		 //$('#mail_fail').show();
			    	 }
			    	
			     }
	    	 }
	    	 
	    	 
        }
		
	}]);
	
	