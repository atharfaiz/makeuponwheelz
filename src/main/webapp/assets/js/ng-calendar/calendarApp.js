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
    vm.events = [
      /*{
        title: 'An event',
        color: calendarConfig.colorTypes.warning,
        startsAt: moment().startOf('week').subtract(2, 'days').add(8, 'hours').toDate(),
        endsAt: moment().startOf('week').add(1, 'week').add(9, 'hours').toDate(),
        draggable: true,
        resizable: true,
        actions: actions
      }, {
        title: '<i class="glyphicon glyphicon-asterisk"></i> <span class="text-primary">Another event</span>, with a <i>html</i> title',
        color: calendarConfig.colorTypes.info,
        startsAt: moment().subtract(1, 'day').toDate(),
        endsAt: moment().add(5, 'days').toDate(),
        draggable: true,
        resizable: true,
        actions: actions
      }, {
        title: 'This is a really long event title that occurs on every year',
        color: calendarConfig.colorTypes.important,
        startsAt: moment().startOf('day').add(7, 'hours').toDate(),
        endsAt: moment().startOf('day').add(19, 'hours').toDate(),
        recursOn: 'year',
        draggable: true,
        resizable: true,
        actions: actions
      }*/
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
    	absent: {
    		primary:"#e41f1f",
        	secondary:"#eee",
        	count: 0,
        	name:"Absent"
    	},
    	sunday: {
    		primary:"#4184f3",
        	secondary:"#eee",
        	count: 0,
        	name:"Sunday"
    	},
    	present: {
    		primary:"#8ac349",
        	secondary:"#eee",
        	count: 0,
        	name:"Present"
    	},
    	leave: {
    		primary:"#fad945",
        	secondary:"#eee",
        	count: 0,
        	name:"Leave"
    	},
    	holiday: {
    		primary:"#009688",
        	secondary:"#eee",
        	count: 0,
        	name:"Holiday"
    	}
    	
    }
    
    $scope.dateUpdate = function(){
    	console.log(vm.viewDate)
   	 	console.log(vm.viewDate.getMonth())
    	console.log(vm.viewDate.getYear())
    	  $http({
 			method: 'POST',
 			url: '/parent/get/attendance/month',
 			params: {
 				month: vm.viewDate.getMonth(),
 				year: vm.viewDate.getYear()
 			}
 			})
 			.then(function(responses){
 					console.log(responses.data);
 					console.log($scope.colors);
 					vm.events = [];
 					$scope.colors.absent.count=0;
 					$scope.colors.present.count=0;
 					$scope.colors.sunday.count=0;
 					$scope.colors.leave.count=0;
 					$scope.colors.holiday.count=0;
 					
						
//				     if(responses.data){
 					
 						for(var i=0; i<responses.data.length; i++){
 							el = responses.data[i];
 							//console.log(calendarConfig.colorTypes);
 							if(el.value == 'A'){
 								$scope.colors.absent.count++;
 								console.log("A");
 								vm.events.push({
 							         title: 'Absent',
 							            color: $scope.colors.absent,
 							            startsAt:new Date(el.time)
 							        });
 							}
 							else if(el.value == 'P'){
 								console.log("P");
 								$scope.colors.present.count++;
 								vm.events.push({
 							         title: 'Present',
 							            color: $scope.colors.present,
 							            startsAt:new Date(el.time)
 							        });
 							}
 							else if(el.value == 'S'){
 								console.log("S");
 								$scope.colors.sunday.count++;
 								vm.events.push({
 							         title: 'Sunday',
 							            color: $scope.colors.sunday,
 							            startsAt:new Date(el.time)
 							        });
 							}
 							else if(el.value == 'L'){
 								console.log("L");
 								$scope.colors.leave.count++;
 								vm.events.push({
 							         title: 'Leave',
 							            color: $scope.colors.leave,
 							            startsAt:new Date(el.time)
 							        });
 							}
 							else if(el.value == 'H'){
 								console.log("H");
 								$scope.colors.holiday.count++;
 								vm.events.push({
 							         title: 'Holiday',
 							            color: $scope.colors.holiday,
 							            startsAt:new Date(el.time)
 							        });
 							}
 							
 						}
// 					}
 			});
 		
    }
  });
