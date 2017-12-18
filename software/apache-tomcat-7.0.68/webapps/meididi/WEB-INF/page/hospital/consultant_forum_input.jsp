<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>

</head>
<body style="background:transparent;">
 <!--right Start-->
 	<div class="bwh_crumbs">当前位置：<a href="javascript:void(0);" title="项目管理">案例管理</a><em>&gt;</em>创建案例</div>
    <form  id="enterProForm" action="${ctx }/api/forum/addForum" method="post" >
    
        <div class="tabBox">
            <ul class="tabNav">
                <li class="now">案例详情(必填)</li>
              
            </ul>
            <input type="hidden" name="hosId" id="hosId" class="project_imgs_val" value="${hosId}" >
			<input type="hidden" name="projectId" class="project_imgs_val" value="${projectId}" >
			<input type="hidden"  name="utype" class="project_imgs_val" value="c" >
			
			<input type="hidden"  name="forumtype" class="project_imgs_val" value="2" >
			
            <div class="proxx_box tabCont" style="display: block;" >
                <table class="xxMain">
                    <tbody>
                       
                        <tr>
                            <th><em>*</em>标题</th>
                            <td>
                                <div class="cname">
                                	<input name="title" id="p_title" type="text" value="" 
                                		class="w418" placeholder="请输入50字以内的项目标题名称">
                                </div>
                            </td>
                        </tr>
                       
                       
                        
                      
                        <tr>

                            <th><em>*</em>选取咨询师</th>
                            <td>
                                <div class="cname" >
                                	 <select name=uid id=vendorSelect >
							
							</select>
                                </div>
                            </td>
                        </tr>
                       
                        <tr>

                            <th><em>*</em>案例详情</th>
                            <td>
                                <div class="cname">
                                	<textarea id="p_meta" name="content" rows="5" class="w700"
                                	placeholder="请填写案例介绍内容，字数1000字以内" ></textarea>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em>*</em>案例图片</th>
                            <td>
                                <!--修改状态-->
                                <div class="cname">
                                    <div class="cpt p0 mt6">
                                        <p>说明：1.项目图片位置为项目介绍文字后，按照上传顺序依次连续展示；</p>
                                        <p class="pl37">2.请上传宽度不小于50像素，高度不小于50像素的图片；</p>
                                        <p class="pl37">3.上传图片格式支持JPG、JPEG、PNG；</p>
                                        <p class="pl37">4.上传图片大小不超过2MB。</p>
                                    </div>
                                    <ul class="cimg">
                                    	<c:set var="imgLength" value="0"></c:set>
										<c:if test="${!empty project.imgs}">
											<c:set var="imgs" value="${fn:split(project.imgs,',')}"></c:set>
											<c:set var="imgLength" value="${fn:length(imgs)}"></c:set>
										</c:if>
                                    	<c:forEach var="num" begin="0" end="4">
											 <li>
												<c:if test="${imgLength > num }" >
													<img id="iconPreview${num }" src="${ctx}/upload${imgs[num] }" >
												</c:if>
												<c:if test="${imgLength <= num}" >
													<img id="iconPreview${num }" src="${ctx}/assets/images/figure.png">
													
												</c:if>
												<div class="tc" style="position: relative">
                                                <div id="uploadIcon${num }" class="uploadifys" style="height: 30px; width: 120px;">
                                                	<div id="uploadIcon1-button" class="uploadify-button " style="height: 30px; line-height: 30px; width: 120px;">
                                                		<span class="uploadify-button-text">上传图片</span>
                                                	</div>
                                                </div>
                                                <div id="uploadIcon${num }-queue" class="uploadify-queue"></div>
                                                <a class="zt_del_icon img_loading" item="${num }"  title="删除照片" href="javascript:;">删除照片</a>
                                                <input  type="hidden"  name="pic" class="project_imgs_val" value="${imgs[num]}" id="icon_val${num}">
                                            	</div>
									
											</li>
										</c:forEach>      
                                        
                                    </ul>
                                </div>
                             
                            </td>
                        </tr>
                        <tr>
                            <th><em>*</em>作者</th>
                            <td>
                                <div class="cname">
                                	<input name="author" id="p_title" type="text" value="" 
                                		class="w418" placeholder="请输入作者">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--项目详情end-->
          
        </div>
        <div class="btn_tab">
            <input type="button" class="input_green mr20" id="projectSub" value="保存">
            <input type="button" class="input_green" value="返回" onclick="window.location.href = '${ctx}/hospital/project_list'" />
        </div>
    </form>
	
<!--right End-->
<script type="text/javascript" src="${ctx }/assets/js/hospital/jquery.raty.js"></script>
<script type="text/javascript" src="${ctx}/assets/js/hospital/cutImage.js"></script>
<script type="text/javascript">
    //pingfen
    rat('star1', 'result1');
    rat('star2', 'result2');
    function cut_submit(){ Jcrop_cut_submit("iconPreview","cover",false); }
    function rat(star, result, m) {

        star = '#' + star;
        result = '#' + result;
        $(result).hide();//将结果DIV隐藏

        $(star).raty({
            //hints: ['10','20', '30', '40', '50','60', '70', '80', '90', '100'],
            path: "../assets/images",
            starOff: 'star-off-big.png',
            starOn: 'star-on-big.png',
            size: 24,
            start: 40,
            showHalf: true,
            target: result,
            targetKeep: true,
            score:function(){
            	return $(this).attr("data");
            }
        });
    }
	
    $(document).ready(function () {
    	//danxuan
        $(".repForm span").click(function () {
            $(this).siblings().removeClass("checked");
            $(this).toggleClass("checked");
        });
        //项目切换
        $(".tabBox .tabCont:first").css("display", "block");
        $(".tabBox .tabNav li").click(function () {
            $(this).siblings("li").removeClass("now");
            $(this).addClass("now");
            $(this).parents(".tabBox").find(".tabCont").css("display", "none");
            var i = $(this).parents(".tabNav").find("li").index($(this));
            $(this).parents(".tabBox").find(".tabCont:eq(" + i + ")").css("display", "block");
        });
    	
    	
        //标签点击效果
        $('#label_ready li').click(function () {
            $(this).toggleClass('now');
            resetTagsInput();
        })
        function resetTagsInput() {
            $('#tags_ready').val('');
            $('#label_ready li').each(function () {
                if ($(this).hasClass('now')) {
                    $('#tags_input' + $(this).attr('p_id')).val($(this).attr('p_id'));
                } else {
                    $('#tags_input' + $(this).attr('p_id')).val('');
                }
            })
        }
        $('.zt_del_icon').click(function () {
            var id = $(this).attr('item');
            $('#icon_val' + id).val('');
            $('#iconPreview' + id).attr('src', '../assets/images/figure.png');
            var empty = true;
            $('input[id^=icon_val]').each(function () {
                if ($(this).val() != '') {
                    empty = false;
                    return false;
                }
            });
            if (empty == true) {
                $('#checkPic').val('');
            }
        });
         //封面点击效果
        $('#uploadIcon').uploadify({
            'auto': true, //关闭自动上传
            'removeTimeout': 1, //文件队列上传完成1秒后删除
            'swf': '../assets/js/uploadify/uploadify.swf',
            'uploader': '../up_cutImgUpload',
            'method': 'post', //方法，服务端可以用$_POST数组获取数据
            'buttonText': '上传图片', //设置按钮文本
            'multi': false, //允许同时上传多张图片
            'fileTypeDesc': '请选择图片文件', //只允许上传图像
            'fileTypeExts': '*.jpg;*.jpeg;*.png', //限制允许上传的图片后缀             'queueSizeLimit': 1,
            'fileSizeLimit': 2048,
            'progressData': 'speed',
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
                if(data!='-1'){
                	layer.closeAll();
                	Jcrop_init(data,300,250);
                } else {
                   layer.alert("操作失败");
                }
            }
        });
        
    //上传图片
    var uploadify =  $(".uploadifys");
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
			$('#icon_val'+i).val(data);
			$("#checkPic").val(data);
		}
		}
		});
}); 
		/* $.validator.addMethod('checkMoney',function(value,element,params){
		if(value.length>1){
		return false;
		}
		if(value>=params[0] && value<=params[1]){
		return true;
		}else{
		return false;
		}
		},'必须是一个字母,且a-f'); */
		
	
	
	
        validator = $("#enterProForm").validate({
            rules: {
            	'project.cover': {
                    required: true
                },
                'project.name': {
                    required: true,
                    
                    maxlength: 50,
                },
                'project.money': {
                    required: true,
                    min:1
                },
                'project.information': {
                    required: true,
                    maxlength: 1000,
                },
                'checkPic': {
                    required: true,
                },
                'project.material': {
                    maxlength: 1000,
                },
                'project.recoveryInf': {
                    maxlength: 1000,
                },
            },
            messages: {
            	'project.cover': {
                    required: "<span>项目封面图不能为空</span>",
                },
                'project.name': {
                    required: "<span>项目标题不能为空</span>",
                    
                    maxlength: "<span>标题过长，请输入50字以内的项目标题</span>",
                },
                'tips': {
                    required: "<span>请选择项目标签</span>",
                },
                'project.money': {
                    required: "<span>项目金额不能为空</span>",
                    min:"<span>金额不能为0</span>"
                },
                'project.information': {
                    required: "<span>项目介绍不能为空</span>",
                    maxlength: "<span>项目介绍内容过长，请填写1000字以内的项目介绍</span>",
                },
                'checkPic': {
                    required: "<span>请至少上传一张项目图片</span>",
                },
                'project.material': {
                    maxlength: "<span>内容过长，请填写1000字内的内容！</span>"
                },
                'project.scarInf': {
                    maxlength: "<span>疤痕说明内容过长，请填写1000字以内的疤痕说明</span>",
                },
                'project.recoveryInf': {
                    maxlength: "<span>恢复说明内容过长，请填写1000字以内的恢复说明</span>",
                },
            }
        });

	
		$("#projectSub").click(function(){
			var tips = $("input[name='tips']");
			var fla = true;
			var tipsNumber = 0;
			$.each(tips,function(i,v){
				if($(v).val()!=''){
					tipsNumber = tipsNumber + 1;
				}
			});
			if(tipsNumber==0){
				layer.alert("请选择标签！");
				fla = false;
			}else{
				fla = true;
			}
			
			
			var imgs = $(".cimg:first").find(".project_imgs_val");
			var imgNumber = 0;
			$.each(imgs,function(i,v){
				
				if($(v).val()!=''){
					imgNumber = imgNumber + 1;
				}
			});
			if(imgNumber==0){
				layer.alert("请上传图片");
				fla = false;
			}else{
				fla = true;
			}
			
			if($("#cover").val()==''){
				layer.alert("请上传封面图片");
				fla = false;
			}else{
				fla = true;
			}
			console.log(fla);
			if(validator.form()){
				if(fla){
					$("#enterProForm").submit();
				}
					
			}
		});
		
		
		
        //治疗时间被点击以后，给input赋值
        $('#use_time_div span').click(function () {
            setTimeout(function () {
                $('#use_time').val('');
                $('#use_time_div span').each(function () {
                    if ($(this).hasClass('checked')) {
                        $('#use_time').val($(this).attr('item'));
                        return false;
                    }
                });
            }, 200);
        });

        //是否住院被点击以后，给input赋值
        $('#is_zy_div span').click(function () {
            setTimeout(function () {
                $('#is_zy').val('0');
                $('#is_zy_div span').each(function () {
                    if ($(this).hasClass('checked')) {
                        $('#is_zy').val($(this).attr('item'));
                        return false;
                    }
                });
            }, 200);
        });

        //疼痛指数被点击以后，给input赋值
        $('#star1 img').click(function () {
            $('#pain_star').val($(this).attr('alt'));
        });

        //风险指数被点击以后，给input赋值
        $('#star2 img').click(function () {
            $('#risk_star').val($(this).attr('alt'));
        });
    });

    function afterCreate() {
        layer.open({
            type: 1,
            title: false,
            closeBtn: false,
            content: $('#afterCreate')
        });
    }
    window.onload=function()//用window的onload事件，窗体加载完毕的时候  http://www.meididi.com.cn/meididi/
    {
		
		var turl="${ctx}/api/getConsultantToJson?hosId="+$("#hosId").val()+"&pageSize=100";
		//alert(turl);
		
		//异步请求 获取该医院咨询师  
		$.ajax({
			
			 url:turl,
			 dataType: "json", 
				async:false,
				success: function (data) {  
					var vendorJson = data["consltl"];//获取json中的 key
					var html="";
					//alert(vendorJson);
					 for(var i=0; i<vendorJson.length; i++){
					     html += "<option value= '"+vendorJson[i].id+"'>"+vendorJson[i].name+"</option>";
					 }
					 $("#vendorSelect").html('').append(html);
				}
	
		})
	}
   
</script>

</body>
</html>