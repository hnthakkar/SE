<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html ng-app="innerApp" xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>Diet Manager</title>
 <meta http-equiv="X-UA-Compatible" content="IE=10,IE=9,IE=8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="./static/css/style.css" rel="stylesheet" type="text/css"/>  
 <link href="./static/css/bootstrap.min.css" rel="stylesheet" media="screen" type="text/css"/>
 <link href="./static/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
 <link href="./static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
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
					<ul class="nav">
						<li ng-class="navClass('home')"><a href='#/home' style="text-decoration: null">Plan Diet</a></li>
     					<li ng-class="navClass('reporting')"><a href='#/reporting'>Add Food Item</a></li>
     					<li ng-class="navClass('sysAdmin')"><a href='#/sysAdmin'>History</a></li>
     				</ul>
     				<ul class="nav navbar-nav pull-right" id="main-navigation">
     					<li id="username" style="font-weight: bold;color:#E7B26C;padding-top: 10px;">Welcome: <u>${user.username}</u></li>
                		<li><a href="${pageContext.servletContext.contextPath}/logout" class="pull-right custom" style="font-weight:bold">Logout</a></li>
            		</ul>
     			</div>
			</div>
		</div>
	 </div>
	 <hr>
	 <br>
	 <br>
	 <div ng-view></div>
 </div>
 <script src="./static/lib/jquery-2.0.3.js"></script>
 <script src="./static/lib/bootstrap.js"></script>
 <script src="./static/lib/angular.js"></script>
 <script src="./static/js/route.js"></script>
 <script src="./static/js/app.js"></script>
 <script src="./static/lib/bootstrap-datetimepicker.min-2.js"></script>
 <script src="./static/lib/json2.js"> </script>
 <script src="./static/js/home.js"></script>
</body>
</html>
