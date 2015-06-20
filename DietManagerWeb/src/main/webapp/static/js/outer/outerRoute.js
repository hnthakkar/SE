var outerApp = angular.module("outerApp",[]).
    config(function($routeProvider) {
    	$routeProvider.when('/status',
    		    {
    		      templateUrl:    'status',
    		    controller:     'statusCtrl'
    		    });
    		    $routeProvider.otherwise(
    		    {
      		    templateUrl:    'status',
    		    controller:     'statusCtrl'
    		    });
    });