/**
 * 裁剪通用js首页用。。。。。。。
 * 使用说明
 * 前提
 * 1.图片上传提交到专门处理裁剪的上传../up_cutImgUpload
 * 2.需要在页面引入js
 * 3.在图片上传成功拿到图片地址时候调用Jcrop_init(img_src,P_top,P_left)
 * 4.页面编写cut_submit()函数 调用Jcrop_cut_submit(previewImgId,valImgId,isReload)即可
 * 或者改动很大可以自己写ajax交互注意加关闭layer.close(Jcrop_index_cut_layer);图片回显加随机数
 * 例子
 * 改../up_cutImgUpload			Jcrop_init(data,300,250);
 * 1.<script type="text/javascript" src="${ctx}/assets/js/hospital/cutImage.js"></script>
 * 2.function cut_submit(){ Jcrop_cut_submit("logoView","logoImg",false); }
 */
var Jcrop_index_api=null;
var Jcrop_index_cut_layer;
/**
 * 初始化函数-在上传成功函数里调用
 * @param img_src 图片src
 * @param P_top 顶部距离 P_left 左边距离 （在外层弹出清设置这两项为null,iframe中弹出建议设置300,250）
 */
function Jcrop_index_init(img_src,P_top,P_left){
	//打开裁剪框
	_showCutLayer(P_top,P_left);
	$("#cutPhoto").attr("src","upload"+img_src);
	$("#photo").val(img_src);
	Jcrop_index_api = $("#cutPhoto").Jcrop({
		onChange:_updateCoords,
    	onSelect:_updateCoords,
    	setSelect: [ 10, 10, 210, 210 ],
    	aspectRatio:1,
    	minSize: [100,100],
	});
}
//2:1比例
function Jcrop_index_init_2(img_src,P_top,P_left){
	//打开裁剪框
	_showCutLayer(P_top,P_left);
	$("#cutPhoto").attr("src","upload"+img_src);
	$("#photo").val(img_src);
	Jcrop_index_api = $("#cutPhoto").Jcrop({
		onChange:_updateCoords,
    	onSelect:_updateCoords,
    	setSelect: [ 10, 10, 210, 210 ],
    	aspectRatio:2,
    	minSize: [100,100],
	});
}
/**
 * 提交裁剪函数-一般情况下够用特殊的自己写交互
 * @param previewImgId 回调的图片id也就是页面显示此图片的id
 * @param valImgId 回调的图片input的id也就是往库里存的input的id
 * @param isReload 提交成功是否重新加载默认不加载
 */
function Jcrop_index_cut_submit(previewImgId,valImgId,isReload){
	var reload=false;
	reload=(isReload==true?true:false);
	reload=(isReload=='true'?true:false);
	var html='';
	$.ajax({
		url:"up_cut?t="+Math.random(),
		type:"POST",
		data:$("#cutForm").serialize(),
		async:false,
		success:function(data){
			if("success" ==data){
				//图片会缓存加随机数
				//console.info($("#"+previewImgId).attr("src"));
				//document.getElementById(previewImgId).src="../upload"+$("#photo").val()+"?t="+Math.random();
				$("#"+previewImgId).attr("src","");
				$("#"+previewImgId).attr("src","upload"+$("#photo").val()+"?t="+Math.random());
				$("#"+valImgId).val($("#photo").val());
				layer.close(Jcrop_index_cut_layer);
				//其他事情哦
				if(reload){location.reload();}
			}else{
				layer.alert("操作失败");
			}
		}
	});
}

function Jcrop_cut_submit_no(previewImgId,valImgId,isReload){
	var reload=false;
	reload=(isReload==true?true:false);
	reload=(isReload=='true'?true:false);
	var html='';
	$.ajax({
		url:"up_cutNo?t="+Math.random(),
		type:"POST",
		data:$("#cutForm").serialize(),
		async:false,
		success:function(data){
			if("success" ==data){
				//图片会缓存加随机数
				//console.info($("#"+previewImgId).attr("src"));
				//document.getElementById(previewImgId).src="../upload"+$("#photo").val()+"?t="+Math.random();
				$("#"+previewImgId).attr("src","");
				$("#"+previewImgId).attr("src","upload"+$("#photo").val()+"?t="+Math.random());
				layer.close(Jcrop_index_cut_layer);
				//其他事情哦
				if(reload){location.reload();}
			}else{
				layer.alert("操作失败");
			}
		}
	});
}
//内部使用造html显示layer
function _showCutLayer(P_top,P_left){
	var html=''
	+'<div class="popup_box2 " id="upCutDiv">'
	+'	<form action="" id="cutForm">'
	+'		<cite class="popup_t">裁剪</cite>'
	+'		<div class="" style="height:450px; width: 420px;overflow-y: hidden; overflow-x:hidden; ">'
	+'			<img id="cutPhoto" src="" style="background-color:#FFF" >'
	+'		</div>'
	+'		<p class="password_btn">'
	+'   		<input type="button" class="input_green mr20" value="确认" onclick="cut_submit()">'
	+'    		<input type="reset" class="input_green mr20" value="取消" onclick="layer.closeAll();">'
	+'		</p>'
	+'		<input type="hidden" id="photo" name="photo" value="" />'
	+'		<input type="hidden" id="who" name="who" value="admin" />'
	+'		<input type="hidden" id="id" name="id" value="1" />'
	+'		<input type="hidden" id="x" name="x" value="" />'
	+'		<input type="hidden" id="y" name="y" value="" />'
	+'		<input type="hidden" id="w" name="w" value="" />'
	+'		<input type="hidden" id="h" name="h" value="" />'
	+'		<input type="hidden" id="rw" name="rw" value="" />'
	+'		<input type="hidden" id="rh" name="rh" value="" />'
	+'	</form>'
	+'</div>';
	
	if(P_top!=''&&P_left!=''&&P_top!=null&&P_left!=null){
		Jcrop_index_cut_layer = layer.open({
			type : 1,
			title : false,
			closeBtn : false,
			content : html,
			offset: [''+P_top+'px', ''+P_left+'px']
		});
	}else{
		Jcrop_index_cut_layer = layer.open({
			type : 1,
			title : false,
			closeBtn : false,
			content : html
		});
	}
}
//内部使用刷新坐标
function _updateCoords(c){
	$(".jcrop-keymgr").hide();
	$('#x').val(c.x);
    $('#y').val(c.y);
    $('#w').val(c.w);
    $('#h').val(c.h);
    $('#rh').val($(".jcrop-holder:first").css('height'));
    $('#rw').val($(".jcrop-holder:first").css('width'));
}

