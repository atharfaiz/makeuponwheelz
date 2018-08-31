angular.module('mwl.calendar.docs', ['mwl.calendar', 'ngAnimate', 'ui.bootstrap', 'colorpicker.module']);
angular
  .module('mwl.calendar.docs') //you will need to declare your module with the dependencies ['mwl.calendar', 'ui.bootstrap', 'ngAnimate']
  .factory('alert', function($uibModal) {

    function show(action, event) {
      return $uibModal.open({
        templateUrl: '',
        controller: function() {
          var vm = this;
          vm.action = action;
          vm.event = event;
        },
        controllerAs: 'vm'
      });
    }

    return {
      show: show
    };

  }).controller('KitchenSinkCtrl', function(moment, alert, calendarConfig, $scope, $http) {

    var vm = this;
    $scope.academicLabelList = [];
    $scope.month = "3";
    $scope.label = "all";
    
    //These variables MUST be set as a minimum for the calendar to work
    vm.calendarView = 'month';
    vm.viewDate = new Date();
    var actions = [{
      label: '<i class=\'glyphicon glyphicon-pencil\'></i>',
      onClick: function(args) {
        alert.show('Edited', args.calendarEvent);
      }
    }, {
      label: '<i class=\'glyphicon glyphicon-remove\'></i>',
      onClick: function(args) {
        alert.show('Deleted', args.calendarEvent);
      }
    }];
    vm.events = [];
    

    vm.cellIsOpen = true;

    console.log(vm.viewDate)
    
    $http({
 			method: 'POST',
 			url: '/parent/get/examList'
 			})
 			.then(function(responses){
 					console.log(responses.data);
 				$scope.academicLabelList = responses.data;
 			});
    
    $scope.getExam = function(){
    	$http({
 			method: 'POST',
 			url: '/parent/get/examList/month',
 			params: {
 				month: $scope.month,
 				examinationName: $scope.label
 			}
 			})
 			.then(function(responses){
 					console.log(responses.data);
 				$scope.examList = responses.data.pushList;
 				if(responses.data.pushList.length<=0){
 					$scope.emptyMsg =  true;
 				}
 				else{
 					$scope.emptyMsg = false;
 				}
 			});
    
    }
    
    $scope.getExam();
    
    $scope.dateUpdate = function(){
    	vm.cellIsOpen = true;
    	console.log(vm.viewDate)
   	 	console.log(vm.viewDate.getMonth())
    	console.log(vm.viewDate.getYear())
    	  $http({
 			method: 'POST',
 			url: '/parent/get/examination/month',
 			params: {
 				month: vm.viewDate.getMonth(),
 				year: vm.viewDate.getYear()
 			}
 			})
 			.then(function(responses){
 					console.log(responses.data);
 					vm.events = [];
//				     if(responses.data){
 					
 						for(var i=0; i<responses.data.length; i++){
 							el = responses.data[i];
 							console.log(el);
 							vm.events.push({
 								title: el.subject+": "+el.examTime+" : "+el.examinationName,
 								name: el.subject,
						            startsAt:new Date(el.time)
						        });
 							
 						}
// 					}
 			});
 		
    }
  });
