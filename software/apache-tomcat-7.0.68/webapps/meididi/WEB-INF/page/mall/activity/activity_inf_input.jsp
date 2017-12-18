<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/assets/css/fsgallery.css"> 
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
</head>
<body>
    <!--right Start-->
	<div class="tabBox">
 		<ul class="tabNav" id="tabNav">
			<li class="now" attr="basic">基础信息</li>

		</ul>
	<div class="tabCont" id="basic" style="display: block;">
	<form  id="enterHosForm" action="${ctx}/mall/mallFengAction/add" method="post" novalidate="novalidate">
		
		
		
		<div class="basis_cont">
			<ul>
				<li>
				<span class="basis_name"><em>*</em>活动名称</span>
				<input  placeholder="请填写活动名称" name="title" id="hosName"
					 type="text" class="w418 zt_basic" value="${f.title}">
				</li>
			
				<li>
				<span class="basis_name tt"><em>*</em>活动介绍</span>
				<p>
				<textarea class="w418 zt_basic" rows="5" placeholder="请填写活动介绍，支持中文" name="content"id="jieshao">${f.content}</textarea></p>
				</li>
				<!-- -->
				<input type="hidden" value="${f.cpType}" id="cpType">
				<input type="hidden" value="${f.type}" id="type">
				<input type="hidden" value="${f.projectId}" id="projectId">
				<input type="hidden" value="${f.commodityId}" id="commodityId"> 
				<input type="hidden" value="${f.id}" name=id >  
				<!-- 
		    <c:if test="${f.cpTypeValue!=null}">
				<li>
				<span class="basis_name tt"><em>*</em>项目类型</span>
				<p>
				
				<span class="basis_name tt"><em>*</em>${f.cpTypeValue}</span>
				
				</li>
			</c:if>
			<c:if test="${f.project.name !=null }">
				<li>
				<span class="basis_name tt"><em>*</em>活动项目</span>
				<p>
				<span class="basis_name tt"><em>*</em>${f.project.name}</span>
				
				</li>
			</c:if>
			<c:if test="${f.commodity.title !=null }">
				<li>
				<span class="basis_name tt"><em>*</em>活动项目</span>
				<p>
				<span class="basis_name tt"><em>*</em>${f.commodity.title}</span>
				
				</li>
			</c:if>
				
				<li>
				<span class="basis_name tt"><em>*</em>活动类型</span>
				<p>
				<span class="basis_name tt"><em>*</em>${f.typeValue}</span>
				
				</li>
				
				
				
				
				
				
				 -->
				
				<li>
				<span class="basis_name tt"><em>*</em>项目类型</span>
				<p>
				
				<select   name=cpType id=pt>
							<option   value="1">商品</option>
							<option   value="2">项目</option>
							
							</select>
				</li>
				<li id=liproject style="display:none ;">
				<span class="basis_name tt"><em>*</em>选择项目</span>
				<p>
				<select  name=projectId id=project>
							
							</select>
				</li>
				<li id=licommodity >
				<span class="basis_name tt"><em>*</em>选择商品</span>
				<p>
				
				<select  name=commodityId id=commodity>
							
							</select>
				</li>
				<!--
				<li>
				<span class="basis_name"><em>*</em>项目金额</span>
				<input  placeholder="请填写项目金额" name="hospitalInformation.name" id="money"
					 type="text" class="w418 zt_basic" value="${hospitalInformation.name }">
				</li>
				  -->
				<li>
				<span class="basis_name tt"><em>*</em>活动类型</span>
				<p>
				<select name=type id=friend>
							
							</select>
				</li>
				
				
				
			</ul>
 			
			<input type="hidden" name="checkPic" value="" id="checkPic">
			<div class="btn_tab">
			<!-- 
			最后提交按钮 
			 -->
			 	 <c:if test="${f.type==5}">
				<input value="保存" onclick="sub();" disabled="disabled" class="input_green mr20 zt_basic_btn" type="button">
				</c:if >
				 <c:if test="${f.type!=5}">
				<input value="保存" onclick="sub();" class="input_green mr20 zt_basic_btn" type="button">
				</c:if >
				<input value="返回列表" class="input_green" type="button" onclick="window.location.href = '${ctx}/mall/mallFengAction/listView?pageSize=1000';">
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
	window.onload=function()//用window的onload事件，窗体加载完毕的时候  http://www.meididi.com.cn/meididi/
	{
		
		
		getActivityType();
		getCommodity();
		automatic();

	}
	function sub(){
		
	$.ajax({
        cache: true,
        type: "POST",
        url:"${ctx}/mall/mallFengAction/add",
        data:$('#enterHosForm').serialize(),// 你的formid
        async: false,
        success: function(data) {
        	var obj = jQuery.parseJSON(data);
        	var d=obj.result;
        	alert(d);
        	if(d=="success"){
        		location.reload();
        	}
            
        }
    });
	}
	function automatic(){
		//自动选择  项目类型
		var cpt=$("#cpType").val();	
		if(cpt>0){
		$("#pt").val(cpt).change();
		}
		//自动选择 活动类型
		var type=$("#type").val();	
		if(type>0){
			
			$("#friend").val(type).change();
		}
		
		
		
		//自动选择 商品
		var commodityId=$("#commodityId").val();
		if(commodityId>0){
		$("#commodity").val(commodityId).change();
		}
		
	}
	//获取活动类型
	function getActivityType(){
		$.ajax({	
			url:"${contextPath}/api/mallFengAction/activityType",
			 dataType: "json", 
				async:false,
				success: function (data) {  
					var result =[];
					result= data["result"];//获取json中的 key
					var friends = $("#friend");
					friends.empty();
					for(var i=0;i<result.length;i++) {
						//if(result[i].value!=5&&result[i].value!=2){
							
						
					    var option = $("<option >").text(result[i].name).val(result[i].value)
					    friends.append(option);
					//	}
					}
					
					
					
				}
	})
	}
	//获取商品列表
	function getCommodity(){
		
		$.ajax({	
				url:"${contextPath}/api/mallCommodityAction/list",
				 dataType: "json", 
					async:false,
					success: function (data) {  
						var result =[];
						result= data["result"];//获取json中的 key
						var friends = $("#commodity");
						friends.empty();
						for(var i=0;i<result.length;i++) {
						    var option = $("<option >").text(result[i].title).val(result[i].id)
						    friends.append(option);
						}
					}
		})
		
	}
	//控制选择类别
	$('#pt').change(function(){ 
		
		var type=$(this).children('option:selected').val();//这就是selected的值 
		if(type==2){
			 
			 $("#licommodity").hide();     //如果元素为显现,则将其隐藏
			 $("#liproject").show();    //如果元素为隐藏,则将它显现
			 $.ajax({	
					url:"${contextPath}/api/project/getProjectList?currentPage=1&pageSize=1000&apiType=1",
					 dataType: "json", 
						async:false,
						success: function (data) {  
							var result =[];
							result= data["result"];//获取json中的 key
							var friends = $("#project");
							friends.empty();
							for(var i=0;i<result.length;i++) {
							    var option = $("<option >").text(result[i].name).val(result[i].id)
							    friends.append(option);
							}
							//自动选择 项目
							var projectId=$("#projectId").val();
							if(projectId>0){
								friends.val(projectId).change();
							}
						}
			})
			
			
		}else{
			$("#liproject").hide();     //如果元素为显现,则将其隐藏
			$("#licommodity").show();    //如果元素为隐藏,则将它显现
		}
		}) 
	
	
	
	
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