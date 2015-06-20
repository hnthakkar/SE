<script type="text/javascript">
 function sysAdminCtrl($scope,$http,$rootScope){
	 $scope.history = {};
	$scope.history.overAllSSItems = null;
	$scope.history.detailedSSItems = null;
	$scope.history.showOverAllTable = false;
	$scope.history.showDetailedTable = false;
	$scope.history.overAllMsg = '';
	$scope.history.detailedMsg = '';
	$scope.homeoverAllCP = 0;
	$scope.pageSize = 5;
	$scope.homeDetailedCP = 0;
	$scope.overAllPageSize = 5;
	$scope.detailedPageSize = 5;
	$scope.history.overAllFilterRecord = false;
	$scope.history.detailedoverAllFilterRecord = false;
	
	$scope.initHistoryPage = function() {
		$http.get('rest/History/All').success(function(data, status, headers) {
			$scope.history.overAllSSItems = data;
		});
	}
	$scope.numberOfPages=function(data,pageSize){
		if(data && data.length)
		   return Math.ceil(data.length/pageSize);                
	}
	$scope.$watch("allSearchText", function(newVal) {
        if(!isUndefinedOrNull(newVal)){
        	$scope.history.overAllFilterRecord = true;
        } else {
        	$scope.history.overAllFilterRecord = false;
        }
        $scope.homeoverAllCP = 0;
    });
	
	$scope.$watch("overAllPageSize", function(newVal) {
		$scope.homeoverAllCP = 0;
	});
}
 </script>

<div>
    <div id="homeAccordion" class="accordion">
	    <div class="accordion-group">
	         <div class="accordion-heading">
	             <a href="#overAll" data-parent="#homeAccordion" data-toggle="collapse" class="accordion-toggle" style="text-decoration: none;">Diet History</a>
	         </div>
	         <div class="accordion-body collapse in accordion-scroll" id="overAll" data-ng-init="initHistoryPage()">
	             <div class="accordion-inner">
	             	 <input type="text" class="form-control" placeholder="Search" ng-model="allSearchText">
	             	 <label style="float:right;font-weight: bold">Page Size&nbsp;<input type="text" class="form-control" placeholder="Page Size" ng-model="overAllPageSize" style="width:30px;float:right;"></label>
	             	 <table  id="overAlltable" class="zebra">
	             	 	<tr>
	             	 		<th id="sysName">Food Item</th> 
	             	 		<th id="status">Calories</th>
	             	 		<th id="status">Date</th>
	             	 	</tr>
	             	 	<tr class="customtable" ng-repeat="item in history.overAllSSItems | filter:allSearchText | startFrom:homeoverAllCP*overAllPageSize  | limitTo:overAllPageSize ">
							<td>{{item.foodItem}}</td>
							<td>{{item.calories}}</td>
							<td>{{item.plandate}}</td>
						</tr>	
					 </table>
					<br>
					<div ng-show="history.overAllSSItems.length>overAllPageSize">
					<button class="btn btn-primary" ng-disabled="homeoverAllCP == 0" ng-click="homeoverAllCP=homeoverAllCP-1">Previous</button>
					{{homeoverAllCP+1}}/{{numberOfPages((history.overAllSSItems | filter:allSearchText ),overAllPageSize)}}
					<button class="btn btn-primary" ng-disabled="homeoverAllCP >= ((history.overAllSSItems | filter:allSearchText ).length/overAllPageSize) - 1" ng-click="homeoverAllCP=homeoverAllCP+1">Next</button>
					<label style="font-weight:bold" ng-show="history.overAllFilterRecord">After filtering : {{(history.overAllSSItems | filter:allSearchText).length}} records</label>
					<label style="font-weight:bold">Total Records {{history.overAllSSItems.length}}</label>
					</div>		
				</div>
	         </div>
	     </div>
	</div>
</div>

