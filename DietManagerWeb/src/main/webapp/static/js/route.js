var app = angular.module("innerApp",[]).
    config(function($routeProvider) {
    	$routeProvider.when('/home',
    		    {
    		      templateUrl:    'home',
    		      controller:     'homeCtrl'
    		    });
    		    $routeProvider.when('/reporting',
    		    {
    		      templateUrl:    'reporting',
    		      controller:     'reportCtrl'
    		    });
    		    $routeProvider.when('/sysAdmin',
    		    {
    		      templateUrl:    'sysAdmin',
    		      controller:     'sysAdminCtrl'
    		    });
    		    $routeProvider.otherwise(
    		    {
    		      redirectTo:     '/home',
    		      controller:     'homeCtrl', 
    		    });
    });