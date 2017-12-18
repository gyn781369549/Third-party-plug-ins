<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
<style type="text/css">
.hos_pre{
background: rgba(121,210,190,.4)!important;
    color: #fff;
	border-radius: 2px;
    width: 165px;
    height: 40px;
    line-height: 40px;
    color: #fff;
    border: 0;}
</style>
<link rel="stylesheet" type="text/css" href="${ctx}/assets/css/fsgallery.css"> 

</head>
<body style='background:transparent'>

 <!--right Start-->
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
                	<c:if test="${information.logo!='' }">
                		<img src="${ctx }/upload${information.logo}"/>
                	</c:if>
                	<c:if test="${information.logo=='' }">
                		<img src="${ctx }/assets/images/default_face.gif" />
                	</c:if>
                </p>
                <div class="basis_cont">
                    <ul>
                        <li>
                            <span class="basis_name"><em></em>医院名称</span>
                            <p>${information.name }</p>
                        </li>
                        <li>
                            <span class="basis_name"><em></em>医院联络人</span>
                            <p>
                            <strong>${information.contacts }</strong>
                            <span class="basis_name">手机号码</span>
                            <strong>${information.phone }</strong>
                            </p>
                        </li>
                        <li>
                            <span class="basis_name"><em></em>医院地址</span>
                            <p><strong style="width: auto">${information.countries} ${information.address }</strong></p>
                        </li>
                        <li>
                            <span class="basis_name"><em></em>联络邮箱</span>
                            <p>${information.email}</p>
                        </li>
                        <li>
                            <span class="basis_name"><em></em>医院网址</span>
                            <p>${information.url}</p>
                        </li>
                        <li>
                            <span class="basis_name tt"><em></em>医院介绍</span>
                            <p>
                            	${information.information}
                            </p>
                        </li>
                        <li>
                        	
                            <span class="basis_name tt"><em></em></span>
                            <dl class="uploading_img_dl">
                            <ul id="gallery">
                               <c:if test="${information.imgs !=''}">
                        		<c:if test="${fn:contains(information.imgs,',')}">
                        			<c:forEach var="img" items="${fn:split(information.imgs,',')}">
                        	 			<dd>
                        	 			<li>
                        	 			<a href="${ctx }/upload${img}" data-type="image">
                                		<img id="iconPreview1" src="${ctx }/upload${img}" onerror="this.src='${ctx }/assets/images/figure.png'">
                                		</a>
                                		</li>
                            			</dd>
                        			</c:forEach>
                        		</c:if>
                        		<c:if test="${!fn:contains(information.imgs,',')}">
                        			<dd>
                                		<img id="iconPreview1" src="${ctx }/upload${information.imgs}"  onerror="this.src='${ctx }/assets/images/figure.png'">
                            		</dd>
                        		</c:if>
                        	</c:if>
                        	</ul> 	
                            </dl>
                          
                        </li>
                    </ul>
                
            </div>
        </div>
        <div class="btn_tab">
            <input value="修改信息" onclick="window.location.href = '${ctx}/hospital/information_basic?id=${information.id }'" class="input_green mr20" type="button">
            <input value="预览推送" onclick="window.open('${ctx }/preview?id=${information.id }&way=hospital/information_hospitalPre')" class="input_green mr20" type="button">
        </div>
<!--right End-->

<div class="popup_bg" style="display:none;"></div>

<!--上传LOGO start-->
<div class="popup_box push_preview_box infosuc" style="display: none" style="top:15% !important">
    <cite class="popup_t">预览</cite>
    <div class="popup_cont">
        <div class="push_preview">
            <h1>系统已根据您填写修改的医院基础信息</h1>
            <h1>为您生成了推送卡</h1>
            <h2>推送卡支持咨询师直接从手机端发送给用户查阅</h2>
            <div class="push_tel_box">
                <div class="push_tel" style='height:362px;margin-left: 19px;margin-top: -1px;width: 197px;'>
                    <iframe style='width:197px;height:357px;overflow: hidden;' id="previewIframe" border='0' frameborder='0' name='previewIframe' src=""></iframe>
                </div>
            </div>
        </div>
        <p class="popup_btn">
            <input type="button" onclick="closePop();" value="返回" class="input_green m0" />
        </p>
    </div>
</div>
<div class="popup_box infoerror" style="display:none;">
    <cite class="popup_t">预览</cite>
    <div class="popup_cont">
        <div class="uploading_cont tc">
            <p class="c_pink f18 mt60">请先完善医院信息</p>
            <p>您填写的医院信息不完善，无法实现推送信息</p>
        </div>
        <p class="popup_btn">
            <input type="button" value="知道了" class="input_green" onclick="closePop()" />
        </p>
    </div>
</div>

<!--上传LOGO end-->
<script>
$().ready(function(){
	
});
    function previewHospital(img, title, desc) {
        $('.popup_bg').show();
            $('.infosuc').show();

    }
    function closePop() {
        $('.popup_bg').hide();
            $('.infosuc').hide();
    }
</script>
<!--rightMenu-->
<script type="text/javascript" src="${ctx}/assets/js/fs_forse.js"></script>
 
</body>
</html>