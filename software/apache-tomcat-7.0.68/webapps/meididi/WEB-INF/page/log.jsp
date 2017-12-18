<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="assets/css/hospital/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="assets/css/hospital/print.css" media="print" />
	<link rel="stylesheet" type="text/css" href="assets/css/hospital/base.css"  />
	<link rel="stylesheet" type="text/css" href="assets/css/hospital/popup.css"  />
	<link rel="stylesheet" type="text/css" href="assets/css/hospital/main.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"  />
	<link rel="stylesheet" type="text/css" href="assets/css/ui-dialog.css"  />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="css/ie.css" media="screen, projection" />
	<![endif]-->

	<script type="text/javascript" src="assets/js/jquery.min.js"></script>

	<title>美滴滴-为用户定制全程一对一实时在线咨询服务专业的整形医美咨询平台</title>
    <script src="assets/js/sea.js"></script>
	<script src="assets/js/seajs-config.js"></script>
	<script src="assets/js/dialog-min.js"></script>
	<script src="assets/js/hospital/reg.js"></script>
    <style type="text/css">
    	.popup_bg~header{
    		background: none;
    	}
    </style>
</head>
<body class="">
    <div class="popup_bg" style="display: none;z-index: 1;"></div>
	<jsp:include page="hospital/common/head.jsp"></jsp:include>
	<div class="index_cont">
		<div class="index_text">
			<img src="assets/images/hospital/text_welcome.png">
			<p>欢迎回来！我的美容机构合作伙伴！</p>
			<h1>我们！</h1>
			<h1>因美丽相聚</h1>
			<h1>共同开创事业……</h1>
		</div>
		<div class="index_btn">
            <a href="javascript:void(0);" title="我要登录" class="input_green mr20" onclick="loginShow();">我要登录</a>
            <a href="account_reg" title="我要注册" class="btn_b_green c_brown">我要注册</a>
		</div>
	</div>
	<footer class="footer_box" style="position:fixed;bottom: 0px; margin-top: 34px;">北京漾世代科技有限公司     京ICP备16003557号</footer>
	<img alt="" src="assets/images/hospital/index_bg.jpg" style="position:fixed;left:0;top:0;right:0;bottom:0;width:100%;height:100%;z-index:-11;">
	<script type="text/javascript">
	$().ready(function(){
		if (window.frames.length != parent.frames.length) {  
	         //alert('在iframe中');
	         window.parent.location.href="index";
		}
	});
var d = dialog({
    content: '<div class="popup_box"><cite class="popup_t">登录</cite><div class="popup_cont"><div class="index_logoin_box"><p class="login_hint">忘记账号或密码请联系医院平台管理员</p><input id="username" type="text" placeholder="请输入登录账号" name="LoginForm[username]"><input id="password" type="password" placeholder="请输入登录密码" name="LoginForm[password]"><div class="login_captcha"></div></form></div><p class="popup_btn"><input type="button" value="取消" class="input_green mt25 mr20" onclick="loginOff();"/><input type="button" value="登录" class="input_green mt25" onclick="toLogin();"/></p></div></div>'
});
function loginShow(){
    $(".popup_bg").show();
   
    d.show();
}
function loginOff(){
    $(".popup_bg").hide();
   
    d.close();
}

function toLogin(){
    
    var name=$("#username").val();
    var password=$("#password").val();
    if(name==''){
        $("#username").addClass('error_code');
        return false;
    }
    if(password==''){
        $("#password").addClass('error_code');
        return false;
    }

    //$("#login_form").submit();
    $.ajax({
		url:"login",
		type:'POST',
		timeout:3000,
		data : {"hospitalAccount.accounts":name,"hospitalAccount.password":password},
		success:function(data){
        	if(data=="success"){
            	$(".popup_bg").hide();
             	d.close();
                window.location.href="hospital/index"; 
            }else{
                 $(".login_hint").html("登录失败");
            }

           }
      });
}


$(document).keydown(function(e) {
	if (e.keyCode == 13){
		toLogin();
 	}
	});
</script>


</body>
</html>