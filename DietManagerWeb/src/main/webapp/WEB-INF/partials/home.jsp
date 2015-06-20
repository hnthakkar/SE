<!-- <script type="text/javascript">
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
</script> -->
<div>
    <div id="homeAccordion" class="accordion">
	    <div class="accordion-group">
	         <div class="accordion-heading">
	             <a href="#overAll" data-parent="#homeAccordion" data-toggle="collapse" class="accordion-toggle" style="text-decoration: none;">Plan Diet</a>
	         </div>
	         <div class="accordion-body collapse in accordion-scroll" id="overAll" data-ng-init="initHomePage()">
	             <div class="accordion-inner">
	             <div id="msg"><b>Recommended Calories Intake : {{home.recocalIntake}}</b></div>
	             <div id="msg"><b>Calories Intake for Today : {{home.calIntake}}</b></div>
	             	 <input type="text" class="form-control" placeholder="Search" ng-model="allSearchText">
	             	 <label style="float:right;font-weight: bold">Page Size&nbsp;<input type="text" class="form-control" placeholder="Page Size" ng-model="overAllPageSize" style="width:30px;float:right;"></label>
	             	 <table  id="overAlltable" class="zebra">
	             	 	<tr>
	             	 		<th id="sysName">Food Item</th> 
	             	 		<th id="status">Calories</th>
	             	 		<th id="status">Plan your Diet</th>
	             	 	</tr>
	             	 	<tr class="customtable" ng-repeat="item in home.overAllSSItems | filter:allSearchText | startFrom:homeoverAllCP*overAllPageSize  | limitTo:overAllPageSize ">
							<td>{{item.name}}</td>
							<td>{{item.calories}}</td>
							<td><button class="btn btn-primary"  ng-click="updateSchedule()">Add</button>
								<button class="btn btn-primary"  ng-click="removeSchedule()">Remove</button>
							</td>
						</tr>	
					 </table>
					<br>
					<div ng-show="home.overAllSSItems.length>overAllPageSize">
					<button class="btn btn-primary" ng-disabled="homeoverAllCP == 0" ng-click="homeoverAllCP=homeoverAllCP-1">Previous</button>
					{{homeoverAllCP+1}}/{{numberOfPages((home.overAllSSItems | filter:allSearchText ),overAllPageSize)}}
					<button class="btn btn-primary" ng-disabled="homeoverAllCP >= ((home.overAllSSItems | filter:allSearchText ).length/overAllPageSize) - 1" ng-click="homeoverAllCP=homeoverAllCP+1">Next</button>
					<label style="font-weight:bold" ng-show="home.overAllFilterRecord">After filtering : {{(home.overAllSSItems | filter:allSearchText).length}} records</label>
					<label style="font-weight:bold">Total Records {{home.overAllSSItems.length}}</label>
					</div>		
				</div>
	         </div>
	     </div>
	</div>
</div>



