<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>

</head>
<body style="background:transparent;">
 <!--right Start-->
 	<form id="cform" action="${ctx }/hospital/consultant_input" method="post" onsubmit="return checkSubmit();" >
        <input type="hidden" name="id" value="${consultant.id }" />
        <input type="hidden" name="consultant.state" value="${consultant.state }" />
        <div class="bwh_crumbs">当前位置：<a href="#" title="咨询师管理">咨询师管理</a><em>&gt;</em>创建咨询师</div>
        <div class="tabBox">
            <div class="found_box">
                <h1 class="found_t">基本信息</h1>
                <ul class="found_ctas">
                    <li>
                        <span class="found_head_name lh124"><em class="icon_vereist">*</em>头像</span>
                        <span class="found_head">
                        <c:if test="${empty consultant.photo || consultant.photo ==''}">
                        	<img style="border-radius: 62px;" id="conPhoto" src="${ctx }/assets/images/head_bg.png">
                        </c:if>
                        <c:if test="${! empty consultant.photo &&consultant.photo !='' }">
                        	<img style="border-radius: 62px;" id="conPhoto" src="${ctx }/upload${consultant.photo}">
                        </c:if>
                        </span>
                        <div class="found_other">
                            <p><em>说明：</em>1.请上传真实照片以提升咨询师可信度；</p>
                            <p class="pound_state">3.上传照片格式支持JPG、JPEG、PNG；</p>
                            <p class="pound_state">4.上传照片文件大小不超过2M</p>
                            <div id="uploadImg" class="uploadify" style="height: 30px; width: 120px;">
			               <!--  <div id="uploadImg-button" class="uploadify-button " style="height: 30px; line-height: 30px; width: 120px;">
			                <span class="uploadify-button-text">浏览上传</span>
			                </div> -->
			                </div>
			                <input type="hidden"  id="conPhotoVal" name="consultant.photo" value="${consultant.photo }"/>
                            <!-- <a class="load_head" title="上传头像" href="javascript:showPop('photo','photo');">上传头像</a> -->
                        </div>
                    </li>
                    <li>
                        <span class="found_head_name"><em class="icon_vereist">*</em>姓名</span>
                        <div class="found_right_cont">
                        	<input class="w148" name="consultant.name" value="${consultant.name }" type="text" placeholder="请输入姓名">
                        </div>
                    </li>
                    <li>
                        <span class="found_head_name">&nbsp;&nbsp;&nbsp;&nbsp;性别</span>
                        <label class="radio-inline">
                            <input type="radio" name="consultant.sex" id="" checked="checked" value="1" <c:if test="${consultant.sex==1}">checked='checked'</c:if>>男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="consultant.sex" id="" value="0" <c:if test="${consultant.sex==0}">checked='checked'</c:if>>女
                        </label>
                    </li>
                    <li>
                        <span class="found_head_name"><em class="icon_vereist">*</em>手机号</span>
                        <div class="found_right_cont">
                        	<c:if test="${empty consultant.id || consultant.id=='' }">
                        		<input class="w418" type="text" id="phoneVal" name="consultant.phone" placeholder="请输入手机号码" value="${consultant.phone }">
                        	</c:if>
                        	<c:if test="${!empty consultant.id&&consultant.id!='' }">
                        		<span class="found_head_name">${consultant.phone }</span>
                        		<input type="hidden" name="consultant.phone" id="phoneVal"  value="${consultant.phone }">
                        	</c:if>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="btn_tab"><input value="保存" class="input_green mr20" type="submit"></div>
		<!--right End-->
<script type="text/javascript" src="${ctx}/assets/js/hospital/cutImage.js"></script>
<script>

$().ready(function(){
	$("#cutPhoto").on("load",function(){
		var width = $("#cutPhoto").eq(0).width();
		var height = $("#cutPhoto").eq(0).height();
		console.log(width);
		console.log(height);
		var max = width>height?"1":"2";
		console.log(max);
		if(max=="1"){
			$("#cutPhoto").eq(0).width("450px");
			$("#cutPhoto").eq(0).height((height/width*450)+"px");	
		}else{
			$("#cutPhoto").eq(0).width("width/height*450)"+"px");
			$("#cutPhoto").eq(0).height("450px");
		}
	});
});
function cut_submit(){ Jcrop_cut_submit("conPhoto","conPhotoVal",false); }
function checkSubmit() {
	 if($("#conPhotoVal").val()==''){
		 alert("请上传头像");
		 return false;
	 }

	function checkPhone(tel) {
	        var reg = /^1[0-9][0-9]\d{8}$/;
	        if (reg.test(tel)) {
	            return true;
	        } else {
	            return false;
	        }
	        ;
	}
	
    var phone_num = $('#phoneVal').val();
    if (!checkPhone(phone_num)) {
        alert('请填写正确的手机号码');
        return false;
    }

    var zxs_name = $('#conName').val();
    if (zxs_name == '') {
        alert('请填写咨询师姓名');
        return false;
    }
    return true;
}
function showPop(name, input_name) {
    $('#toup').show();
    $('.popup_bg').show();
    $('#pushToInput').attr('pushTo', name);
    $('#pushToInput').attr('inputTo', input_name);
}
function closePop() {
    $('.popup_box').hide();
    $('.popup_bg').hide();
    $('#pushToInput').attr('pushTo', '');
    $('#pushToInput').attr('inputTo', '');
    $('#pushToInput').attr('imgSrc', '');

}

	$('#uploadImg').uploadify({
		'auto': true, //关闭自动上传
		'removeTimeout': 1, //文件队列上传完成1秒后删除
		'swf': '../assets/js/uploadify/uploadify.swf',
		'uploader': '../up_cutImgUpload',
		'method': 'post', //方法，服务端可以用$_POST数组获取数据
		'buttonText': '上传图片', //设置按钮文本
		'multi': false, //允许同时上传多张图片
		'fileTypeDesc': '请选择图片文件', //只允许上传图像
		'fileTypeExts': '*.jpg;*.png;*.jpeg', //限制允许上传的图片后缀
		'queueSizeLimit': 1,
		'fileSizeLimit': 2048,
		'width':120,
		'progressData': 'speed',
		'formData': {},
		'onSelect': function (event, queueId, fileObj) {
		imgSelect = layer.load(1, {shade: [0.1, '#fff']});
		},
		'onUploadError': function (file, errorCode, errorMsg, errorString) {
		},
		'onSelectError': function (file, errorCode, errorMsg) {
		if (errorCode == '-110') {
			layer.alert("文件太大，请上传小于2M的图片", {title: false, closeBtn: false});
		} else {
			layer.alert("上传失败，请重试", {title: false, closeBtn: false});
		}
		},
		'onUploadSuccess': function (file, data, response) {//每次成功上传后执行的回调函数，从服务端返回数据到前端
			if(data=='-1'){
			layer.alert("您好，请上传宽度不小于50像素，高度不小于50像素的图片。", {title: false, closeBtn: false});
			layer.close(imgSelect);
		}else {
			layer.closeAll();
			Jcrop_init(data,300,250);
		}
		}
		});
	
	
/*	function upCut(){
		layer.open({
			type : 1,
			title : false,
			closeBtn : false,
			content : $('#upCutDiv')
		});
	}
	function updateCoords(c){
		$(".jcrop-keymgr").hide();
		$('#x').val(c.x);
	    $('#y').val(c.y);
	    $('#w').val(c.w);
	    $('#h').val(c.h);
	    $('#rh').val($(".jcrop-holder:first").css('height'));
	    $('#rw').val($(".jcrop-holder:first").css('width'));
		
	}

	function subCut(){
		
		if(x!=''&&y!=''&&w!=''){
			$.ajax({
				url:"../up_cut",
				type:"POST",
				data:$("#cform").serialize(),
				success:function(data){
					if("success" ==data){
						layer.closeAll();
						$("#conPhotoVal").val($("#photo").val());
						$("#conPhoto").attr("src","../upload"+$("#photo").val());
					}else{
						layer.alert("操作失败");
					}
				}
				
			});
		}
		
	}*/
</script>

</body>
</html>