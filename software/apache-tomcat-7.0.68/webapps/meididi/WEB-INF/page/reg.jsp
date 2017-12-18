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
<meta name="renderer" content="webkit">
	<base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="assets/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="assets/css/print.css" media="print" />
	<link rel="stylesheet" type="text/css" href="assets/css/index/base.css"  />
	<link rel="stylesheet" type="text/css" href="assets/css/index/popup.css"  />
	<link rel="stylesheet" type="text/css" href="assets/css/main.css" />
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
    <script src="assets/js/hospital/reg.js"></script>
</head>
<body role="document">
    <div class="popup_bg" style="display: none;z-index: 1;"></div>
        <header class="enroll_header">
            <a href="javascript:;"  onclick="lxwmShow();" title="">联系我们</a>
            <div class="meidd_logo">
                <a href="#" title="美滴滴中国专业整形咨询平台">
                    <img src="assets/images/index_logo2.png" alt="">
                </a>
            </div>
        </header>
        <div class="enroll_cont">
            <div class="enroll_box">
                <h1>欢迎注册美滴滴中国专业整形咨询平台账号</h1>
                <div class="enroll_infor">
                    <p class="enroll_title enroll_1">
                        <span class="enroll_1_1">Step1&nbsp;身份认证</span>
                        <span class="enroll_1_2">Step2&nbsp;医院信息填写</span>
                        <span class="enroll_1_3">Step3&nbsp;提交</span>
                    </p>
                    <form class="enroll_form" action="" method="post" name="form1">
                        <div class="enroll_pbox">
                            <span><em>*</em>手机号</span>
                            <input type="text" class="" name="phone" value="" id="phone" placeholder="请填写手机号码">
                            <label class="enroll_error_hint" id="phone_error" style="display: none;"></label>
                        </div>
                        <div class="enroll_pbox">
                            <span><em>*</em>验证码</span>
                            <p class="enroll_validate">
                                <input type="text" class="w235" name="code" value="" id="code" placeholder="请填写验证码">
                                <input type="button" value="点击发送验证码" id="codeButton">
                            </p>
                            <label class="enroll_error_hint" id="code_error" style="display: none;"></label>
                        </div>
                        <div class="enroll_pbox checkbox">
                            <input type="checkbox" id="ischeck">我已经仔细阅读并同意<a href="agreement.html" title="">《美滴滴医疗美容聚合平台用户协议》</a>
                            <label class="enroll_error_hint p0 ml-20" style="display: none;" id="agreement">未选择</label>
                        </div>
                        <div class="btn_enroll_k">
                            <input class="input_green" name="tijiao" value="下一步" type="button" id="tijiao" onclick="next()">
        <!--可点击状态<input class="input_green" type="submit" value="下一步" onclick="next()">-->
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer class="footer_box">北京漾世代科技有限公司     京ICP备16003557号</footer>
    <script>

        $(function () {
            $('#codeButton').click(function () {
                var phone = $('#phone').val();
                if (phone == '') {
                    $("#phone_error").html('请填写手机号');
                    $("#phone_error").show();
                    return false;
                }
                
                if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){ 
                	$("#phone_error").html('请填写正确的手机号');
                    $("#phone_error").show(); 
                    return false; 
                } 
                
                $("#code_error").hide();
                $.ajax({//发送验证码
                    url: "api/phonecode",
                    type: 'POST',
                    timeout: 9000,
                    data: {phone: phone},
                    success: function (data) {
                        if (data == 0) {
                        	return true;
                        }
                    }
                });

                var count = 60;
                var countdown = setInterval(CountDown, 1000);

                function CountDown() {
                    $("#codeButton").attr("disabled", true);
                    $("#codeButton").attr("class", 'sent_code');
                    $("#codeButton").val("(" + count + ")重新发送验证码");

                    if (count == 0) {
                        $("#codeButton").val("点击发送验证码").removeAttr("disabled");
                        clearInterval(countdown);
                    }
                    count--;
                }
            })

        });

        $("#phone").blur(function () {
            var phone = $('#phone').val();
            if (phone == '') {
                $("#phone_error").html('请填写手机号');
                $("#phone_error").show();
                return false;
            }
           
           
        })
        
        $("#phone").focus(function () {
            $("#phone_error").hide();
            $("#phone_error").html('');

        })
        
       
       
        $(function () {

            $('input:checkbox').click(function () {
                this.blur();
                this.focus();
            });

            $("#ischeck").change(function () {
                if ($("input[type='checkbox']").is(':checked') == true) {
                    $("#agreement").hide();
                } else {
                    $("#agreement").show();
                }
            });
        });
        function codeInput() {
            var code = $("code").val();
            if (code = '') {
                HideNext();
            }
        }
        function HideNext() {
            $("#tijiao").attr('class', 'input_white');
            $("#tijiao").attr('style', "cursor:default");
        }
        function ShowNext() {
            $("#tijiao").attr('class', 'input_green');
            $("#tijiao").attr('style', "");
        }
        
        function next() {
            if ($("input[type='checkbox']").is(':checked') == false) {
                $("#agreement").show();
                return false;
            }
            if($('#phone').val()==''){
            	$("#phone_error").html('请输入手机号');
                $("#phone_error").show();
                return false;
            }

            var phone = $('#phone').val();
            var code = $('#code').val();
               if (code != '') {
                    $.ajax({
                        url: "account_reg",
                        type: 'POST',
                        timeout: 3000,
                        data: {phone: phone, code: code},
                        //data: {phone: phone},
                        success: function (data) {
                            if (data == "success") {
                                window.location.href = "account_regInf";
                            } else if (data == 'exist') {
                            	$("#phone_error").html("该手机号已被使用").show();
                            } else {
                                $("#code_error").html('验证码错误');
                                $("#code_error").show();
                                return false;
                            }

                        }
                    });
                } else {

                  $("#code_error").html('请填写验证码');
                    $("#code_error").show();
                    return false;
               }
        }
    </script>


</body></html>