<script type="text/javascript">
function showRegisterForm(){
	 $("#pic").hide();
    $("#registerForm").show();
}
</script>
<script type="text/javascript">

function statusCtrl($scope,$http,$rootScope) {
	$scope.user = {};		
	$scope.user.name = '';
	$scope.user.height = '';
	$scope.user.weight ='';
	$scope.user.age = '';
	$scope.user.gender ='';
	$scope.user.password ='';
	$scope.user.msgValue = '';
	$scope.register = function() {
		$http.get('rest/Register/User/' + $scope.user.name +'/'+ $scope.user.age +'/'+ $scope.user.height +'/'+ $scope.user.weight +'/'+ $scope.user.gender +'/'+ $scope.user.password).success(function(data, status, headers) {
			$scope.user.msgValue = "Successfully Registered!!";
		});
	}
}

</script>
<div id="registerForm" hidden>
		<table style="width:400px;">
			<tr>
				<td><label style="float:right;font-weight: bold">Name &nbsp; </label></td>
				<td><input type="text" class="form-control" ng-model="user.name" style="width:200px;float:left;"></td>
			</tr>	
			<tr>
				<td><label style="float:right;font-weight: bold">Age &nbsp; </label></td>
				<td><input type="text" class="form-control" ng-model="user.age" style="width:200px;float:left;"></td>
			</tr>
			<tr>
				<td><label style="float:right;font-weight: bold">Weight(in Pounds) &nbsp; </label></td>
				<td><input type="text" class="form-control" ng-model="user.weight" style="width:200px;float:left;"></td>
			</tr>
			<tr>
				<td><label style="float:right;font-weight: bold">Height(in inches) &nbsp; </label></td>
				<td><input type="text" class="form-control" ng-model="user.height" style="width:200px;float:left;"></td>
			</tr>
			<tr>
				<td><label style="float:right;font-weight: bold">Gender &nbsp; </label></td>
				<td><select id="gender" ng-model="user.gender">
      						<option value="1">Male</option>
      						<option value="2">Female</option>
      				</select></td>
			</tr>
			<tr>
				<td><label style="float:right;font-weight: bold">Password &nbsp; </label></td>
				<td><input type="password" class="form-control" ng-model="user.password" style="width:200px;float:left;"></td>
			</tr>
			<tr>
				<td colspan="2"><button class="btn btn-primary" ng-click="register()">Register</button></td>
			<tr>
		</table>
	</div>
	<div id="msg"><b>{{user.msgValue}}</b></div>
<div id="pic">
	 <img src="./static/img/fat-to-slim.png" alt="Smiley face"> 
</div>
