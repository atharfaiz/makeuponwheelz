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
    
    //These variables MUST be set as a minimum for the calendar to work
    vm.calendarView = 'month';
    vm.viewDate = new Date();
    
    $scope.academics  =  [];
    
    
    vm.timespanClicked = function(date) {
        vm.lastDateClicked = date;
        console.log(date.getTime());
        console.log(date.getDate());
        console.log(date.getMonth());
        console.log(date.getYear());
        $http({
 			method: 'POST',
 			url: '/parent/get/academics/date',
 			params: {
 				time: date.getTime(),
 				date: date.getDate(),
 				month: date.getMonth(),
 				year: date.getYear()
 			}
 			})
 			.then(function(responses){
 					console.log(responses.data);
 					$scope.academics = [];
 					$scope.academics = responses.data;
 			});
      };
      
     
      $http({
			method: 'POST',
			url: '/parent/get/academics/date',
			params: {
				time: new Date().getTime(),
				date: new Date().getDate(),
				month: new Date().getMonth(),
				year: new Date().getYear()
			}
			})
			.then(function(responses){
					console.log(responses.data);
					$scope.academics = [];
					$scope.academics = responses.data;
			});
      
      
    vm.events = [
     
    ];

    vm.cellIsOpen = true;

    vm.addEvent = function() {
      vm.events.push({
        title: 'New event',
        startsAt: moment().startOf('day').toDate(),
        endsAt: moment().endOf('day').toDate(),
        color: calendarConfig.colorTypes.important,
        draggable: true,
        resizable: true
      });
    };

    vm.eventClicked = function(event) {
      alert.show('Clicked', event);
    };

    vm.eventEdited = function(event) {
      alert.show('Edited', event);
    };

    vm.eventDeleted = function(event) {
      alert.show('Deleted', event);
    };

    vm.eventTimesChanged = function(event) {
      alert.show('Dropped or resized', event);
    };

    vm.toggle = function($event, field, event) {
      $event.preventDefault();
      $event.stopPropagation();
      event[field] = !event[field];
    };

    console.log(vm.viewDate)
    
    $scope.colors = {
    	event: {
    		primary:"#8bc34a",
        	secondary:"#eee",
        	count: 0,
        	name:"Absent"
    	}
    	
    }
    
    $scope.dateUpdate = function(){
    	console.log(vm.viewDate)
   	 	console.log(vm.viewDate.getMonth())
    	console.log(vm.viewDate.getYear())
    	  $http({
 			method: 'POST',
 			url: '/parent/get/academics/month',
 			params: {
 				month: vm.viewDate.getMonth(),
 				year: vm.viewDate.getYear()
 			}
 			})
 			.then(function(responses){
 					console.log(responses.data);
 					vm.events = [];
 						for(var i=0; i<responses.data.length; i++){
 							el = responses.data[i];
 							console.log(el);
 								vm.events.push({
 							         title: el.subject,
 							            color: $scope.colors.event,
 							            startsAt:new Date(el.time)
 							        });
 							
 						}
 			});
 		
    }
    
    
    
  });
