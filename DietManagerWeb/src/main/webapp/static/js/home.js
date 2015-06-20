
function homeCtrl ($scope, $http,$rootScope) {
	$scope.home = {};
	$scope.home.overAllSSItems = null;
	$scope.home.detailedSSItems = null;
	$scope.home.showOverAllTable = false;
	$scope.home.showDetailedTable = false;
	$scope.home.overAllMsg = '';
	$scope.home.detailedMsg = '';
	$scope.homeoverAllCP = 0;
	$scope.pageSize = 5;
	$scope.homeDetailedCP = 0;
	$scope.overAllPageSize = 5;
	$scope.detailedPageSize = 5;
	$scope.home.overAllFilterRecord = false;
	$scope.home.detailedoverAllFilterRecord = false;
	
	$scope.initHomePage = function() {
		$http.get('rest/PlanDiet/FoodList').success(function(data, status, headers) {
			$scope.home.overAllSSItems = data;
		});
		
		$http.get('rest/PlanDiet/IntakeForToday/').success(function(data, status, headers) {
			$scope.home.calIntake = data;
		});
		
		$http.get('rest/PlanDiet/Recommended/').success(function(data, status, headers) {
			$scope.home.recocalIntake = data;
		});
		
	}
	
	$scope.updateSchedule = function(){
		var name = this.item.name;
		var calories = this.item.calories;
		$http.get('rest/PlanDiet/AddToPlan/' + name +'/'+ calories).success(function(data, status, headers) {
		});
		
		$http.get('rest/PlanDiet/IntakeForToday/').success(function(data, status, headers) {
			$scope.home.calIntake = data;
		});
	}
	
	$scope.removeSchedule = function(){
		var name = this.item.name;
		$http.get('rest/PlanDiet/removeFromPlan/' + name +'/').success(function(data, status, headers) {
		});
		
		$http.get('rest/PlanDiet/IntakeForToday/').success(function(data, status, headers) {
			$scope.home.calIntake = data;
		});
	}
	
	$scope.numberOfPages=function(data,pageSize){
		if(data && data.length)
		   return Math.ceil(data.length/pageSize);                
	}
	$scope.$watch("allSearchText", function(newVal) {
        if(!isUndefinedOrNull(newVal)){
        	$scope.home.overAllFilterRecord = true;
        } else {
        	$scope.home.overAllFilterRecord = false;
        }
        $scope.homeoverAllCP = 0;
    });
	
	$scope.$watch("overAllPageSize", function(newVal) {
		$scope.homeoverAllCP = 0;
	});
}
