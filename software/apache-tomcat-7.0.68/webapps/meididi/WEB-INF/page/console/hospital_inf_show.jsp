<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/assets/css/fsgallery.css">

</head>
<body>
        <!--right Start-->
        <ul class="tabNav" id="tabNav">
            <li class="now" attr="basic">基础信息</li>
            <li attr="tags" class="">标签信息</li>
            <li attr="teams" class="">医疗团队</li>
        </ul>
        <div class="tabCont" id="basic" style="display: none;">
            <p class="head_pic">
                <img id="iconPreview0" src="${ctx}/upload${hospitalInformation.logo}" >
            </p>
            <div class="basis_cont">
                <ul>
                    <li>
                        <span class="basis_name">医院名称</span>
                        <p>${hospitalInformation.name}</p>
                    </li>
                    <li>
                        <span class="basis_name">医院联络人</span>
                        <p>
                            <strong>${hospitalInformation.contacts}</strong>
                            <span class="basis_name">联系电话</span>
                            <strong>${hospitalInformation.phone}</strong>
                        </p>
                    </li>
                    <li>
                        <span class="basis_name">医院地址</span>
                        <p>
                        	<c:forEach var="city" items="${fn:split(hospitalInformation.countries,',')}">
                        		${city}
                        	</c:forEach>
                       	</p> 
                        <p>${hospitalInformation.address}</p>
                    </li>
                    <li>
                        <span class="basis_name">联络邮箱</span>
                        <p>${hospitalInformation.email}</p>
                    </li>
                    <li>
                        <span class="basis_name">医院网址</span>
                        <p>${hospitalInformation.url}</p>
                    </li>
                    <li>
                        <span class="basis_name tt">医院介绍</span>
                        <p class="w650">
                            <mark>${hospitalInformation.information}</mark>
                        </p>
                    </li>
                    <li>
                        <!--<span class="basis_name tt">轮播图片</span>-->
                        <dl class="uploading_img_dl " style="left: 0px;">
                    	<ul id="gallery">
                        	<c:if test="${!empty hospitalInformation.imgs}">
                        		<c:if test="${fn:contains(hospitalInformation.imgs,',')}">
                        			<c:forEach var="img" items="${fn:split(hospitalInformation.imgs,',')}">
                        	 			
                        	 			<dd>
                        	 			<li>
                        	 				
                        	 				<a href="${ctx }/upload${img}" data-type="image">
                                			<img id="iconPreview1" src="${ctx }/upload${img}" >
                                			</a>
                                			
                            			</li>
                            			</dd>
                        			</c:forEach>
                        		</c:if>
                        		<c:if test="${!fn:contains(hospitalInformation.imgs,',')}">
                        			<dd>
                        				
                        				<a href="${ctx }/upload${img}">
                                		<img id="iconPreview1" src="${ctx }/upload${hospitalInformation.imgs}" >
                                		</a>
                                		
                            		</dd>
                        		</c:if>
                        	</c:if>
                        </ul>
                        </dl>
                    </li>
                </ul>
                <div class="btn_tab">
                    <input value="编辑" class="input_green mr20 zt_basic_btn" type="button" onclick="window.location.href = '${ctx}/console/hospitalInf_input?hospitalInformation.id=${hospitalInformation.id }&edited=basic'">
                    <input value="返回列表" class="input_green" type="button" onclick="window.location.href = '${ctx}/console/hospitalInf_list'">
                </div>
            </div>
        </div>
        <div class="tabCont label_infor" id="tags" style="display: none;">
            <div class="label_all">
                <h6>已选标签</h6>
                <ul class="label_box" id="label_cur">
                	<c:if test="${hospitalInformation.tips !=null }">
	                	<c:forEach var="tip" items="${fn:split(hospitalInformation.tips,',')}">
	                		<li p_id="${tip}">
	                    		<input type="hidden" name="tips" value="${tip}">
	                     		<a href="#" title="${allTips[tip] }">${allTips[tip] }</a>
	                     	</li>
	                	</c:forEach>
                	</c:if>
                	
                    
                </ul>
            </div>
            <div class="label_all">
                <h6>待选标签<span></span></h6>
                <ul class="label_box label_list" id="label_ready">
                	<c:forEach var="tip" items="${allTips }">
                		<li p_id="${tip.key }"><a href="javascript:void(0);" title="${tip.value }">${tip.value }</a></li>
                	</c:forEach>
	                 
                	</ul>
                <!-- <p class="label_cut clearfix"><a href="javascript:previousPage();" title="上一组" class="fl"><i class="icon-backward"></i>上一组</a><a href="javascript:nextPage();" title="下一组" class="fr"><i class="icon-forward"></i>下一组</a></p> -->
            </div>
            <div class="btn_tab" style="padding:0 20px">
                <input value="编辑" class="input_green mr20 zt_basic_btn" type="button" onclick="window.location.href = '${ctx}/console/hospitalInf_input?hospitalInformation.id=${hospitalInformation.id }&edited=tags'">
                <input value="返回列表" class="input_green" type="button" onclick="window.location.href ='${ctx}/console/hospitalInformationInf_list'">
            </div>
        </div>
        <div class="tabCont dmat_box" id="teams" style="">
            <div class="dmat_team_intro">
                <h1>
                <em class="icon_vereist"></em>医疗团队介绍
                </h1>
                <div class="intro_box">
                	<p>${hospitalInformation.teamInf }</p>
                </div>
            </div>
            <div class="dmat_team_intro">
                <h1><em class="icon_vereist"></em>医疗精英信息</h1>
                <ul class="elite_infor">
                	<c:forEach var="team" items="${teams}">
                		<li class="mr20">
                		<div class="elite_pic_intro">
                    		<p class="elite_pic">
                       		<img src="${ctx }/upload${team.photo }" onerror="this.src='${ctx }/assets/images/elite_charts.png'">
                       		<span class="elite_load_img">${team.name }</span>
                    		</p>
                    		<p class="elite_zishu">${team.information}</p>
                		</div>
                	</li>
                	</c:forEach>
                  </ul>
               </div>
            <div class="btn_tab">
                <input value="编辑" class="input_green mr20 zt_basic_btn" type="button" 
                	onclick="window.location.href ='${ctx}/console/hospitalInf_input?hospitalInformation.id=${hospitalInformation.id}&edited=teams'">
                 
                <input value="返回列表" class="input_green" type="button" onclick="window.location.href = '${ctx}/console/hospitalInf_list'">
            </div>
        </div>

<script>

    $(document).ready(function () {

        $('#tabNav').children().click(function () {
            var id = $(this).attr('attr');
            $('.tabCont').hide();
            $('#' + id).show();
            $(this).siblings().removeClass('now');
            $(this).addClass('now');
        });
        
        
    });
    
    var hospitalInformationTips = '${hospitalInformation.tips }';
	var edited = '${edited}';
	
</script>                <!--right End-->

    <script type="text/javascript" src="${ctx}/assets/js/fs_forse.js"></script>
	<script type="text/javascript" src="${ctx }/assets/js/hos.addInf.js"></script>
</body></html>