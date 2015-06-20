<!DOCTYPE html>
<html ng-app="outerApp" xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>Diet Manager</title>
<meta http-equiv="X-UA-Compatible" content="IE=10,IE=9,IE=8" >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <meta http-equiv="X-UA-Compatible" content="IE=10,IE=9,IE=8" />
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="static/css/style.css" rel="stylesheet" type="text/css"/>  
   
 <link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen" type="text/css"/>
 <link href="static/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
 <!--[if gte IE 9] -->
  <style type="text/css">
    .gradient {
       filter: none;
    }
  </style>
<!-- [endif]-->
</head>
<body>
 <div class="container"> 
 	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="#/" style="text-decoration: none;" >Diet Manager</a>
				<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="nav-collapse collapse" ng-controller="NavCtrl">
					<form name='f' action="<c:url value='j_spring_security_check' />" method='POST' class="nav pull-right"	>
						<input type="text" id="username" name="username" placeholder="Username" class="input-xlarge" style="height:20px;margin-top:3px;">
						<input type="password" id="password" name="password" placeholder="Password" class="input-xlarge" style="height:20px;margin-top:3px;">			
						<button type="submit" name="submit" class="customButton" style="height:30px">Sign in</button>
						<input type="button" id="register" class="customButton" style="height:30px" value="New User" onclick="showRegisterForm();">
					</form>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<br>
	<div ng-view></div>
 </div>
 <script src="static/lib/jquery-2.0.3.js"></script>
 <script src="static/lib/bootstrap.js"></script>
 <script src="static/lib/angular.js"></script>
 <script src="static/js/outer/outerRoute.js"></script>
 <script src="static/js/outer/outerApp.js"></script>
 <script src="static/lib/json2.js"> </script>
</body>
</html>
