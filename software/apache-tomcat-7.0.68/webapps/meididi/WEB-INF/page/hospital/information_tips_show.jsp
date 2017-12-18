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
			<div class="tabBox">
				<ul class="tabNav">
				 	<li><a href="${ctx }/hospital/information_basic">基础信息</a></li>
          	 		<li class="now"><a href="${ctx }/hospital/information_tips">标签信息</a></li>
           			<li > <a href="${ctx }/hospital/information_teams">医疗团队</a></li>
				</ul>
				<div class="tabCont base_infor"></div>
				<div class="tabCont label_infor" style="display:block;">
					<ul class="label_box">
						<c:set var="tips" value="${fn:split(information.tips,',') }"></c:set>
						<c:if test="${fn:length(tips)>0 }">
							<c:forEach var="tip" items="${tips}">
							<c:if test="${tip!=null&&tip!='' }">
	                		<li p_id="${tip}">
	                    		<input type="hidden" name="tips" value="${tip}">
	                     		<a href="#" title="${allTips[tip] }">${allTips[tip] }</a>
	                     	</li>
	                     	</c:if>
	                		</c:forEach>
						</c:if>				
					<li class="label_add"><a href="${ctx }/hospital/information_tips?id=${information.id}" title="编辑标签">+&nbsp;编辑标签</a></li>
					</ul>
				</div>
			</div>
		<!--right End-->
</body>
</html>