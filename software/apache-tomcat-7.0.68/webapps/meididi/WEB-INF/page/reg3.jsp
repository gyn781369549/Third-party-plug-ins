<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit">
	<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="assets/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="assets/css/print.css" media="print" />
	<link rel="stylesheet" type="text/css" href="assets/css/main.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/uploadify_yimei.css"  />
	<link rel="stylesheet" type="text/css" href="assets/css/index/base.css"  />
	<link rel="stylesheet" type="text/css" href="assets/css/index/popup.css"  />
	<link rel="stylesheet" type="text/css" href="assets/css/index/bootstrap.min.css"  />
	<link rel="stylesheet" type="text/css" href="assets/css/ui-dialog.css"  />
	
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="assets/css/ie.css" media="screen, projection" />
	<![endif]-->

	<script type="text/javascript" src="assets/js/jquery.min.js"></script>

	<title>医美 - Index</title>
    <script src="assets/js/sea.js"></script>
	<script src="assets/js/seajs-config.js"></script>
	<script src="assets/js/dialog-min.js"></script>
	<script src="assets/js/layer.js"></script>
	<script src="assets/js/country.js"></script>
    <script src="assets/js/uploadify/jquery.uploadify.js" type="text/javascript"></script>
	<script src="assets/js/hospital/reg.js"></script>
</head>
<body role="document">
	<div class="popup_bg" style="display: none;z-index: 1;"></div>
	<header class="enroll_header">
		<a href="javascript:;" onclick="lxwmShow();" title="">联系我们</a>
		<div class="meidd_logo">
                <a href="javascript:;" title="美滴滴中国专业整形咨询平台">
                    <img src="assets/images/index_logo2.png" alt="">
                </a>
            </div>
	</header>
	<div class="enroll_cont">
		<div class="enroll_box">
			<h1>欢迎注册美滴滴中国专业整形咨询平台账号</h1>
			<div class="enroll_infor">
				<p class="enroll_title enroll_3">
					<span class="enroll_1_1">Step1&nbsp;身份认证</span>
					<span class="enroll_1_2">Step2&nbsp;医院信息填写</span>
					<span class="enroll_1_3">Step3&nbsp;提交</span>
				</p>
				<form class="enroll_form fillin_infor">
					<p class="sub_t">您提交的注册申请正在审核，请您关注邮箱中的回复信息。</p>
					<div class="btn_enroll_k tc m0">
                    <input class="input_green ml40" type="button" value="回首页" onclick="javascript:window.location.href='index';">
					</div>
				</form>
			</div>
		</div>
	</div>
        <footer class="footer_box">北京漾世代科技有限公司     京ICP备16003557号</footer>


</body></html>