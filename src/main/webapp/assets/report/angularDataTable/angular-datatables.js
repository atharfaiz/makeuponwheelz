/*
Following required for execute angular data tables...http://embed.plnkr.co/o17Hwu6y1S795wIBMAt4/

 <script data-require="jquery@1.10.1" data-semver="1.10.1" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script src="//cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" data-require="angular.js@1.2.15" data-semver="1.2.15" src="http://code.angularjs.org/1.2.15/angular.js"></script>

 <script src="https://rawgithub.com/vivendi/angular-datatables/master/src/angular-datatables.js"></script>
	<script src="https://rawgithub.com/vivendi/angular-datatables/master/src/angular-datatables.directive.js"></script>
	<script src="https://rawgithub.com/vivendi/angular-datatables/master/src/angular-datatables.factory.js"></script>
	<script src="https://rawgithub.com/vivendi/angular-datatables/master/src/angular-datatables.bootstrap.js"></script>
*/


(function(angular) {
    'use strict';
    angular.module('datatables', ['datatables.directive', 'datatables.factory', 'datatables.bootstrap']).
    value('DT_LAST_ROW_KEY', 'datatable:lastRow');
})(angular);
