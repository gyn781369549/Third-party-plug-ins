var validator;
var imgSelect;
$(document).ready(function() {
	$(".menus_box .menus li").click(function() {
		$(".menus_box .menus .over").removeClass("over");
		$(this).addClass("over");
	});
	if ($.cookie('leftClose') == '0') {
		$('#btnLeft').css({
			"background-image" : "url('../../images/hospital/btn_meidd_up.png')"
		});
		$('#btnLeft').css({
			left : 0
		});
		$('#meiddLeft').hide();
		$('#meiddRight').css({
			marginLeft : "30px"
		});
	}

	jQuery.validator.addMethod("geshiAdminPass", function(value, element) {
		var pass = /^([0-9a-zA-Z]{6,18})$/;
		return (pass.test(value) || this.optional(element));
	}, " <span>密码格式不正确，请输入6-18位数字</span>");
	
	validator = $("#resetAdminPsdForm").validate({
		rules : {
			adminPwd : {
				required : true,
				
			},
			newPwd : {
				required : true,
				geshiAdminPass : function() {
					return true;
				}
			},
			newPwd2 : {
				required : true,
				equalTo : "#newPwd"
			},
		},
		messages : {
			oldPwd : {
				required : "<span>原密码不能为空</span>"
				
			},
			newPwd : {
				required : "<span>新密码不能为空</span>",
			},
			newPwd2 : {
				required : "<span>确认密码不能为空</span>",
				equalTo : "<span>两次密码输入不一致，请重新输入</span>"
			},
		}
	});
	
	$("#resetSubmit").click(function(){
		if(validator.valid()){
			$.ajax({
				url:"account_reset",
				type:"POST",
				data:$("#resetAdminPsdForm").serialize(),
				success:function(data){
					
					if("success"==data){
						layer.alert("修改成功，下次生效");
						layer.close(resetArea);
					}else {
						layer.alert("修改失败");
					}
				}
			});
		}
		
	});
	
	

	$('#uploadIcon').uploadify({
		'uploader' : '../up_cutImgUpload',
		'swf' : '../assets/js/uploadify/uploadify.swf',
		'removeTimeout' : 1, // 文件队列上传完成1秒后删除
		'auto' : true, // 关闭自动上传
		'method' : 'post', // 方法，服务端可以用$_POST数组获取数据
		'buttonText' : '浏览上传', // 设置按钮文本
		'multi' : false, // 允许同时上传多张图片
		'fileTypeDesc' : '请选择图片文件', // 只允许上传图像
		'fileTypeExts' : '*.jpg;*.png;*.jpeg', // 限制允许上传的图片后缀
		'fileSizeLimit' : 2048,
		'queueSizeLimit' : 1,
		'progressData' : 'speed',
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
			if (data != "-1") {
				$('.popup_bg').hide();
	            layer.close(imgSelect);
	            Jcrop_init(data,null,null);
			} else if (data == '-1') {
				layer.alert("您好，图片上传失败", {
					title : false,
					closeBtn : false
				});
				layer.close(imgSelect);
			} 
		}
	});
	
	
	$("#upPhotoSub").click(function(){
		if($("#icon_val").val()!=''){
			$.ajax({
				url:"information_photo",
				type:"POST",
				data:{photo:$("#icon_val").val()},
				success:function(data){
					if(data!="error"){
						layer.closeAll();
						$(".bwh_head_pic").children("img").attr("src","../upload"+data);
						location.reload();
					}else{
						layer.alert("操作失败");
					}
				}
			});
		}
	})
});
// 修改密码
var resetArea;
function resetAdminPsd() {
	resetArea = layer.open({
		type : 1,
		title : false,
		closeBtn : false,
		content : $('#resetAdminPsdDiv')
	});
}

function upIcon() {
	layer.open({
		type : 1,
		title : false,
		closeBtn : false,
		content : $('#upIconDiv')
	});
}
