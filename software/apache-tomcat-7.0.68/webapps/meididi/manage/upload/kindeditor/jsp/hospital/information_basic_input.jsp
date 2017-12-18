<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>

</head>
<body style="background:transparent;">
 <div class="tabBox">
 <!--right Start-->
 	<form id="hform" action="${ctx }/hospital/information_basic" method="post" onsubmit='return checkSubmit();'>
        <input type="hidden" name="hospitalInformation.id"  value="${information.id }"/>
        <input type="hidden" name="hospitalInformation.state"  value="${information.state }"/>
        <input type="hidden" name="hospitalInformation.accountId"  value="${information.accountId }"/>
        <div class="bwh_crumbs">
            <h1>完善医院信息，为咨询师提供更好的咨询信息。</h1>
            当前位置：<a href="#" title="医院资料">医院资料</a><em>&gt;</em><a href="#" title="医院信息">医院信息</a><em>&gt;</em>基础信息
        </div>
        <div class="tabBox">
            <ul class="tabNav">
                <li class="now"><a href="${ctx }/hospital/information_basic">基础信息</a></li>
                <li><a href="${ctx }/hospital/information_tips">标签信息</a></li>
                <li><a href="${ctx }/hospital/information_teams">医疗团队</a></li>
            </ul>
            <div class="tabCont base_infor" style="display:block;">
                <p class="head_pic">
                    <c:if test="${information.logo!=null&&information.logo!='' }">
                		<img id="logoView" src="${ctx }/upload${information.logo}" onerror="this.src='${ctx }/assets/images/default_face.gif'" />
                	</c:if>
                	<c:if test="${information.logo==null||information.logo=='' }">
                		<img id="logoView" src="${ctx }/assets/images/default_face.gif" />
                	</c:if>
						
                    <input type="hidden" name="hospitalInformation.logo" id="logoImg" value="${information.logo }" />
                    <a href="javascript:;" title="上传logo" id="uploadImg" class="load_head" style="margin-bottom:0px;">上传logo</a>
                    
                </p>
                <div class="basis_cont">
                    <ul>
                        <li>
                            <span class="basis_name"><em></em>医院名称</span>
                            <p>${information.name }</p>
                            <input type="hidden" name="hospitalInformation.name" value="${information.name }"/>
                        </li>
                        <li>
                            <span class="basis_name"><em>*</em>医院联络人</span>
                            <p>
                            	${information.contacts }
                                <input type="hidden" name="hospitalInformation.contacts" value="${information.contacts }" >
                                
                            </p>
                        </li>
                        <li>
                            <span class="basis_name"><em>*</em>手机号</span>
                            <p>
                            	${information.phone }
                                <input type="hidden"  name="hospitalInformation.phone" value="${information.phone }">
                            </p>
                        </li>
                        <li>
                            <span class="basis_name"><em>*</em>医院地址</span>
                            <p>${information.countries}${information.address }</p>
                            <input type="hidden" name="hospitalInformation.countries" value="${information.countries}" />
                            <input type="hidden" name="hospitalInformation.address" value="${information.address }" />
                        </li>
                        <li>
                            <span class="basis_name"><em>*</em>联络邮箱</span>
                            <p>${information.email }</p>
                            <input name="hospitalInformation.email" value="${information.email}" type="hidden" />
                        </li>
                        <li>
                            <span class="basis_name"><em>*</em>医院网址</span>
                            <p><input name="hospitalInformation.url" value="${information.url}" type="text" placeholder="" class="w418"></p>
                        </li>
                        <li>
                            <span class="basis_name tt"><em>*</em>医院介绍</span>
                            <p><textarea name="hospitalInformation.information" class="w418" rows="5" placeholder="请填写医院介绍，支持中文">${information.information}</textarea></p>
                        </li>
                        <li>
                            <span class="basis_name tt"><em>*</em></span>
                            <dl class="uploading_img_dl">
                            <c:set var="imgLength" value="0"></c:set>
								<c:if test="${!empty information.imgs}">
									<c:set var="imgs" value="${fn:split(information.imgs,',')}"></c:set>
									<c:set var="imgLength" value="${fn:length(imgs)}"></c:set>
								</c:if>
                        <c:forEach var="num" begin="0" end="4">
						<dd style="position: relative;">
						
						<c:if test="${imgLength > num }" >
							<img id="iconPreview${num }" src="${ctx}/upload${imgs[num] }" 
								onerror="this.src='${ctx}/assets/images/figure.png'">
						</c:if>
						<c:if test="${imgLength <= num}" >
								<img id="iconPreview${num }" src="${ctx}/assets/images/figure.png">
							
						</c:if>
						
						<div class="zt_basic_btn">
							<div id="uploadIcon${num }" class="uploadify" style="height: 30px; width: 120px;">
							</div>
							
							<c:if test="${imgLength > num }" >
							<input type="hidden" name="hospitalInformation.imgs" 
									value="${imgs[num] }" id="icon_val${num }">
							</c:if>
							<c:if test="${imgLength <= num}" >
									<input type="hidden" name="hospitalInformation.imgs" 
										 id="icon_val${num }">
							</c:if>
							
							
						</div>
					</dd>
				</c:forEach>        
                            </dl>
                        </li>
                    </ul>
                    <p style="width: 100%; font-size: 10px; color: red; padding-left: 21px; text-align: left;">请上传宽度不小于50像素，高度不小于50像素的图片。</p>
                </div>
            </div>
        </div>
        <div class="btn_tab">
        	<input value="保存信息" class="input_green mr20" type="submit" >
        	<input value="返回" onclick="window.location.href = 'information_basic" class="input_green" type="button"></div>
    </form>
</div>
<script type="text/javascript" src="${ctx}/assets/js/hospital/cutImage.js"></script>
<!--right End-->
<script type="text/javascript">
function cut_submit(){
	Jcrop_cut_submit("logoView","logoImg",false);
}
$("#uploadImg").uploadify({
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

var uploadify =  $(".uploadify");
$.each(uploadify,function(i,v){
	var theImg = $(v);
	$('#uploadIcon'+i).uploadify({
		'auto': true, //关闭自动上传
		'removeTimeout': 1, //文件队列上传完成1秒后删除
		'swf': '../assets/js/uploadify/uploadify.swf',
		'uploader': '../up_img',
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
				layer.close(imgSelect);
				theImg.parent().prev().attr('src',"../upload"+data);
				$("#iconPreview"+i).attr('src',"../upload"+data);
				$('#icon_val'+i+',#checkPic').val(data);
				}
			}
		});
});
</script>

</body>
</html>