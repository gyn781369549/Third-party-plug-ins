<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
</head>
<body style="background:transparent;">
<div class="bwh_crumbs">
        <h1>完善医院信息，为咨询师提供更好的咨询信息。</h1>
        当前位置：<a href="#" title="医院资料">医院资料</a><em>&gt;</em><a href="#" title="医院信息">医院信息</a><em>&gt;</em>医疗团队
    </div>
    <div class="tabBox">
        <ul class="tabNav">
           <li><a href="${ctx }/hospital/information_basic">基础信息</a></li>
           <li><a href="${ctx }/hospital/information_tips">标签信息</a></li>
           <li class="now"> <a href="${ctx }/hospital/information_teams">医疗团队</a></li>
        </ul>
        <div class="tabCont base_infor">内容1</div>
        <div class="tabCont label_infor">内容2</div>
        <div class="tabCont dmat_box" style="display:block;">
            <div class="dmat_team_intro">
                <h1>医疗团队介绍</h1>
                <div class="intro_box">
                	${information.teamInf }
                </div>
            </div>
            <div class="dmat_team_intro">
                <h1>医疗精英信息</h1>
                <ul class="elite_infor">
                	
                    <c:forEach var="team" items="${teams}" varStatus="status">
                		<li <c:if test="${status.index%2==0 }">class='mr20'</c:if>>
                		<div class="elite_pic_intro">
                			<input type="hidden" name="teamId" value="${team.id }"/>
                    		<p class="elite_pic">
                       		<img src="${ctx }/upload${team.photo }">
                       		<span class="elite_load_img">${team.name }</span>
                    		<a href="${ctx }/preview?id=${team.id }&way=hospital/information_teamPre" target="_blank" title="预览推送" class="load_head">预览推送</a>
                    		</p>
                    		<p class="elite_zishu">${team.information}</p>
                		</div>
                	</li>
                	</c:forEach>                           
                </ul>
            </div>
        </div>
    </div>
    <div class="btn_tab">
    <input value="修改信息" onclick="window.location.href = '${ctx}/hospital/information_teams?id=${information.id }'" class="input_green mr20" type="button">
    </div>

<!--right End-->
<div class="popup_bg " style="display:none;"></div>
<div class="popup_box push_preview_box infosuc" id='previedDiv' style="display:none;">
    <cite class="popup_t">预览</cite>
    <div class="popup_cont">
        <div class="push_preview">
            <h1>医师团队精英</h1>
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

<script>
$().ready(function(){
});
    function previewHospital(img, title, desc, id) {

        var baseUrl = '';
        $('#previewIframe').attr('src', baseUrl + '&id=' + id);
        $('.popup_bg').show();
        $('.infosuc').show();
        //统一的h5页面地址
//        var url = '&id=' + tid + '&h_id=' +16;
//        $('#previewIframe').attr('src', '');

//        var html = '<h1 class="jig_jies nedic">' +
//                '<p class="nedic_img"><img src="'+img+'" alt=""></p>' +
//                '<p class="nedic_name">'+title+'</p>' +
//                '</h1>' +
//                '<blockquote>'+desc+'</blockquote>' ;
//        
//        $(window.frames["previewIframe"].document).find('#desc').html(html);
    }

    function closePop() {
        $('.popup_bg').hide();
        $('.infosuc').hide();
    }

</script>
            <!--rightMenu-->

 
</body>
</html>