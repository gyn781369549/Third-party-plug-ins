<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
 <style>
    .popup_box{margin-top:-100px;top:22%}
    .popup_t{height:30px;line-height:30px;font-size:16px;}
    .push_preview{margin-top:10px;}
    .push_preview h1{font-size:14px;font-weight:300;line-height:20px}
    .push_preview h2{font-size:13px;line-height:20px;}
    .popup_btn{margin:5px 0}
    .popup_btn input[type="button"]{height: 30px;line-height: 30px;}
    .push_tel_box{margin-top: 5px;}
    .push_tel{overflow-y:hidden}
</style>
</head>
<body style="background:transparent;">
<form action="${ctx }/hospital/information_teams" id="teamForm" method="post">
	<input type="hidden" name="id" value="${information.id }" />
	<input type="hidden" id="delTeamIds" name="delTeamIds" value="" />
    
        <div class="bwh_crumbs">
            <h1>完善医院信息，为咨询师提供更好的咨询信息。</h1>
            当前位置：<a href="#" title="医院资料">医院资料</a><em>&gt;</em><a href="#" title="医院信息">医院信息</a><em>&gt;</em>医疗团队
        </div>
        <div class="tabBox">
            <ul class="tabNav">
               <li ><a href="${ctx }/hospital/information_basic">基础信息</a></li>
                <li><a href="${ctx }/hospital/information_tips">标签信息</a></li>
                <li class="now"><a href="${ctx }/hospital/information_teams">医疗团队</a></li>
            </ul>
            <div class="tabCont dmat_box" style="display:block;">
                <!--编辑-->
                <div class="dmat_team_intro">
                    <h1><em class="icon_vereist">*</em>医疗团队介绍</h1>
                    <textarea rows="5" name="teamInf" class="edit" placeholder="请填写500字以内医疗团队介绍信息。">${information.teamInf }</textarea>
                </div>
                <div class="dmat_team_intro">
                    <h1><em class="icon_vereist">*</em>医疗精英信息</h1>
                    <ul class="elite_infor">
                    	<c:if test="${fn:length(teams)>0 }">
                    		<c:forEach var="team" items="${teams }" varStatus="status">
                    		<li teamid=${team.id }>
                    			<input type="hidden" name="teamId" value="${team.id }" />
                                <div class="elite_pic_intro">
                                    <p class="elite_pic" style="position: relative;">
                                    	<c:if test="${team.photo!=null&&team.photo!='' }">
                                    		<img id="teamEx${team.id }" src="${ctx }/upload${team.photo}" />
                                    	</c:if>
                                        <c:if test="${team.photo==null||team.photo=='' }">
                                    		<img id="teamEx${team.id }" src="${ctx }/assets/images/head_bg.png" />
                                    	</c:if>
                                        <input  type="hidden" class="teamValEx${team.id }" id="teamValEx${status.index}" name="photo" value="${team.photo}" />
                                        <input id="existUpload${status.index }" class="uploadify" />
                                    </p>
                                    <p class="elite_zishu">
                                    <textarea class="elite_jianjie" name="information" placeholder="请填写140字以内医生背景介绍。">${team.information }</textarea></p>
                                </div>
                                <p class="elite_name">
                                	<input type="text" name="name" value="${team.name }" placeholder="请填写医生姓名。">
                                </p>
                                <p class="btn_elite_del" t_id="${team.id}"><input value="删除此精英信息" class="input_green" type="button"></p>
                            </li>
                    		</c:forEach>
                    	</c:if>
                               
                        
                        <li class="ico_elite_add">
                            <a href="javascript:;" onclick="addZxs()"><img src="${ctx }/assets/images/ico_elite_add.png" alt="" /><span>添加新精英信息</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn_tab">
            <input value="保存" class="input_green mr20" type="button" id="teamSub">
            <input value="返回" class="input_green mr20" type="button" onclick="window.history.go(-1);">
        </div>
</form>
<!--right End-->

<!--上传LOGO start-->
<div class="popup_box"  style="display:none;top:50%;">
    <cite class="popup_t">上传头像</cite>
    <div class="popup_cont">
        <div class="upload_logo_pic">
            <p class="logo_cont">
                <img id="uploadPreview"  src="${ctx }/assets/images/head_bg.png" alt="" style='border-radius: 56px;'>
                <a id="uploadImg" href="#" title="上传logo">上传logo</a>
            </p>
            <div class="logo_hints">
                <blockquote>上传头像图片支持JPG、JPEG、PNG格式</blockquote>
                <blockquote>上传头像图片大小不超过2M</blockquote>
            </div>
        </div>
        <p class="popup_btn">
            <span class="popup_btn_p">
                <input id="pushToInput" pushTo="" imgSrc="" type="button" value="确定" class="input_green mr20" />
                <input onclick='closePop()' type="button" value="取消" class="input_green" />
            </span>
        </p>
    </div>
</div>
<script type="text/javascript" src="${ctx}/assets/js/hospital/cutImage.js"></script>
<script type="text/javascript">
var focusId;
function cut_submit(){ 
	var teamPreviewId = $("#"+focusId).parent().parent().find("img:first").attr("id");
	var teamValId = $("#"+focusId).parent().parent().find("input[name='photo']:first").attr("id");
	
	Jcrop_cut_submit(teamPreviewId,teamValId,false);
	
	}
/* function cut_submit(){
	//Jcrop_cut_submit("uploadPreview","pushToInput",false);
	$.ajax({
		url:"../up_cut",
		type:"POST",
		data:$("#cutForm").serialize(),
		success:function(data){
			if("success" ==data){
				$("#uploadPreview").attr("src","../upload"+$("#photo").val()+"?"+new Date().getTime());
				$("#pushToInput").attr("imgsrc",$("#photo").val());
				//$("#pushToInput").attr("inputTo",$("#photo").val());
				//$("#cover").val($("#photo").val());
				layer.close(Jcrop_cut_layer);
			}else{
				layer.alert("操作失败");
			}
		}
		
	});
} */
$(document).ready(function () {
	
	function checkPhone(){
		var fla = true;
		var photo = $("input[name='photo']");
		$.each(photo,function(i,v){
			if($(v).val()==''){
				fla = false;
				layer.alert("请上传头像");
				return false;
			}
		});
		return fla;
	}
	function checkInformation(){
		var inf = $("input[name='information']");
		var fla = true;
		$.each(inf,function(i,v){
			if($(v).val()==''){
				layer.alert("请输入简介");
				fla = false;
				return false;
			}
			if($(v).val().length>200){
				layer.alert("请输入不多于200字的简介");
				fla = false;
				return false;
			}
		});
		return fla;
	}
	function checkName(){
		var inf = $("input[name='name']");
		var fla = true;
		$.each(inf,function(i,v){
			if($(v).val()==''){
				layer.alert("请输入姓名");
				fla = false;
				return false;
			}
			if($(v).val().length>4){
				layer.alert("姓名不能多于4");
				fla = false;
				return false;
			}
		});
		return fla;
	}
	$("#teamSub").click(function(){
		if(checkInformation()&&checkName()&&checkPhone()){
			$("#teamForm").submit();
		}
		
	});

	
	
	$.each($(".uploadify"),function(i,v){
	var id = $(v).attr("id");
    $("#"+id).uploadify({
        'auto': true, //关闭自动上传
        'removeTimeout': 1, //文件队列上传完成1秒后删除
        'swf': '../assets/js/uploadify/uploadify.swf',
        'uploader': '../up_cutImgUpload',
        'method': 'post', //方法，服务端可以用$_POST数组获取数据
        'buttonText': '浏览上传', //设置按钮文本
        'multi': false, //允许同时上传多张图片
        'fileTypeDesc': '请选择图片文件', //只允许上传图像
        'fileTypeExts': '*.jpg;*.png;*.jpeg', //限制允许上传的图片后缀
        'fileSizeLimit': 2048,
        'queueSizeLimit': 1,
        'progressData': 'speed',
        'formData': {},
        'onUploadError': function (file, errorCode, errorMsg, errorString) {
        },
        'onSelect': function (event, queueId, fileObj) {
        	focusId = this.movieName;
            imgSelect = layer.load(1, {shade: [0.1, '#fff']});
        },
        'onSelectError': function (file, errorCode, errorMsg) {
             if (errorCode == '-110') {
                        layer.alert("文件太大，请上传小于2M的图片", {title: false, closeBtn: false});
                    }else{
                        layer.alert("上传失败，请重试", {title: false, closeBtn: false});
                    }
        },
        'onUploadSuccess': function (file, data, response) {//每次成功上传后执行的回调函数，从服务端返回数据到前端
            if(data=='-1'){
              layer.close(imgSelect);
              layer.alert("操作失败");
            } else {
                $('.popup_bg').hide();
                layer.close(imgSelect);
                Jcrop_init(data,null,null);
            }
        }
    });
	});
    $('#pushToInput').click(function () {
        var imgSrc = $(this).attr('imgSrc');
        var pushTo = $(this).attr('pushTo');
        var inputTo = $(this).attr('inputTo');
        if(imgSrc!=''){
            $('#' + pushTo).attr('src', "../upload"+imgSrc+"?"+new Date().getTime());
            $('.'+inputTo).val(imgSrc);
        }
        closePop();
    });

    $('.btn_elite_del').live('click', function () {
        var li_parent = $(this).parent('li');
        if (li_parent.attr('isnew') == 1) {
        } else {
            var team_id = li_parent.attr('teamid');
            $('#meiddRight').before('<input type="hidden" name="del_ids[]" value="' + team_id + '" />');
        }
        li_parent.remove();
        var id = $(this).attr("t_id");
        console.log(id);
    	var delIds = $("#delTeamIds");
    	if(id.length>0){
    		delIds.val(delIds.val()+id+",");
    	}
    	
    });

});
function showPop(name, input_name, img) {
    $('.popup_box').show();
    $('.popup_bg').show();
    $('#pushToInput').attr('pushTo', name);
    $('#pushToInput').attr('inputTo', input_name);
    $("#uploadPreview").attr('src', img);
}
function closePop() {
    $("#uploadPreview").attr('src', ' ');
    $('.popup_box').hide();
    $('.popup_bg').hide();
    $('#pushToInput').attr('pushTo', '');
    $('#pushToInput').attr('inputTo', '');
    $('#pushToInput').attr('imgSrc', '');

}
	var newZxsId = 1;
	function addZxs() {
		var html = '<li isnew=1><div class="elite_pic_intro"><p class="elite_pic" style="position: relative;"><img id="newteam-' + newZxsId + '" src="../assets/images/head_bg.png"  /><input  type="hidden" name="photo" class="newicon' + newZxsId + '" id="newIconVal'+newZxsId+'" value="" /><input id="newUpload'+newZxsId+'"  class="uploadify"/></p><p class="elite_zishu"><textarea class="elite_jianjie" name="information" placeholder="请填写140字以内医生背景介绍。"></textarea></p></div><p class="elite_name"><input type="text" name="name" value="" placeholder="请填写医生姓名。"></p><p class="btn_elite_del"><input value="删除此精英信息" class="input_green" type="button"></p></li>';
    	$('.ico_elite_add').before(html);
    	$.each($(".uploadify"),function(i,v){
    		var id = $(v).attr("id");
    	    $("#"+id).uploadify({
    	        'auto': true, //关闭自动上传
    	        'removeTimeout': 1, //文件队列上传完成1秒后删除
    	        'swf': '../assets/js/uploadify/uploadify.swf',
    	        'uploader': '../up_cutImgUpload',
    	        'method': 'post', //方法，服务端可以用$_POST数组获取数据
    	        'buttonText': '浏览上传', //设置按钮文本
    	        'multi': false, //允许同时上传多张图片
    	        'fileTypeDesc': '请选择图片文件', //只允许上传图像
    	        'fileTypeExts': '*.jpg;*.png;*.jpeg', //限制允许上传的图片后缀
    	        'fileSizeLimit': 2048,
    	        'queueSizeLimit': 1,
    	        'progressData': 'speed',
    	        'formData': {},
    	        'onUploadError': function (file, errorCode, errorMsg, errorString) {
    	        },
    	        'onSelect': function (event, queueId, fileObj) {
    	        	focusId = this.movieName;
    	            imgSelect = layer.load(1, {shade: [0.1, '#fff']});
    	        },
    	        'onSelectError': function (file, errorCode, errorMsg) {
    	             if (errorCode == '-110') {
    	                        layer.alert("文件太大，请上传小于2M的图片", {title: false, closeBtn: false});
    	                    }else{
    	                        layer.alert("上传失败，请重试", {title: false, closeBtn: false});
    	                    }
    	        },
    	        'onUploadSuccess': function (file, data, response) {//每次成功上传后执行的回调函数，从服务端返回数据到前端
    	            if(data=='-1'){
    	              layer.close(imgSelect);
    	            } else {
    	                $('.popup_bg').hide();
    	                layer.close(imgSelect);
    	                Jcrop_init(data,300,250)
    	            }
    	        }
    	    });
    	});
    newZxsId++;
	}
	
</script>
</body>
</html>