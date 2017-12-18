<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${ctx}/meididi/manage/upload/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${ctx}/manage/upload/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="${ctx}/manage/upload/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="${ctx}/manage/upload/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="${ctx}/manage/upload/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="${ctx}/manage/upload/kindeditor/jsp/js/jquery.cityselect.js"></script> 
<script language="javascript" src="${ctx}/manage/upload/kindeditor/jsp/js/cityselect.js"></script>

<%@include file="common/taglib.jsp" %>

</head>

<script type="text/javascript">
	
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : '${contextPath}/manage/upload/kindeditor/plugins/code/prettify.css',
				uploadJson : '${contextPath}/manage/upload/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '${contextPath}/manage/upload/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
		
		
	</script>
<body style="background:transparent;"   onload="init()">
 <!--right Start-->
 	<div class="bwh_crumbs">当前位置：<a href="javascript:void(0);" title="项目管理">项目管理</a><em>&gt;</em>创建项目</div>
    <form  id="enterProForm" action="${ctx }/hospital/project_input" method="post"  name="picForm"
			enctype="multipart/form-data">
        <div class="tabBox">
            <ul class="tabNav">
                <li class="now">项目介绍信息(必填)</li>
                <li>项目补充信息(选填)</li>
            </ul>
            <!--项目详情start-->
			<input type="hidden" name="id" value="${project.id }" />
			
            <div class="proxx_box tabCont" style="display: block;" >
                <table class="xxMain">
                    <tbody>
                        <tr>
                            <th><em>*</em>项目封面图</th>
                            <td>
                                <!--修改状态-->
                                <div class="cover_pic">
                                    <div class="cp" style="position: relative;">
                                        <!--无图默认-->
                                        <c:if test="${empty project.cover ||project.cover=='' }">
                                        	<img id="iconPreview" src="${ctx }/assets/images/p108.png">	
                                        </c:if>
                                        <c:if test="${!empty project.cover &&project.cover!='' }">
                                        	<img id="iconPreview" src="${ctx }/upload${project.cover}">	
                                        </c:if>
                                        <!--<a id="uploadIcon" class="load_head" title="点击上传" href="javascript:void(0)">点击上传</a>-->
                                        <div id="uploadIcon" style="height: 30px; width: 120px;">
                                        	<div id="uploadIcon-button" class="uploadify-button " style="height: 30px; line-height: 30px; width: 120px;">
                                        	<span class="uploadify-button-text">上传图片</span>
                                        	</div>
                                        </div>
                                        <div id="uploadIcon-queue" class="uploadify-queue"></div>
                                        <input type="hidden" name="project.cover" value="${project.cover }" id="cover" />
                                    </div> 
                                    <div class="cpt">
                                        <p>说明：1.封面图片位置为项目列表中的图标；</p>
                                        <p class="pl37">3.上传图片格式支持JPG、JPEG、PNG；</p>
                                        <p class="pl37">4.上传图片大小不超过2MB。</p>
                                    </div>
                                </div>
                                
                            </td>
                        </tr>
                        <tr>
                            <th><em>*</em>项目标题</th>
                            <td>
                                <div class="cname">
                                	<input name="project.name" id="p_title" type="text" value="${project.name }" 
                                		class="w418" placeholder="请输入50字以内的项目标题名称">
                                </div>
                            </td>
                        </tr>
                        <tr>

                            <th><em>*</em>项目标签</th>
                            <td>
                                <!--修改状态-->
                                <ul class="label_box label_list" id="label_ready">
                                	
                            		<c:forEach var="tip" items="${allTips }">
                            			<c:if test="${fn:contains(project.tips,tip.key) }">
                            				<c:set value="1" var="v"></c:set>
                            			</c:if>
                            			<li p_id="${tip.key }" <c:if test="${v==1 }">class='now'</c:if>>
                                            <a title="${tip.value}" href="javascript:void(0);">${tip.value }</a>
                                            <input type="hidden" id="tags_input${tip.key }" name="tips" 
                                            	value="<c:if test="${v==1 }">${tip.key }</c:if>">
                                        </li>
                                        <c:set value="0" var="v"></c:set>
                            		</c:forEach>
                            			
                                
                                </ul>
                                <!-- <input type="hidden" value="" name="tags_ready" id="tags_ready"> -->
                            </td>
                        </tr>
                        <tr>

                            <th><em>*</em>项目金额</th>
                            <td>
                                <div class="cname">
                                	<c:if test="${project.money!=null&&project.money!=0 }">
                                		<input id="p_price" name="project.money" type="text" 
                                		value="${project.money }" class="w418" placeholder="请输入项目定价，不能为0">
                                	</c:if>
                                	<c:if test="${project.money==null||project.money==0 }">
                                		<input id="p_price" name="project.money" type="text" 
                                		value="" class="w418" placeholder="请输入项目定价，不能为0">
                                	</c:if>
                                </div>
                            </td>
                        </tr>
                        
                        <!-- 
                        <tr>

                            <th><em>*</em>项目类别</th>
                            <td>
                                <div class="cname">
                                	 <select name=type >
							<option value="0">活动</option>
							<option value="1">项目</option>
							</select>
                                </div>
                            </td>
                        </tr>
                        -->
                        <tr>

                            <th><em>*</em>项目介绍</th>
                            <td>
                                <div class="cname">
                                <td colspan="2"><textarea name="content" id="content"
							cols="100" rows="8"
							style="width: 500px; height: 500px; "></textarea>
								<!--
                                	<textarea id="p_meta" name="project.information" rows="5" class="w700"
                                	placeholder="请填写项目介绍内容，字数1000字以内" >${project.information}</textarea>
                                	-->
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em>*</em>项目图片</th>
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
                                                <input type="hidden" name="imgs" class="project_imgs_val" value="${imgs[num] }" id="icon_val${num }">
                                            	</div>
									
											</li>
										</c:forEach>      
                                        
                                    </ul>
                                </div>
                                <input type="hidden" name="checkPic" value="${project.imgs }" id="checkPic">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--项目详情end-->
            <!--项目补充信息（选填）start-->
            <div class="replenish_infor tabCont">
                <table class="xxMain">
                    <tbody>
                        <tr>
                            <th><em></em>治疗时间</th>
                            <td class="w700">
                                <div class="repForm w700" id="use_time_div">
                                	<c:forEach var="time" items="${needTime }">
                                		<span item="${time.key }" <c:if test="${project.needTime == time.key}">class='checked'</c:if>>${time.value }</span>
                                	</c:forEach>
                                    
                                </div>
                                <input type="hidden" name="project.needTime" id="use_time" value="${project.needTime }">
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>是否住院</th>
                            <td>
                                <div class="repForm w700" id="is_zy_div">
                                    <span item="1" <c:if test="${project.isIn== 1 }">class='checked'</c:if>>需要住院</span>
                                    <span item="0" <c:if test="${project.isIn== 0 }">class='checked'</c:if>>不需要住院</span>
                                    <c:if test="${project.isIn=='' }">
                                    	<input type="hidden" name="project.isIn" id="is_zy" value="-1">
                                    </c:if>
                                    <c:if test="${project.isIn!='' }">
                                    	<input type="hidden" name="project.isIn" id="is_zy" value="${project.isIn }">
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>疼痛指数</th>
                            <td>
                                <div class="start_box">
                                    <div id="star1" style="cursor: pointer; width: 140px;" data="${project.pain }">
                                    
                                    <input type="hidden" name="score" >
                                    </div>
                                    <div id="result1" style="display: none;" ></div>
                                </div>
                                <input type="hidden" name="project.pain" id="pain_star" value="${project.pain }">
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>风险指数</th>
                            <td>
                                <div class="start_box">
                                    <div id="star2" style="cursor: pointer; width: 140px;" data="${project.danger }">
                                    
                                    <input type="hidden" name="score" ></div>
                                    <div id="result2" style="display: none;"></div>
                                </div>
                                <input type="hidden" name="project.danger" id="risk_star" value="${project.danger }">
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>材料品牌</th>
                            <td>
                                <div class="cname">
                                <input id="material_brand" name="project.material" type="text" value="${project.material }" 
                                	placeholder="请输入使用材料品牌，如有多个品牌，以逗号分隔" class="w700">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>疤痕说明</th>
                            <td>
                                <div class="cname">
                                	<textarea name="project.scarInf" id="scar_that" class="w700" 
                                		rows="3" placeholder="请输入疤痕情况文字说明，100字以内">${project.scarInf}</textarea>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>恢复说明</th>
                            <td>
                                <div class="cname">
                                	<textarea id="recover" name="project.recoveryInf" class="w700" 
                                		rows="3" placeholder="请输入术后恢复情况文字说明，100字以内">${project.recoveryInf }</textarea>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--项目补充信息（选填）end-->
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
    
   
</script>

</body>
</html>