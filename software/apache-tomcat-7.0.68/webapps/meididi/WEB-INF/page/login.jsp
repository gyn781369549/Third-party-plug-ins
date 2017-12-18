<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/page/console/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>美滴滴用户登录</title>

<style>
.c_error {
	height: auto
}
</style>
</head>
<body role="document" class="login_bg">
	<div class="meidd_login_logo">
		<img src="${ctx }/assets/images/ico_meidd_logo1.png" alt=""
			class="login_logo clearfix">
	</div>
	<!--login Start-->
	<div class="meidd_login_box">

		<h1 class="login_t">后台登录</h1>
		<form id="signup_form" action="${ctx }/adminLogin" method="post">
			<fieldset>
				<p class="login_frm">
					<input id="userName" placeholder="请填写登录用户名"
						name="admin.name" type="text"> <span
						class="login_hint" style="display: block">请填写完整用户名</span>
				</p>
				<c:if test="${error=='nullName'}">
					<div class="login_hint c_error">
					<div class="errorMessage" id="LoginForm_username_em_">用户名不能为空</div>
				</div>
				</c:if>
				
				<p class="login_frm">
					<input id="password" placeholder="请填写登录密码"
						name="admin.pass" type="password"> <span
						class="login_hint" style="display: block"></span>
				</p>
				<c:if test="${error=='nullPass'}">
				<div class="login_hint c_error">
					<div class="errorMessage" id="LoginForm_password_em_">
					密码不能为空</div>
				</div>
				</c:if>
				<c:if test="${error=='error'}">
				<div class="login_hint c_error">
					<div class="errorMessage" id="LoginForm_password_em_">
					用户名或密码错误</div>
				</div>
				</c:if>
				<p class="login_frm btn_login">
					<input type="submit" placeholder="登录" value="登录">
				</p>
			</fieldset>
		</form>
	</div>
	<!--login End-->
<script type="text/javascript">
	$().ready(function(){
		if (window.frames.length != parent.frames.length) {  
	         //alert('在iframe中');
	         window.parent.location.href="admin";
		}
	});	
</script>

</body>
</html>