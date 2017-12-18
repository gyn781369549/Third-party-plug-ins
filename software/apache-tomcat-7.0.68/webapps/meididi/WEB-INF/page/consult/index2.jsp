<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN" ng-app="demo">
<head>
	<base href="<%=basePath%>">
	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/angular.js"></script>
	<script type="text/javascript" src="assets/js/RongIMWidget.js"></script>
	<link rel="stylesheet" type="text/css" href="assets/css/RongIMWidget.css"/>
	<script type="text/javascript">
	    window["SCHEMETYPE"] = "http";
	    if(navigator.userAgent.indexOf("MSIE 9")!=-1){
	      window.WEB_XHR_POLLING = true;
	    }
	</script>
</head>
<body ng-controller="main">
   
<div>
      <!-- <rong-conversation style=""></rong-conversation> -->
      <rong-widget></rong-widget>
    </div>
		
<script type="text/javascript">

	var demo = angular.module("demo", [ "RongWebIMWidget" ]);
	demo.config(function($logProvider) {
		// $logProvider.debugEnabled(false);
	});
	demo.controller("main", [ "$scope", "WebIMWidget", "$http",
			function($scope, WebIMWidget, $http) {
		
		  $scope.show = function() {
			    WebIMWidget.show();
			  }

			  $scope.hidden = function() {
			    WebIMWidget.hidden();
			  }

			  $scope.server = WebIMWidget;
			  $scope.targetType=1;

			  $scope.setconversation=function(){
			    WebIMWidget.setConversation(Number($scope.targetType), $scope.targetId, "自定义:"+$scope.targetId);
			  }
				WebIMWidget.init({

					appkey : "n19jmcy59ut19",
					token : "${rToken}",
					onSuccess:function(){
		      			console.log("初始化完成");
		      		},
		      		onError:function(){
		      			console.log("初始化错误");
		      		},
					style : {
						width : 500,
						height : 400,
						top : 0,
						left : 0
					},
					displayConversationList : true,
					hiddenConversations:[{type:WebIMWidget.EnumConversationType.PRIVATE,id:'u8'}],
				//displayMinButton:false
				});

				WebIMWidget.show();
				//消息窗体
				WebIMWidget.setUserInfoProvider(function(targetId,obj){
					console.log(obj);
					$http({
				  url:"consult/consult_list"
				  //url:"userinfo.json"
				}).success(function(rep){
				  var user;
				  rep.userlist.forEach(function(item){
					  console.log("id"+item.id);
					  console.log("target"+targetId);
					  user = item;
				    if(item.id==targetId){
				      user=item;
				    }
				  })
					console.log(user);
				  if(user){
				    obj.onSuccess({id:user.id,name:user.name,portraitUri:user.portraitUri});
				  }else{
				    obj.onSuccess({id:targetId,name:"陌："+targetId});
				  }
				})
				});

				//会话列表
				WebIMWidget.setOnlineStatusProvider(function(arr, obj) {
					$http({
						url : "consult/consult_online"
						//url : "online.json"
					}).success(function(rep) {
						obj.onSuccess(rep.data);
					})
				})
				WebIMWidget.show();
			} ]);
</script>
</body>
</html>