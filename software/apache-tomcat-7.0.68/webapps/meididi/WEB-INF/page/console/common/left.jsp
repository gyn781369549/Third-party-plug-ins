<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="left_cont">
	<!--left Start-->
	<div class="meidd_left_box" id="meiddLeft">
		<div class="administrator_infor">
			<p class="administrator_pic" onclick="upIcon()">
				<c:if test="${empty session.admin.photo || session.admin.photo=='' }">
					<img src="${ctx }/assets/images/admin_pic.png" alt="">
				</c:if>
				<c:if test="${!empty session.admin.photo && session.admin.photo!='' }">
					<img src="${ctx }/upload${session.admin.photo}" >
				</c:if>
				
			</p>
			<p class="administrator_txt">
				<span class="f18">美滴滴管理员</span>
			</p>
			<p class="btn_administrator">
				<input type="button" class="input_green mr30" value="修改密码" onclick="resetAdminPsd()"> <a
					href="${ctx }/console/admin_out"><input type="button" class="input_pink"
					value="安全退出"></a>
			</p>
		</div>
		<nav class="administrator_menu">
			<div class="menus_box">
				<p class="menus_t">医院账号管理</p>
				<ul class="menus">
					<li class="over"><a target="main_content" onclick="setMenu(this,'${ctx}/console/hospitalAccount_list')" >医院账号列表</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/hospitalInf_list')">医院信息录入</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/consultant_list?way=reg')">客户端申请</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/consultant_list')">咨询师列表</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/hospitalInf_images')">图片列表</a></li>
			
					
					</ul>
			</div>
			<div class="menus_box">
				<p class="menus_t">专题管理</p>
				<ul class="menus">
					
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/api/getThemeListHt')">专题发布</a></li>
				</ul>
			</div>
			<div class="menus_box">
				<p class="menus_t">广告管理</p>
				<ul class="menus">
					
				<li><a target="main_content" onclick="setMenu(this,'${ctx}/web/adv/ht_List')">广告发布</a></li>
				
				
				</ul>
			</div>
			<div class="menus_box">
				<p class="menus_t">商城管理</p>
				<ul class="menus">
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/mall/mallCommodityAction/typeList?type=1')">类别管理</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/mall/mallCommodityAction/listView?pageSize=1000')">商品管理</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/mall/mallOrdersAction/listView?pageSize=1000')">订单管理</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/mall/mallFengAction/listView?pageSize=1000')">活动管理</a></li>
				</ul>
			</div>
			<div class="menus_box">
				<p class="menus_t">统计管理</p>
				<ul class="menus">
					
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/api/forum/indexLook')">统计信息</a></li>
				</ul>
			</div>
			<div class="menus_box">
				<p class="menus_t">咨询用户管理</p>
				<ul class="menus">
					<li><a  target="main_content" onclick="setMenu(this,'${ctx}/console/user_list')">咨询用户列表</a></li>
				</ul>
			</div>
			<div class="menus_box">
				<p class="menus_t">项目管理</p>
				<ul class="menus">
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/project_list')">项目列表</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/tips_list')">标签列表</a></li>
				</ul>
			</div>
			<div class="menus_box">
				<p class="menus_t">订单管理</p>
				<ul class="menus">
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/order_list')">订单列表</a></li>
					
					<!-- <li><a target="main_content" onclick="setMenu(this,'')">申述处理</a></li>
					<li><a target="main_content" onclick="setMenu(this,'')">服务完结确认</a></li> -->
				</ul>
			</div>
			<div class="menus_box">
				<p class="menus_t">财务管理</p>
				<ul class="menus">
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/overList')">医院结算列表</a></li>
					<!--  --><li><a target="main_content" onclick="setMenu(this,'${ctx}/mall/mallSellRecordAction/listView')">商城医院结算列表</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/apply_list')">咨询师结算列表</a></li>
					<li><a target="main_content" onclick="setMenu(this,'${ctx}/console/refund_list')">退款审核</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<!--left End-->
	<a href="javascript:;" id="btnLeft" class="btnLeft"></a>
</div>
<script>
//main_content
function setMenu(node,url){
	$('#main_content').attr("src",url);
	$('#menu_title strong')
	var home=$(node).parent().parent().parent().find("p").text();
	var sub=$(node).text();
	$('#menu_title strong').text(home);
	$('#menu_title b').text(sub);
	//console.info(home+"11111"+sub);
}
</script>