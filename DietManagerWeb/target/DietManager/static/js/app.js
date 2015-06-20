app.controller('NavCtrl', ['$scope', '$location', function ($scope, $location) {
	  $scope.navClass = function (page) {
	    var currentRoute = $location.path().substring(1) || 'home';
	    return page === currentRoute ? 'active' : '';
	  };
	  
	  $scope.loadHome = function () {
	        $location.url('/home');
	    };
	    
	    $scope.loadReporting = function () {
	        $location.url('/reporting');
	    };
	    $scope.loadSysAdmin = function () {
	        $location.url('/sysAdmin');
	    };
}]);

app.filter('startFrom', function() {
    return function(input, start) {
    	if(input){
        	start = +start; 
        	return input.slice(start);
    	}	
    }
});

function replaceAll(data,stringToFind,stringToReplace){
	var temp = data;
    var index = temp.indexOf(stringToFind);
    while(index != -1){
        temp = temp.replace(stringToFind,stringToReplace);
        index = temp.indexOf(stringToFind);
    }
    return temp;
}

function isUndefinedOrNull (val){ 
	return angular.isUndefined(val) || val === null || val == "";
}



