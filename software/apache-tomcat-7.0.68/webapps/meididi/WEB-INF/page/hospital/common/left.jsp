<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="left_cont">
	<!--left Start-->
	<div class="meidd_left_box" id="meiddLeft">
		<nav class="administrator_menu">
			<div class="menus_box">
                <p class="menus_t">医院信息</p>
                <ul class="menus">
                    <li class="over">
                    	<a target="main_content" onclick="setMenu(this,'information_basic')">医院信息</a></li>
                </ul>
            </div>
            <div class="menus_box">
                <p class="menus_t">咨询师管理</p>
                <ul class="menus">
                    <li ><a target="main_content" onclick="setMenu(this,'consultant_list')">咨询师列表</a></li>
                    <li ><a target="main_content" onclick="setMenu(this,'consultant_input')">创建咨询师</a></li>
                </ul>
            </div>
            <div class="menus_box">
                <p class="menus_t">项目管理</p>
                <ul class="menus">
                    <li ><a target="main_content" onclick="setMenu(this,'project_list')">项目列表</a></li>
                    <li ><a target="main_content" onclick="setMenu(this,'project_input')">创建项目</a></li>
                </ul>
            </div>
            <div class="menus_box">
                <p class="menus_t">订单管理</p>
                <ul class="menus">
                    <li ><a target="main_content" onclick="setMenu(this,'order_list')">订单列表</a></li>

                </ul>
            </div>
            <div class="menus_box">
                <p class="menus_t">财务管理</p>
                <ul class="menus">
                    <li ><a target="main_content" onclick="setMenu(this,'order_overList')">结算列表</a></li>
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
}
</script>