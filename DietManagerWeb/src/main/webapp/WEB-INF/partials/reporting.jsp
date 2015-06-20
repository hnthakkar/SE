<script type="text/javascript">

	function reportCtrl ($scope, $http, $rootScope) {
			$scope.foodItem = {};
			$scope.foodItem.msgValue = '';
			$scope.foodItem.name = '';
			$scope.foodItem.calories = '';
			$scope.addFoodItem = function() {
					$http.get('rest/FoodItem/Add/' + $scope.foodItem.name + '/' + $scope.foodItem.calories).success(function(data, status, header){
						$scope.foodItem.msgValue = "Successfully Added the Food Item!!";
					});
			}
		}
</script>
<div>
    <div id="reportingAccordion" class="accordion">
		<div class="accordion-group">
			<div class="accordion-heading">
				<a href="#userAudit" data-parent="#reportingAccordion" data-toggle="collapse" class="accordion-toggle" style="text-decoration: none;">Add Food Item</a>
			</div>
			<div class="accordion-body collapse in accordion-scroll" id="userAudit">
				<div class="accordion-inner">
					<div id="page-wrap">
						<div>
							<div>
								<b>{{foodItem.msgValue}}</b>
							</div>
							<h5><strong style="color: red">*</strong>Food Item</h5>
							<div>
								<input type="text" ng-model="foodItem.name"></input>
							</div>
							<h5><strong style="color: red">*</strong>Calories per Unit</h5>
							<div>
								<input type="text" ng-model="foodItem.calories"></input>
							</div>
							<br>
							<button class="btn btn-primary" ng-click="addFoodItem()">Add Food Item</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

