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
	<script src="assets/plugins/layer/layer.js"></script>
    <script src="assets/js/sea.js"></script>
	<script src="assets/js/seajs-config.js"></script>
	<script src="assets/js/dialog-min.js"></script>
	<script src="assets/js/country.js"></script>
    <script src="assets/js/uploadify/jquery.uploadify.js" type="text/javascript"></script>
	
</head>
<body role="document">
	<div class="popup_bg" style="display: none;z-index: 1;"></div>
       <jsp:include page="hospital/common/head.jsp"></jsp:include>
        <div class="enroll_cont">
            <div class="enroll_box">
                <h1>欢迎注册美滴滴中国专业整形咨询平台账号</h1>
                <div class="enroll_infor">
                    <p class="enroll_title enroll_2">
                        <span class="enroll_1_1">Step1&nbsp;身份认证</span>
                        <span class="enroll_1_2">Step2&nbsp;医院信息填写</span>
                        <span class="enroll_1_3">Step3&nbsp;提交</span>
                    </p>
                    <form class="enroll_form fillin_infor" action="account_regInf" method="post" name="formTwo" id="form">
                    	<input type="hidden" name="hosInf.id" value="${hosInf.id}"/>
                    	<input type="hidden" name="hospitalAccount.id" value="${account.id}"/>
                    	
                        <div class="enroll_pbox">
                            <span><em>*</em>医院名称</span>
                            <input type="text" class="" name="hosInf.name" value="${hosInf.name }" id="hospital_name" placeholder="请填写营业执照上的名称" maxlength="125">						
                            <label class="enroll_error_hint" style="display: none;" id="hospital_name_error">该医院已被注册</label>
                        </div>
                        <div class="enroll_pbox">
                            <span><em>*</em>帐号</span>
                            <p class="enroll_validate">
                            	<input type="text" <c:if test="${!empty account.accounts && account.accounts!='' }">readonly='readonly'</c:if> class="w148 mr20" name="hospitalAccount.accounts" value="${account.accounts}" id="accounts" placeholder="请填写帐号，用于登录" maxlength="20">
                                <label class="enroll_error_hint w268 ib p0" style="display: none;" id="accounts_error">请填写帐号</label>
                            </p>
                            <span><em>*</em>密码</span>
                            <p class="enroll_validate">
                                <input type="password"  <c:if test="${!empty account && account.password!='' }">readonly='readonly'</c:if> class="w148" name="hospitalAccount.password" value="${account.password}" id="password" placeholder="请填写登录密码" maxlength="20">
                                <label class="enroll_error_hint w268 ib p0" style="display: none;" id="password_error">请填写密码</label>
                            </p>
                            <div class="clearfix"></div>
                        </div>
                        <div class="enroll_pbox">
                            <span><em>*</em>医院联络人</span>
                            <p class="enroll_validate">
                                <input type="text" class="w148 mr20" name="hosInf.contacts" value="${hosInf.contacts}" id="contact_name" placeholder="请填写联系人姓名" maxlength="20">
                                <label class="enroll_error_hint w268 ib p0" style="display: none;" id="contact_name_error">请填写联系人姓名</label>
                            </p>
                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="enroll_pbox">
                            <span><em>*</em>医院地址</span>
                            <p class="enroll_select clearfix">
                            	<c:if test="${empty hosInf.countries || hosInf.countries=='' }">
                            		<span class=" ml10">
                                    <select class="w97 province" id="provice" >
									</select>
                                    <label class="enroll_error_hint w197 ib p0" style="display: none;" id="provice_error">请选择省</label>
                                	</span>
                                	<span class=" ml10">
                                    	<select class="w112 ml10 city" id="city"  >
                                   	 	</select>
                                    	<label class="enroll_error_hint w268 ib p0" style="display: none;" id="city_error">请选择城市</label>
                                	</span>
                                <input type="hidden" value="" id="cityVal" name="hosInf.countries" />
                            	</c:if>
                                <c:if test="${!empty hosInf && hosInf.countries!='' }">
                                	${hosInf.countries }
                                </c:if>
                            </p>
                            <div class="clearfix"></div>


                            <input type="text" class="ml100" name="hosInf.address" value="${hosInf.address }" id="hospital_address" placeholder="请选择并填写医院地址" maxlength="250">
                            <label class="enroll_error_hint" style="display: none;" id="hospital_address_error">请填写医院地址</label>
                            <input type="hidden" id="coords_x" name="hosInf.coords_x" value="${hospitalInformation.coords_x }">
						<input type="hidden" id="coords_y" name="hosInf.coords_y" value="${hospitalInformation.coords_y }">
						<input type="button" id="coords_button" value="选取坐标" style="background: #CCC" onclick="openBaiduMap();"/>
                        </div>
                        <div class="enroll_pbox">
                            <span><em>*</em>联络邮箱</span>
                            <input type="text" class="" name="hosInf.email" value="${hosInf.email }" id="email" placeholder="请填写常用邮箱地址，以便收取审核结果" maxlength="100">
                            <label class="enroll_error_hint" style="display: none;" id="email_error">请填邮箱</label>
                        </div>
                        <div class="enroll_pbox">
                            <span><em>&nbsp;</em>医院网址</span>
                            <input type="text" class="" name="hosInf.url" value="${hosInf.url}" id="weblink" placeholder="请填写医院官网地址" maxlength="100">

                        </div>
                        <div class="enroll_pbox">
                            <span><em>*</em>资料上传</span>
                            <div class="datum_t">
                                <span>说明：</span>
                                <p>1.为了确保平台合作机构的合法性，请您协助我们提交相关扫描资料</p>
                                <p> 2.上传文件格式支持JPG、JPEG、PNG, 每张图片文件大小不超过2M。</p>
                            </div>
                            <div class="upload_box">
                                <ul>
                                	<c:set var="imgs" value="${fn:split(account.img,',') }"></c:set>
                                    <li class="upload_put">
                                        <p class="put_bg" id="img1Box">
                                        	<c:choose>
                                        		<c:when test="${fn:length(imgs) >0 && imgs[0]!=''}">
                                        			<img src="upload${imgs[0] }"/>
                                        		</c:when>
                                        		<c:otherwise>
                                        		<span>请上传</span><span>营业执照副本</span><span>扫描图片</span>
                                        		</c:otherwise>
                                        	</c:choose>
                                            
                                        </p>
                                        <div id="img1up" class="uploadify" style="height: 30px; width: 120px;">
                                        <div id="img1up-button" class="uploadify-button " style="height: 30px; line-height: 30px; width: 120px;">
                                        <span class="uploadify-button-text">浏览上传</span>
                                        </div></div><div id="img1up-queue" class="uploadify-queue"></div>
                                        <p id="img1Error" class="put_error_hint" style="display: none">请上传营业执照扫描文件</p>
                                    </li>
                                    <li class="sample">
                                        <span class="sample_shade"></span>
                                        <img src="assets/images/1.jpg" alt="">
                                        <span class="btn_sample">样例</span>
                                         <input type="hidden" name="hospitalAccount.img" value="${imgs[1]}" id="img1" />
                                    </li>
                                    <li class="upload_put">
                                        <p class="put_bg" id="img2Box">
                                        	<c:choose>
                                        		<c:when test="${fn:length(imgs) >1 }">
                                        			<img src="upload${imgs[1] }"/>
                                        		</c:when>
                                        		<c:otherwise>
                                        		<span>请上传</span><span>营业执照副本</span><span>扫描图片</span>
                                        		</c:otherwise>
                                        	</c:choose>
                                        	
                                           
                                        </p>
                                        <div id="img2up" class="uploadify" style="height: 30px; width: 120px;"><div id="img2up-button" class="uploadify-button " style="height: 30px; line-height: 30px; width: 120px;"><span class="uploadify-button-text">浏览上传</span></div></div><div id="img2up-queue" class="uploadify-queue"></div>
                                        <p id="img2Error" class="put_error_hint" style="display: none">请上传医院机构资质文件</p>
                                    </li>
                                    <li class="sample">
                                        <span class="sample_shade"></span>
                                        <img src="assets/images/6.jpg" alt="">
                                        <span class="btn_sample">样例</span>
                                        <input type="hidden" name="hospitalAccount.img" value="${imgs[1]}" id="img2" />
                                    </li>
                                    
                                </ul>

                            </div>
                            <div class="btn_enroll_k">
                                <input type="button" value="上一步" class="input_green" onclick="javascript:history.go(-1);">
                                <input type="button" value="确认提交" class="input_green ml40" onclick="ToSubmit();">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer class="footer_box">北京漾世代科技有限公司     京ICP备16003557号</footer>
    
    <script type="text/javascript">
        $(document).ready(function () {
        	//调用联动
        	$(window).selectCity({
        	province : '.province',
        	city : '.city',
        	value :'',
        	callback : function(indexArr){
        		$("#cityVal").val(provinceArr[indexArr[0]]+","+cityArr[indexArr[0]][indexArr[1]]);
        	}

        	});

         
        });
        $("#hospital_name").blur(function () {
            if ($(this).val() != '') {
                $.ajax({
                    type: "post",
                    url: "hospital/account_checkName",
                    data: {name: $(this).val()},
                    success: function (data) {
                        if (data == "exist") {
                            $("#hospital_name_error").html('此医院已注册过').show();
                        }

                    }
                });
            }
        });
        $("#accounts").blur(function () {
            if ($(this).val() != '') {
                $.ajax({
                    type: "post",
                    url: "hospital/account_checkName",
                    data: {accounts: $(this).val()},
                    success: function (data) {
                        if (data == "exist") {
                            $("#accounts_error").html('此帐号已被使用').show();
                        }

                    }
                });
            }
        });
		$.each($(".uploadify"),function(i,v){
			$(this).uploadify({
				'auto': true, //关闭自动上传
	            'removeTimeout': 1, //文件队列上传完成1秒后删除
	            'swf': 'assets/js/uploadify/uploadify.swf',
	            'uploader': 'up_img',
	            'method': 'post', //方法，服务端可以用$_POST数组获取数据
	            'buttonText': '浏览上传', //设置按钮文本
	            'multi': false, //允许同时上传多张图片
	            'fileTypeDesc': '请选择图片文件', //只允许上传图像
	            'fileTypeDesc': '请选择图片文件', //只允许上传图像
	                    'fileTypeExts': '*.jpg;*.png;*.jpeg', //限制允许上传的图片后缀
	            'fileSizeLimit': 2048,
	            'queueSizeLimit': 1,
	            'progressData': 'speed',
	            //  'fileSizeLimit' : '2M',//限制上传的图片不得超过200KB
	            'onUploadError': function (file, errorCode, errorMsg, errorString) {

	            },
	            'onSelectError': function (file, errorCode, errorMsg) {
	                if (errorCode == '-110') {
	                    alert("文件太大，请上传小于2M的图片");
	                } else {
	                    alert("上传失败，请重试");
	                }
	            },
	            'onUploadSuccess': function (file, data, response) {//每次成功上传后执行的回调函数，从服务端返回数据到前端
	                if (data == "-1") {

	                } else {
	                    $("#img"+(i+1)+"Box").html('<img src="upload' + data + '"/>');
	                    $("#img"+(i+1)).val(data);
	                    $("#img"+(i+1)+"Box").removeClass('put_error_bg');
	                    $("#img"+(i+1)+"Error").hide();
	                }

	            }
	        });
		});
        
        
        function ToSubmit() {
            error = true;
            hAccounts();
            Hname();
            Cname();
            Cpassword();
            Province();
            Email();
            Img1();
            Img2();
            if (error) {
                $("#form").submit();
            } else {
                return false;
            }
        }
        var error = true;
        var name_check = /^([\u4E00-\u9FA5a-zA-Z0-9])+$/;

        function Hname() {
            if ($("#hospital_name").val() == '') {
                $("#hospital_name_error").html('请填写营业执照上的名称').show();
                error = false;
            } else {

                if (!name_check.test($("#hospital_name").val())) {
                    $("#hospital_name_error").html('填写错误').show();
                    error = false;
                } else {
                    $.ajax({
                        type: "post",
                        url: "account_checkName",
                        data: {name: $("#hospital_name").val(),},
                        success: function (data) {
                            if (data == "exist") {
                                $("#hospital_name_error").html('此医院已注册过').show();
                                error = false;
                            }
                        }
                    });
                }
            }
        }
        $("#hospital_name").focus(function () {
            $("#hospital_name_error").html('请填写营业执照上的名称').hide();
        })
        
		function hAccounts(){
        	if ($("#accounts").val() == '') {
                $("#accounts_error").html('请填写账号').show();
                error = false;
            }else {
                if (!name_check.test($("#contact_name").val())) {
                    $("#accounts_error").html('填写错误').show();
                    error = false;
                }
            }
        }
        $("#accounts").focus(function () {
            $("#accounts_error").html('').hide();
        })
        function Cname() {
            if ($("#contact_name").val() == '') {
                $("#contact_name_error").html('请填写联系人姓名').show();
                error = false;
            } else {
                if (!name_check.test($("#contact_name").val())) {
                    $("#contact_name_error").html('填写错误').show();
                    error = false;
                }
            }
        }
        $("#contact_name").focus(function () {
            $("#contact_name_error").html('').hide();
        });
        function Cpassword() {

            if ($("#password").val() == '') {
                $("#password_error").html('请填写密码').show();
                error = false;
            } 
            
        }
        $("#password").focus(function () {
            $("#password_error").html('').hide();
        });
        
        function Province() {
            if ($("#cityVal").val() == '') {
                $("#provice_error").html('请选择省').show();
                error = false;
            }
        }
		$("#provice").click(function(){
			 $("#provice_error").html('').hide();	
		});
			
       
        function Address() {
            if ($("#hospital_address").val() == '') {
                $("#hospital_address_error").html('请填写详细地址').show();
                error = false;
            }
        }
        function Email() {
            if ($("#email").val() == '') {
                $("#email_error").html('请填写邮箱').show();
                error = false;
            } else {
                var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
                if (!re.test($("#email").val())) {
                    $("#email_error").html('请填写正确的邮箱').show();
                    error = false;
                }
            }
        }
        $("#email").focus(function () {
            $("#email_error").html('').hide();
        })
        function Img1() {
            if ($("#img1").val() == '') {
                $("#img1Box").addClass('put_error_bg').html('<span>请上传</span><span>营业执照副本</span><span>扫描图片</span>');
                $("#img1Error").show();
                error = false;
            }
        }
        function Img2() {
            if ($("#img2").val() == '') {
                $("#img2Box").addClass('put_error_bg').html('<span>请上传</span><span>医疗机构资质</span><span>扫描图片</span>');
                $("#img2Error").show();
                error = false;
            }
        }
        
        function openBaiduMap(){
			//TODO 地址传入无效
			var x = $('#coords_x').val();
			var y = $('#coords_y').val();
			var address = encodeURI($('#address').val());
			console.info(encodeURI(address));
			layer.open({
				  type: 2,
				  title: '点击选取坐标',
				  shadeClose: true,
				  shade: 0.8,
				  area: ['680px', '500px'],
				  //offset: ['50px', '50px'],
				  content: 'showMap?x='+x+'&y='+y
			});
		}
    </script>






</body></html>