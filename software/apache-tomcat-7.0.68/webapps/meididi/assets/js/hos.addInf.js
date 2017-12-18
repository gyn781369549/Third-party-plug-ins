$().ready(function() {

	$('#tabNav').children().click(function() {
		var id = $(this).attr('attr');
		$('.tabCont').hide();
		$('#' + id).show();
		$(this).siblings().removeClass('now');
		$(this).addClass('now');
	});

	$('#tabNav').children().each(function() {
		if (edited == null || edited == '') {
			edited = "basic";
		}
		if ($(this).attr('attr') === edited) {
			$(this).click();
			return false;
		}
	});
	//上传医院logo
	$('#upHosIcon').uploadify({
		'auto' : true, // 关闭自动上传
		'removeTimeout' : 1, // 文件队列上传完成1秒后删除
		'swf' : '../assets/js/uploadify/uploadify.swf',
		'uploader' : '../up_cutImgUpload',
		'method' : 'post', // 方法，服务端可以用$_POST数组获取数据
		'buttonText' : '上传图片', // 设置按钮文本
		'multi' : false, // 允许同时上传多张图片
		'fileTypeDesc' : '请选择图片文件', // 只允许上传图像
		'fileTypeExts' : '*.jpg;*.png;*.jpeg', // 限制允许上传的图片后缀
		'queueSizeLimit' : 1,
		'fileSizeLimit' : 2048,
		'progressData' : 'speed',
		'formData' : {},
		'onSelect' : function(event, queueId, fileObj) {
			imgSelect = layer.load(1, {
				shade : [ 0.1, '#fff' ]
			});
		},
		'onUploadError' : function(file, errorCode, errorMsg,
				errorString) {
		},
		'onSelectError' : function(file, errorCode, errorMsg) {
			if (errorCode == '-110') {
				layer.alert("文件太大，请上传小于2M的图片", {
					title : false,
					closeBtn : false
				});
			} else {
				layer.alert("上传失败，请重试", {
					title : false,
					closeBtn : false
				});
			}
		},
		'onUploadSuccess' : function(file, data, response) {// 每次成功上传后执行的回调函数，从服务端返回数据到前端
			
			if (data == '-1') {
				layer.alert("上传失败", {
					title : false,
					closeBtn : false
				});
				layer.close(imgSelect);
			} else {
				$('.popup_bg').hide();
	            layer.close(imgSelect);
	            Jcrop_init(data,null,null);
			}
		}
	});
	});
	
	
	$('.zt_del_icon').click(function() {
		var id = $(this).attr('item');
		$('#icon_val' + id).val('');
		$('#iconPreview' + id).attr('src', 'd');
		var empty = true;
		$('input[id^=icon_val]').each(function() {
			if ($(this).val() != '') {
				empty = false;
				return false;
			}
		});
		if (empty == true) {
			$('#checkPic').val('');
		}
	});
	
	var teamIcons = $(".teamIconUp");
	$.each(teamIcons, function(i, v) {
		var id = $(this).attr("id");
		var theImg = $(v);
		var preView = theImg.parent().prev();
		var val = theImg.parent().next();
		$("#"+id).uploadify({
			'auto' : true, // 关闭自动上传
			'removeTimeout' : 1, // 文件队列上传完成1秒后删除
			'swf' : '../assets/js/uploadify/uploadify.swf',
			'uploader' : '../up_img',
			'method' : 'post', // 方法，服务端可以用$_POST数组获取数据
			'buttonText' : '上传图片', // 设置按钮文本
			'multi' : false, // 允许同时上传多张图片
			'fileTypeDesc' : '请选择图片文件', // 只允许上传图像
			'fileTypeExts' : '*.jpg;*.png;*.jpeg', // 限制允许上传的图片后缀
			'queueSizeLimit' : 1,
			'fileSizeLimit' : 2048,
			'progressData' : 'speed',
			'formData' : {},
			'onSelect' : function(event, queueId, fileObj) {
				focusId = this.movieName;
				imgSelect = layer.load(1, {
					shade : [ 0.1, '#fff' ]
				});
			},
			'onUploadError' : function(file, errorCode, errorMsg, errorString) {
			},
			'onSelectError' : function(file, errorCode, errorMsg) {
				if (errorCode == '-110') {
					layer.alert("文件太大，请上传小于2M的图片", {
						title : false,
						closeBtn : false
					});
				} else {
					layer.alert("上传失败，请重试", {
						title : false,
						closeBtn : false
					});
				}
			},
			'onUploadSuccess' : function(file, data, response) {// 每次成功上传后执行的回调函数，从服务端返回数据到前端
				if (data == '-1') {
					layer.alert("您好，请上传宽度不小于50像素，高度不小于50像素的图片。", {
						title : false,
						closeBtn : false
					});
					layer.close(imgSelect);
				} else{
					layer.close(imgSelect);
					Jcrop_init(data,null,null);
					/*theImg.parent().prev().attr('src', "../upload" + data);
					$("#iconPreview" + i).attr('src', "../upload" + data);
					$('#icon_val' + i + ',#checkPic').val(data);*/
				}
			}
		});


	validator = $("#enterHosForm").validate({
		ignore : "",
		rules : {
			icon_val : {
				required : false,
			},
			hosName : {
				required : true,
			},

			address : {
				required : true,
			},
			email : {
				email : true,
			},
			url : {
				url : true,
			},
			information : {
				required : true,
			},
			checkPic : {
				required : false,
			},
			introduce : {
				maxlength : 500,
			},
		},
		messages : {
			icon_val : {
				required : "<span>医院logo不能为空</span>",
			},
			hosName : {
				required : "<span>医院名称不能为空</span>",
				remote : "<span>医院已经存在</span>",
			},
			province_id : {
				required : "<span>请选择省份</span>",
				min : "<span>请选择省份</span>",
			},
			city_id : {
				required : "<span>请选择城市</span>",
				min : "<span>请选择城市</span>",
			},
			address : {
				required : "<span>医院地址不能为空</span>",
			},
			contact_email : {
				email : "<span>联络邮箱格式不正确</span>",
			},
			weblink : {
				url : "<span>网址格式不正确</span>",
			},
			jieshao : {
				required : "<span>医院介绍不能为空</span>",
			},
			checkPic : {
				required : "<span>请至少上传一张图片</span>",
			},
			introduce : {
				maxlength : "<span>请填写500字以内医疗团队介绍</span>",
			},
		}
	});

});

// 标签相关JS----------------------------------------------------------------
var page = 0;
var totalPage = Math.ceil(16 / 12);
var baseUrl = '';
var label_cur = hospitalInformationTips.split(",");

function addTag(tag_id, tag_name) {
	// 禁止重复添加
	for ( var i in label_cur) {
		if (tag_id == label_cur[i]) {
			return;
		}
	}
	var tag_html = '<li p_id="' + tag_id
			+ '"><input type="hidden" name="tips" value="' + tag_id
			+ '" /><a href="#" title="' + tag_name + '">' + tag_name
			+ '</a><em class="ico_label_del">×</em></li>';
	label_cur.push(tag_id);
	$('#addTagsFlag').before(tag_html);
	$('li[p_id=' + tag_id + ']').addClass('now');
}

/**
 * 点击小X号，取消掉标签
 */
$('.ico_label_del').live('click', function() {
	$(this).parent().remove();
	var id = $(this).parent().attr('p_id');
	$('li[p_id=' + id + ']').removeClass('now');

	for ( var i in label_cur) {
		if (id == label_cur[i]) {
			label_cur[i] = 0;
		}
	}
});

function renderLi() {
	$('#label_ready').children().each(function() {
		var pid = $(this).attr('p_id');
		for ( var i in label_cur) {
			if (pid == label_cur[i]) {
				$(this).addClass('now');
			}
		}

	});
}

$(document).ready(function() {
	renderLi();
});

// 添加精英信息--------------------------------------------------------------
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
	
	
$('.btn_elite_del').live('click', function () {
	var li_parent = $(this).parent('li');
	li_parent.remove();
	var id = $(this).attr("t_id");
	var delIds = $("#delTeamIds");
	if(id.length>0){
		delIds.val(delIds.val()+id+",");
	}
	
	
});


var uploadify = $(".uploadify");
$.each(uploadify, function(i, v) {
	var theImg = $(v);

	$('#uploadIcon' + i).uploadify({
		'auto' : true, // 关闭自动上传
		'removeTimeout' : 1, // 文件队列上传完成1秒后删除
		'swf' : '../assets/js/uploadify/uploadify.swf',
		'uploader' : '../up_img',
		'method' : 'post', // 方法，服务端可以用$_POST数组获取数据
		'buttonText' : '上传图片', // 设置按钮文本
		'multi' : false, // 允许同时上传多张图片
		'fileTypeDesc' : '请选择图片文件', // 只允许上传图像
		'fileTypeExts' : '*.jpg;*.png;*.jpeg', // 限制允许上传的图片后缀
		'queueSizeLimit' : 1,
		'fileSizeLimit' : 2048,
		'progressData' : 'speed',
		'formData' : {},
		'onSelect' : function(event, queueId, fileObj) {
			imgSelect = layer.load(1, {
				shade : [ 0.1, '#fff' ]
			});
		},
		'onUploadError' : function(file, errorCode, errorMsg, errorString) {
		},
		'onSelectError' : function(file, errorCode, errorMsg) {
			if (errorCode == '-110') {
				layer.alert("文件太大，请上传小于2M的图片", {
					title : false,
					closeBtn : false
				});
			} else {
				layer.alert("上传失败，请重试", {
					title : false,
					closeBtn : false
				});
			}
		},
		'onUploadSuccess' : function(file, data, response) {// 每次成功上传后执行的回调函数，从服务端返回数据到前端
			if (data == '-1') {
				layer.alert("您好，请上传宽度不小于240像素，高度不小于180像素的图片。", {
					title : false,
					closeBtn : false
				});
				layer.close(imgSelect);
			} else {
				layer.close(imgSelect);
				theImg.parent().prev().attr('src', "../upload" + data);
				$("#iconPreview" + i).attr('src', "../upload" + data);
				$('#icon_val' + i + ',#checkPic').val(data);
			}
		}
	});
});

});
function addZxs() {
	var html = '<li><div class="elite_pic_intro"><p class="elite_pic"><img id="newteam-'
			+newZxsId
			+ '" src="../assets/images/elite_charts.png"/><input id="newicon-'
			+newZxsId
			+ '" type="hidden" name="photo'
			+ '" value="" /><a><input class="teamIconUp newTeamIcon" id="newTeamIcon'
			+newZxsId
			+'" style="width:120px; height:30px;" value="上传头像" /></a>'
			+ '</p><p class="elite_zishu"><textarea class="elite_jianjie zt_teams" name="information'
			+ '" placeholder="请填写140字以内医生背景介绍。"></textarea></p></div><p class="elite_name"><input class="zt_teams" type="text" name="name'
			+ '" value="" placeholder="请填写医生姓名。"></p><p class="btn_elite_del"><input value="删除此精英信息" class="input_green zt_teams_btn" type="button"></p></li>';
	$('.ico_elite_add').before(html);
	
	var teamIcons = $(".newTeamIcon");
	$.each(teamIcons, function(i, v) {
		var id = $(this).attr("id");
		var theImg = $(v);
		var preView = theImg.parent().prev();
		var val = theImg.parent().next();
		$("#"+id).uploadify({
			'auto' : true, // 关闭自动上传
			'removeTimeout' : 1, // 文件队列上传完成1秒后删除
			'swf' : '../assets/js/uploadify/uploadify.swf',
			'uploader' : '../up_img',
			'method' : 'post', // 方法，服务端可以用$_POST数组获取数据
			'buttonText' : '上传图片', // 设置按钮文本
			'multi' : false, // 允许同时上传多张图片
			'fileTypeDesc' : '请选择图片文件', // 只允许上传图像
			'fileTypeExts' : '*.jpg;*.png;*.jpeg', // 限制允许上传的图片后缀
			'queueSizeLimit' : 1,
			'fileSizeLimit' : 2048,
			'progressData' : 'speed',
			'formData' : {},
			'onSelect' : function(event, queueId, fileObj) {
				focusId = this.movieName;
				
				imgSelect = layer.load(1, {
					shade : [ 0.1, '#fff' ]
				});
			},
			'onUploadError' : function(file, errorCode, errorMsg, errorString) {
			},
			'onSelectError' : function(file, errorCode, errorMsg) {
				if (errorCode == '-110') {
					layer.alert("文件太大，请上传小于2M的图片", {
						title : false,
						closeBtn : false
					});
				} else {
					layer.alert("上传失败，请重试", {
						title : false,
						closeBtn : false
					});
				}
			},
			'onUploadSuccess' : function(file, data, response) {// 每次成功上传后执行的回调函数，从服务端返回数据到前端
				if (data == '-1') {
					layer.alert("您好，请上传宽度不小于240像素，高度不小于180像素的图片。", {
						title : false,
						closeBtn : false
					});
					layer.close(imgSelect);
				} else {
					layer.close(imgSelect);
					Jcrop_init(data,null,null);
				}
			}
		});
	});
	newZxsId++;
}


