outerApp.controller('NavCtrl', ['$scope', '$location', function ($scope, $location) {
	  $scope.navClass = function (page) {
	    var currentRoute = $location.path().substring(1) || 'status';
	    return page === currentRoute ? 'active' : '';
	  };
	  
	  $scope.loadLogin = function () {
	        $location.url('/status');
	    };   
}]);

function isUndefinedOrNull (val){ 
	return angular.isUndefined(val) || val === null || val == "";
}

