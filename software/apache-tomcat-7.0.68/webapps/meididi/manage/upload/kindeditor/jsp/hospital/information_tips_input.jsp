<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
</head>
<body style="background:transparent;">

 <!--right Start-->
	<div class="bwh_crumbs">
        <h1>完善医院信息，为咨询师提供更好的咨询信息。</h1>
        当前位置：<a href="#" title="医院资料">医院资料</a><em>&gt;</em><a href="#" title="医院信息">医院信息</a><em>&gt;</em>标签信息
    </div>
    <form action="${ctx }/hospital/information_tips" method="post">
    	<input type="hidden" name="id" value="${information.id }" />
        <div class="tabBox">
           <ul class="tabNav">
           <li><a href="${ctx }/hospital/information_basic">基础信息</a></li>
           <li class="now"><a href="${ctx }/hospital/information_tips">标签信息</a></li>
           <li > <a href="${ctx }/hospital/information_teams">医疗团队</a></li>
            </ul>
            <div class="tabCont label_infor" style="display:block;">
                <ul class="label_box" id="label_cur">
                	<c:set var="tips" value="${fn:split(information.tips,',') }"></c:set>
                	<c:if test="${fn:length(tips)>=1 }">
                		
						<c:forEach var="tip" items="${tips }">
							<c:if test="${tip!=null&&tip!='' }">
								<li p_id="${tip }" class="tipsLi">
								<input type="hidden" name="tips" value="${tip}" />
								<a href="#" title="${allTips[tip] }">${allTips[tip]}</a>
								<em class="ico_label_del">×</em>
								</li>
							</c:if>
							
						</c:forEach>
					</c:if>
                                            
                    <li style="display:none" id="addTagsFlag" class="label_add"><a href="#" title="添加标签">+&nbsp;添加标签</a></li>
                </ul>
                <div class="label_all">
                    <h6>待选标签<span></span></h6>
                    <ul class="label_box label_list" id="label_ready">
                    	<c:if test="${fn:length(allTips)>0 }">
						<c:forEach var="tip" items="${allTips }">
							<c:set var="id" value="${tip.key }"></c:set>
							<c:set var="val" value="${tip.value}"></c:set>
							<li p_id="${tip.key }" <c:if test="${fn:contains(information.tips,tip.key)}">class='now'</c:if>>
								<a href="javascript:addTag(${id},'${val }');" title="${val }">${val }</a> 
							</li> 
						</c:forEach>
					</c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn_tab"><input value="保存修改" class="input_green mr20" type="submit"><input value="返回" onclick="window.location.href = ''" class="input_green" type="button"></div>
    </form>

<!--right End-->
<script>
	 
	//var tips = ${allTips};


	
    function addTag(tag_id, tag_name) {
    	var tipsLi = $(".tipsLi");
    	var fla = true;
    	//防止重复添加
    	if(tipsLi.length>0){
    		$.each(tipsLi,function(i,v){
        		var id = $(this).attr("p_id");
        		if(id==tag_id){
        			fla =false;
        			return false;
        		}
        	});
    	}
    	if(fla){
    		var tag_html = '<li p_id="' + tag_id + '" class= "tipsLi" ><input type="hidden" name="tips" value="' + tag_id + '" /><a href="#" title="' + tag_name + '">' + tag_name + '</a><em class="ico_label_del">×</em></li>';
            //label_cur.push(tag_id);
            $('#addTagsFlag').before(tag_html);
            $('li[p_id=' + tag_id + ']').addClass('now');
    	}
        //禁止重复添加
        /* for (var i in label_cur) {
            if (tag_id == label_cur.key) {
                return;
            }
        } */
        
    }

    /**
     * 点击小X号，取消掉标签
     */
    $('.ico_label_del').live('click', function () {
        $(this).parent().remove();
        var id = $(this).parent().attr('p_id');
        $('li[p_id=' + id + ']').removeClass('now');

        for (var i in label_cur) {
            if (id == label_cur[i]) {
                label_cur[i] = 0;
            }
        }
    });


    
</script> 
            <!--rightMenu-->
 
</body>
</html>