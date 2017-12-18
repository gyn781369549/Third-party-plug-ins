<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<%@include file="common/taglib.jsp" %>
    <script type="text/javascript" src="${ctx}/assets/js/hospital/index.js"></script>
    <style type="text/css">
    .popup_box{margin-top:-100px;top: 18%}
    .popup_t{height:30px;line-height:30px;font-size:16px;}
    .push_preview{margin-top:10px;}
    .push_preview h1{font-size:14px;font-weight:300;line-height:20px}
    .push_preview h2{font-size:13px;line-height:20px;}
    .popup_btn{margin:5px 0}
    /* .popup_btn input[type="button"]{height: 30px;line-height: 30px;} */
    .push_tel_box{margin-top: 5px;}
    .push_tel{overflow-y:hidden}
	</style>
	<link>
</head>
<body role="document">
    <!--header Start-->
	<header class="bwh_header">
		<div class="bwh_left_box">
			<img src="${ctx }/assets/images/index_logo1.png" alt="">
		</div>
		<div class="bwh_right_box">
			<cite>${session.hosInf.name}</cite>
			<div class="personal_box">
				<a href="javascript:void(0);" class="bwh_head_pic" onclick="upIcon()">
					<c:if test="${!empty session.logo && session.logo!=''}">
						<img  src="${ctx }/upload${session.logo}" alt="">
					</c:if>
					<c:if test="${empty session.logo || session.logo==''}">
						<img src="${ctx }/assets/images/elite_charts.png" alt="">
					</c:if>
					<span>${session.hosInf.name}</span></a>
				<a class="person_operate change_word" href="javascript:void(0)" onclick="resetAdminPsd();" title="">修改密码</a>
				<a class="person_operate exit" href="${ctx }/login_out" title="">安全退出</a>
	        </div>
	    </div>
	</header><!--header End-->
    <div class="bwh_cont">
        <!--菜单-->
        <%@ include file="common/left.jsp" %>
		<div class="meidd_right_box" id="meiddRight">
        	<iframe name="main_content" id="main_content" src="information_basic"  border="0" frameborder="0" allowTransparency="true" style=" padding: 0px; margin: 0px;width: 100%;" onload="this.height=(this.contentWindow.document.body.offsetHeight+30);"  ></iframe>
		</div>
    </div>
	<div class="popup_box1" id="resetAdminPsdDiv" style="display: none">
		<cite class="popup_t">修改密码</cite>
			<form method="post" class="password_cont" id="resetAdminPsdForm" name="resetAdminPsdForm" action="${ctx }/hospital/account_reset">
                <div class="popup_cont">
                    <div class="index_logoin_box">
                        <p class="login_hint">6-18位数字及字母，不支持特殊字符及空格</p>
                        <input type="password" placeholder="请输入当前使用密码" id="oldPwd" name="oldPwd"/>
                        <label id="oldPwd-error" class="error login_hint" for="oldPwd" style="display: block;border: none;margin-top: 0"></label>
                        <input type="password" placeholder="请输入新密码" id="newPwd" name="newPwd"/>
                        <label id="newPwd1-error" class=" error login_hint" for="newPwd" style="display: block;border: none;margin-top: 0"></label>
                        <input type="password" placeholder="请重复输入新密码" id="newPwd2" name="newPwd2"/>
                        <label id="newPwd2-error" class=" error login_hint" for="newPwd2" style="display: block;border: none;margin-top: 0"></label>
                    </div>
                </div>
                <p class="popup_btn">
                    <input type="button" id="resetSubmit" value="确定" class="input_green mt25" />
                    <input type="reset" value="取消" class="input_green mt25" onclick="validator.resetForm();layer.closeAll();"/>
                </p>
            </form>
	</div>
	<div id="upIconDiv" class="popup_box1" style="display:none">
	    <cite class="popup_t">上传头像</cite>
	    <form class="pic_uploading"    action="" method="post">
	        <div class="popup_cont head_box">
	            <div class="upload_logo_pic">
	                <p class="logo_cont">
	                    <img id="indexIconPreview" src="${ctx }/upload${session.logo}" >
	                    <a id="uploadIcon" title="上传头像" href="javascript:void(0)">上传头像</a>
	                    <input id="icon_val" type="hidden" name="photo" value="">
	                </p>
	                <div class="logo_hints" style="font-size: 11px;">
	                    <blockquote>上传头像图片支持JPG、JPEG、PNG格式;</blockquote>
	                    <blockquote>上传头像图片大小不超过2M</blockquote>
	                </div>
	            </div>
	            <p class="popup_btn">
	                <span class="popup_btn_p">
	                    <input type="button" id="upPhotoSub" class="input_green mr20" value="确定" style="margin-top:0"/>
	                    <input type="reset" value="取消" class="input_green" style="margin-top:0" onclick="layer.closeAll();"/>
	                </span>
	            </p>
	        </div>
		    </form>
		</div>
		<div class="popup_box1" id="resetAdminPsdDiv" style="display: none">
		<cite class="popup_t">修改密码</cite>
			<form method="post" class="password_cont" id="resetAdminPsdForm" name="resetAdminPsdForm" action="${ctx }/account_reset">
                <div class="popup_cont">
                    <div class="index_logoin_box">
                        <p class="login_hint">6-18位数字及字母，不支持特殊字符及空格</p>
                        <input type="password" placeholder="请输入当前使用密码" id="oldPwd" name="oldPwd"/>
                        <label id="oldPwd-error" class="error login_hint" for="oldPwd" style="display: block;border: none;margin-top: 0"></label>
                        <input type="password" placeholder="请输入新密码" id="newPwd" name="newPwd"/>
                        <label id="newPwd1-error" class=" error login_hint" for="newPwd" style="display: block;border: none;margin-top: 0"></label>
                        <input type="password" placeholder="请重复输入新密码" id="newPwd2" name="newPwd2"/>
                        <label id="newPwd2-error" class=" error login_hint" for="newPwd2" style="display: block;border: none;margin-top: 0"></label>
                    </div>
                </div>
                <p class="popup_btn">
                    <input type="button" id="resetSubmit" value="确定" class="input_green mt25 mr20" />
                    <input type="reset" value="取消" class="input_green mt25" onclick="validator.resetForm();layer.closeAll();"/>
                </p>
            </form>
	</div>

		
	<footer class="footer_box bwh_footer">本网站由北京漾世代科技有限公司版权所有 版本号 V1.0</footer>
<script type="text/javascript" src="${ctx}/assets/js/hospital/cutImage.js"></script>	
<script type="text/javascript">
	function cut_submit(){ Jcrop_cut_submit("indexIconPreview","icon_val",false); }
	$(document).ready(function () {
		$("#datepicker , #datepicker1").datepicker({
			changeMonth: true,
			changeYear: true, dateFormat: 'yy-mm-dd'
		});//日期修改年份
		
	});
</script>
</body>
</html>