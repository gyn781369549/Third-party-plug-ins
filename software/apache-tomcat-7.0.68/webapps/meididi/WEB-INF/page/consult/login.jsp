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
	<link rel="stylesheet" type="text/css" href="assets/plugins/layer/skin/layer.css" id="layui_layer_skinlayercss">
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="css/ie.css" media="screen, projection" />
	<![endif]-->

	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="assets/plugins/layer/layer.js"></script>
	<title>医美 - Index</title>
    <script src="assets/js/sea.js"></script>
	<script src="assets/js/seajs-config.js"></script>
	<script src="assets/js/dialog-min.js"></script>
	<script src="assets/js/hospital/reg.js"></script>
    <style type="text/css">
    	#reg_send_sms_btn{
    		width: 100px;
		    height: 30px;
		    border: 0px;
		    margin-left: 20px;
		    margin-top: -10px;	
    	}
    	.meidd_index_bg{
    		background: url("assets/images/consult/con_bg3.jpg");
    		background-size: cover;
   			width: 100%;
    	}
    	/* .index_text  h1{
    		color: #ff8d84;
    	}
    	.index_btn a{
    		background: #index_btn;
    	} */
    </style>
    
</head>
<body class="meidd_index_bg">
	<div class="index_cont">
		<div class="index_text">
			<img src="assets/images/hospital/text_welcome.png">
			<p>欢迎回来！我的美容机构合作伙伴！</p>
			<h1>我们！</h1>
			<h1>因美丽相聚</h1>
			<h1>共同开创事业……</h1>
		</div>
		<div class="index_btn">
            <a href="javascript:void(0);" title="登录" class="input_green mr20" onclick="loginShow();">我要登录</a>
		</div>
	</div>
	<footer class="footer_box">北京漾世代科技有限公司     京ICP备16003557号</footer>
	<script type="text/javascript">
	$().ready(function(){
		if (window.frames.length != parent.frames.length) {  
	         //alert('在iframe中');
	         window.parent.location.href="index";
		}
	});
	var d = dialog({
	    content: '<div class="popup_box"><cite class="popup_t">登录</cite>'+
	    	'<div class="popup_cont"><div class="index_logoin_box"><p class="login_hint">忘记账号或密码请联系医院平台管理员</p>'+
	    	'<input id="username" type="text" placeholder="请输入手机号" name="">'+
	    	'<input id="password" type="password" style="width: 160px;" placeholder="请输入短信验证码" name="">'+
	    	'<input type="button" id="reg_send_sms_btn" onclick="sendSms()" value="点击发送">'+
	    	'<div class="login_captcha"></div></form></div>'+
	    	'<p class="popup_btn"><input type="button" value="取消" class="input_green mt25 mr20" onclick="loginOff();"/>'+
	    	'<input type="button" value="登录" class="input_green mt25" onclick="toLogin();"/></p></div></div>'
	});
	function loginShow(){
	    $(".popup_bg").show();
	   
	    d.show();
	}
	function loginOff(){
	    $(".popup_bg").hide();
	   
	    d.close();
	}
	function sendSms(){
		var phone = $("#username").val();
		if(phone==null||phone==''){
			$("#username").addClass('error_code');
			return false;
		}else{
			$.ajax({
				url:"api/phonecode",
				type:"POST",
				data:{phone:$("#username").val()},
				dataType:"json",
				success:function(data){
					if(data.code == 0){
						layer.alert("已发送，请注意查收",function(){
							layer.closeAll();
							sendSmsBtn();
						});
						
					}
				}
				
			});
		}
		
	}
	//倒计时按钮
	var countdown = 60;
	 function sendSmsBtn(){
		
		var node = document.getElementById('reg_send_sms_btn');
		if(countdown>=0){
			if(countdown == 0) { 
				node.removeAttribute("disabled");    
				node.value="点击发送";
				countdown = 60;
				node.style.color='#000';
				return;
			}else{
				node.setAttribute("disabled", true);
				node.style.color='#aaa';
				//if($('#reg_tel ~ p').length>0){$('#reg_tel ~ p').remove()}
				node.value="重新发送(" + countdown + ")"; 
				--countdown; 
			}
		}

		setTimeout(function() {
			if(countdown>=0){sendSmsBtn();}
		},1000)
	}

function toLogin(){
    
    var name=$("#username").val();
    var code=$("#password").val();
    if(name==''){
        $("#username").addClass('error_code');
        return false;
    }
    
    /* if(password==''){
        $("#password").addClass('error_code');
        return false;
    } */

    //$("#login_form").submit();
    $.ajax({
		url:"consult/doLogin",
		type:'POST',
		timeout:3000,
		dataType:"json",
		data : {"phone":name,'code':code},
		success:function(data){
        	if(data.code==200){
            	$(".popup_bg").hide();
             	d.close();
                window.location="consult/index"; 
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