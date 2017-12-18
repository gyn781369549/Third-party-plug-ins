<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/assets/css/fsgallery.css"> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
</head>
<body>
    <!--right Start-->
	<div class="tabBox">
 		<ul class="tabNav" id="tabNav">
			<li class="now" attr="basic">基础信息</li>
			<li attr="tags" class="">标签信息</li>
			<li attr="teams" class="">医疗团队</li>
		</ul>
	<div class="tabCont" id="basic" style="display: block;">
	<form id="enterHosForm" action="${ctx }/console/hospitalInf_input" method="post" novalidate="novalidate">
		<input type="hidden" name="hospitalInformation.id" value="${hospitalInformation.id}"/>
		<input type="hidden" name="edited" value="basic"/>
		
		<div class="head_pic">
			<p style="magrin:0">
				<em class="c_green" style="opacity: 0">*</em>
			</p>
			
			<c:if test="${hospitalInformation.logo != '' }" >
				<img id="hosIconPreview" src="${ctx }/upload${hospitalInformation.logo }" 
					onerror="this.src='${ctx}/assets/images/figure.png'" />
			</c:if>
			<c:if test="${ hospitalInformation.logo == '' }">
				<img id="hosIconPreview" src="${ctx}/assets/images/figure.png"  />
			</c:if>
			<div class="zt_basic_btn" style="width: 120px;height: 30px;position: absolute;left: 20px;top: 240px">
				<div  id="upHosIcon" style="height: 30px; width: 120px;">
				</div>
				<div id="upHosIcon-queue" class="uploadify-queue"></div>
			</div>
			<input type="hidden" name="hospitalInformation.logo" value="${hospitalInformation.logo }" id="hosIconVal">
		</div>
		<div class="basis_cont">
			<ul>
				<li>
				<span class="basis_name"><em>*</em>医院名称</span>
				<input onmouseout="return isNameLike();" placeholder="请填写医院名称" name="hospitalInformation.name" id="hosName"
					 type="text" class="w418 zt_basic" value="${hospitalInformation.name }">
				</li>
				<li>
				<span class="basis_name"><em></em>医院联络人</span>
				<p><input placeholder="请填写医院联络人" type="text" class="w148 mr20 zt_basic" 
					name="hospitalInformation.contacts" id="contact_name" value="${hospitalInformation.contacts }"></p>
				<span class="basis_name"><em></em>联系电话</span>
				<p><input type="text" placeholder="请填写联系电话" class="w148 zt_basic" name="hospitalInformation.phone" id="contact_phone" value=""></p>
				</li>
				<li>
				<span class="basis_name"><em>*</em>医院地址</span>
				<p>
				<select class="w107 zt_basic province" id="province_id"  style="float: left">
				</select>
				<select class="w107 ml10 zt_basic city" id="city_id"  style="width:91px;float: left;">
				</select>
				<input type="hidden" value="${hospitalInformation.countries }" id="cityVal" name="hospitalInformation.countries" />
				</p>
				<div class="clearfix"></div>
				<div class="ml95">
					<input type="text" placeholder="请填写医院地址" class="w418 zt_basic" 
						name="hospitalInformation.address" id="address" value="${hospitalInformation.address }">
						<input type="hidden" id="coords_x" name="hospitalInformation.coords_x" value="${hospitalInformation.coords_x }">
						<input type="hidden" id="coords_y" name="hospitalInformation.coords_y" value="${hospitalInformation.coords_y }">
						<input type="button" id="coords_button" value="选取坐标" style="background: #CCC" onclick="openBaiduMap();"/>
						</div>
				</li>
				<li>
				<span class="basis_name"><em></em>联络邮箱</span>
				<p><input type="text" placeholder="请填写邮箱" class="w418 zt_basic" name="hospitalInformation.email" 
				id="contact_email" value="${hospitalInformation.email }"></p>
				</li>
				<li>
				<span class="basis_name"><em></em>医院网址</span>
				<p><input type="text" placeholder="请填写网址" class="w418 zt_basic" name="hospitalInformation.url" 
					id="weblink" value="${hospitalInformation.url }"></p>
				</li>
				<li>
				<span class="basis_name tt"><em>*</em>医院介绍</span>
				<p>
				<textarea class="w418 zt_basic" rows="5" placeholder="请填写医院介绍，支持中文" name="hospitalInformation.information"id="jieshao">${hospitalInformation.information }</textarea></p>
				</li>
				<li>
				<span class="basis_name tt"><em style="opacity: 0">*</em></span>
				<dl class="uploading_img_dl">
				<c:set var="imgLength" value="0"></c:set>
				<c:if test="${!empty hospitalInformation.imgs}">
					<c:set var="imgs" value="${fn:split(hospitalInformation.imgs,',')}"></c:set>
					<c:set var="imgLength" value="${fn:length(imgs)}"></c:set>
				</c:if>
				
				<c:forEach var="num" begin="1" end="5">
					<dd>
						
						<c:if test="${imgLength >= num }" >
							<img id="iconPreview${num }" src="${ctx}/upload${imgs[num-1] }" 
								onerror="this.src='${ctx}/assets/images/figure.png'">
						</c:if>
						<c:if test="${imgLength < num}" >
								<img  id="iconPreview${num }" src="${ctx}/assets/images/figure.png">
							
						</c:if>
						
						<div class="zt_basic_btn">
							<div id="uploadIcon${num }" class="uploadify" style="height: 30px; width: 120px;">
							</div>
							<a class="img_loading zt_del_icon" item="${num }" title="删除" href="javascript:void(0)">删除</a>
							
							<c:if test="${imgLength >= num }" >
							<input type="hidden" name="hospitalInformation.imgs" 
								 value="${imgs[num-1] }" id="icon_val${num }">
							</c:if>
							<c:if test="${imgLength < num}" >
									<input type="hidden" name="hospitalInformation.imgs" 
										 id="icon_val${num }">
							</c:if>
							
							
						</div>
					</dd>
				</c:forEach>
				
				</dl>
				</li>
			</ul>
 			<p style="width: 100%; font-size: 10px; color: red; padding-left:21px; text-align: left;">请上传宽度不小于50像素，高度不小于50像素的图片。</p>
			<input type="hidden" name="checkPic" value="" id="checkPic">
			<div class="btn_tab">
			<!-- 
			最后提交按钮 
			 -->
				<input value="保存" onclick="return isCheckForm();" class="input_green mr20 zt_basic_btn" type="submit">
				<input value="返回列表" class="input_green" type="button" onclick="window.location.href = '${ctx}/console/hospitalInf_list';">
			</div>
		</div>
	</form>
	</div>


	<div class="tabCont label_infor" id="tags" style="display: none;">
	<form  action="${ctx }/console/hospitalInf_input" method="post">
		<input type="hidden" name="hospitalInformation.id" value="${hospitalInformation.id}"/>
		<input type="hidden" name="edited" value="tags"/>
	<div class="label_all">
	<h6>已选标签</h6>
	<ul class="label_box" id="label_cur">
		
		<c:set var="selectedTips" value="${fn:split(hospitalInformation.tips,',' )}"></c:set>
		<c:if test="${hospitalInformation.tips !=null }">
		<c:forEach var="t_id" items="${selectedTips }" >
			<li p_id="${t_id }">
				<input type="hidden" name="tips" value="${t_id }">
				<a href="javascript:;" title="${allTips[t_id] }">${allTips[t_id] }</a>
				<em class="ico_label_del">×</em>
			</li>
		</c:forEach>
		</c:if>
		<li style="display:none" id="addTagsFlag" class="label_add"></li>
	</ul>
	</div>
	<div class="label_all">
	<h6>待选标签<span></span></h6>
	<ul class="label_box label_list" id="label_ready">
	
		<c:forEach var="tip" items="${allTips}" >
			<li  p_id="${tip.key }" >
				<a href="javascript:addTag(${tip.key},'${tip.value}',this);" title="${tip.value}">${tip.value}</a>
			</li>
		</c:forEach>
	
	</ul>
	
	</div>
	<div class="btn_tab" style="padding:0 20px">
		<input value="保存" class="input_green mr20 zt_tags_btn" type="submit">
		<input value="返回列表" class="input_green" type="button" onclick="window.location.href = '${ctx}/console/hospitalInf_list';">
	</div>
	</form>
	</div>
	
	
	<div class="tabCont dmat_box" id="teams" style="display: none;">
	<form  action="${ctx }/console/hospitalInf_input" method="post" id="teamForm">
		<input type="hidden" name="hospitalInformation.id" value="${hospitalInformation.id}"/>
		<input type="hidden" name="edited" value="teams"/>
		<input type="hidden" name="delTeamIds" id="delTeamIds" value="">
		<div class="dmat_team_intro">
			<h1><em class="icon_vereist"></em>医疗团队介绍</h1>
			<textarea rows="5" class="edit zt_teams" placeholder="请填写500字以内医疗团队介绍信息。" name="teamInf">${hospitalInformation.teamInf}</textarea>
		</div>
		<div class="dmat_team_intro">
		<h1><em class="icon_vereist"></em>医疗精英信息</h1>
		<ul class="elite_infor">
			<c:set var="index" value="0"></c:set>
			<c:forEach var="team" items="${teams}" varStatus="status">
                <li class="mr20">
                	<input type="hidden" name="teamId" value="${team.id }" />
                	<div class="elite_pic_intro">
                    <p class="elite_pic">
                    	<c:if test="${!empty team.photo&&team.photo!=''}">
                    		<img id="teamIcon_${status.index }" src="${ctx }/upload${team.photo }">
                    	</c:if>
                    	<c:if test="${empty team.photo&&team.photo==''}">
                    		<img id="teamIcon_${status.index }" src="${ctx }/assets/images/elite_charts.png" >
                    	</c:if>
						<a>
						<input class="teamIconUp" id="teamIconUp${status.index }" style="width: 120px; height: 30px;"  value="上传头像" />
						</a>
                    <input id="teamIcon-${status.index }" type="hidden" name="photo" value="${team.photo}">
                  	</p>
                  	
                    <p class="elite_zishu">
                    	<textarea class="elite_jianjie zt_teams" name="information" placeholder="请填写140字以内医生背景介绍。">${team.information}</textarea>
                    	
                    </p>
                	</div>
                	<p class="elite_name">
                    	<input class="zt_teams" type="text" name="name" value="${team.name }" 
                    	placeholder="请填写医生姓名。"></p>
                    <p class="btn_elite_del" t_id="${team.id }">
                    	<input type="button" class="input_green zt_teams_btn" value="删除此精英信息">
                    </p>
                </li>
                
			<c:set var="index" value="${index+1 }"></c:set>
            </c:forEach>
			
			<li class="ico_elite_add">
			<a class="zt_teams_btn" href="javascript:addZxs(this);">
				<img src="${ctx}/assets/images/ico_elite_add.png" alt="">
				<span>添加新精英信息</span>
			</a>
			</li>
		</ul>
		<script> var newZxsId = 1;</script>
	</div>
	<div class="btn_tab">
	<input value="保存" class="input_green mr20 zt_teams_btn" id="teamSub" type="button">
	<input value="返回列表" class="input_green" type="button" onclick="window.location.href = '${ctx}/console/';">
	</div>
	</form>

	<div class="popup_box upload_pic" id="upJingyingDiv" style="display: none">
		<cite class="popup_t">头像上传</cite>
		<div class="password_box">
		<div class="uploading_cont">
			<p class="default_pic">
			<img id="jingYingIconPreview" alt="" src="${ctx}/assets/images/elite_charts.png">
			<input type="hidden" id="jingYingIcon" value="">
			<span></span>
			</p>
			<!--头像预览end-->
			<div class="upload_box clearfix">
			<div id="uploadJingyingIcon" class="uploadify" style="height: 30px; width: 120px;">
			</div>
			</div>
		</div>
		<p class="password_btn">
		<input type="button" class="input_green" value="确认" onclick="subJingyingIcon();">
		<input type="button" class="input_grey ml60" value="取消" onclick="resetJingying();">
		</p>
		</div>
	</div>
</div>
</div>



<!--right End-->
	<script type="text/javascript" src="${ctx }/assets/js/country.js"></script>
	<script type="text/javascript" src="${ctx }/assets/js/hospital/cutImage.js"></script>
	<script type="text/javascript">
	//判断提交的表单
	function isNameLike(){
		if($("#hosName").val()==null||$("#hosName").val().length<1){
			alert("请填写医院名字");
			return false;
		}
		var turl="${contextPath}/console/indexLike?name="+$("#hosName").val();
			
		$.ajax({
			url:turl,
			 dataType: "json", 
				async:false,
				success: function (data) {  
					var val = data["count"];//获取json中的 key
					if(val==0){
						//alert("名字可以用！");
						return true ;
					}else{
						alert("此医院名字已存在！");
						$("#hosName").val("");
						return false ;
						}
				}
		}
					)
	
		
	}
	//判断提交的表单
	function isCheckForm(){
		//alert("坐标 y="+$("#coords_y").val()+" x="+$("#coords_y").val());
		if($("#coords_y").val()==null||$("#coords_y").val().length<1){
			alert("请选择坐标");
			return false;
		}
		if($("#coords_x").val()==null||$("#coords_x").val().length<1){
			alert("请选择坐标");
			return false;
		}
		if($("#hosName").val()==null||$("#hosName").val().length<1){
			alert("请填写医院名字");
			return false;
		}
	
	
		return true; 
		
	}
	
		var focusId;
		
	
		function cut_submit(){ 
			
			var preView = $(this);
			var select = $("#tabNav").children(".now:first").attr("attr");
			if("basic"==select){
				Jcrop_cut_submit("hosIconPreview","hosIconVal",false);
			}else if("teams"==select){
				console.log(focusId);
				var teamPreviewId = $("#"+focusId).parent().parent().parent().find("img:first").attr("id");
				var teamValId = $("#"+focusId).parent().parent().parent().find("input[name='photo']:first").attr("id");
				console.log($("#"+focusId).parent().parent());
				Jcrop_cut_submit(teamPreviewId,teamValId,false) ;
			}else{
				return false;
			}
			}
		var hospitalInformationTips = '${hospitalInformation.tips }';
		var edited = '${edited}';
		var mapLayer;
		//联动
		$(window).selectCity({
		province : '.province',
		city : '.city',
		value :'${hospitalInformation.countries}',
		callback : function(indexArr){
			$("#cityVal").val(provinceArr[indexArr[0]]+","+cityArr[indexArr[0]][indexArr[1]]);
		}
		});
		
		function openBaiduMap(){
			//TODO 地址传入无效
			var x = $('#coords_x').val();
			var y = $('#coords_y').val();
			var address = encodeURI($('#address').val());
			console.info(encodeURI(address));
			mapLayer = layer.open({
				  type: 2,
				  title: '点击选取坐标',
				  shadeClose: true,
				  shade: 0.8,
				  area: ['680px', '500px'],
				  offset: ['50px', '50px'],
				  content: 'hospitalInf_showMap?x='+x+'&y='+y+'&address='+address
			});
		}
	</script>
	<script type="text/javascript" src="${ctx }/assets/js/hos.addInf.js"></script>
</body>
</html>