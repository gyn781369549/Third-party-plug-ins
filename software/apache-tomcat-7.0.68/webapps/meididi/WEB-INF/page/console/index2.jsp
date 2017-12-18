<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/page/console/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录后首页</title>
<link href="${ctx}/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/jquery_180.js"></script>
<script language="javascript" src="${ctx}/js/nongli.js"></script>

<script type="text/javascript">
	//左边开关
	$(document).ready(function() {
		$("#index_left03").hide();
		//点击关闭菜单
		$("#index_left02").click(function() {
			//$("#index_man_left").animate({width:'5px',paddingLeft:'0px'},1000);
			//$(".index_left01").animate({width:'0px',right:'100px'},1000);
			$(".index_left01").hide();
			$("#index_left02").hide();
			$("#index_left03").show();
			$("#index_man_left").css({
				"width" : "5px",
				"padding-left" : "0px"
			});
		});
		//打开菜单
		$("#index_left03").click(function() {
			//$("#index_man_left").animate({width:'205px',paddingLeft:'5px'},1000);
			//$(".index_left01").animate({width:'200px',right:'0px'},1000);
			$(".index_left01").show();
			$("#index_left02").show();
			$("#index_left03").hide();
			$("#index_man_left").css({
				"width" : "205px",
				"padding-left" : "5px"
			});
		});
	});
	//左边二级菜单效果
	$(document).ready(function() {
		$("#index_leftcd>dd>dl>dd").hide();
		$.each($("#index_leftcd>dd>dl>dt"), function() {
			$(this).click(function() {
				$("#index_leftcd>dd>dl>dd ").not($(this).next()).slideUp();
				$(this).next().slideToggle(500);
			});
		});
	});
</script>
</head>
<body>
	<div class="indextop_01">
		<div class="indextop_02">
			<div class="indextop_03"></div>
			<div class="indextop_04">
				<span>欢迎：${admin.name }</span> <a
					href="${ctx}/console/user_input?user.id=${admin.id }">修改密码</a>|<a
					href="${ctx}/logout.action" target="_parent"
					onClick="return confirm('您确定要退出吗？')">安全退出</a>
			</div>
		</div>
	</div>
	<div class="indextop_01">
		<table class="index_man" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="index_man_left" id="index_man_left">
					<div class="index_left01">
						<div class="index_left04" id="index_leftcd">
							<dd>
								<dl>
									<dt>系统模块</dt>
									<dd>
										<ul>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/admin_list.action" target="main_right">管理员管理</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/role_list.action" target="main_right">权限管理</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/user_list.action" target="main_right">用户管理</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/product_list.action"
												target="main_right">作品管理</a></li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/buy_list.action"
												target="main_right">求购管理</a></li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/order_list.action" target="main_right">订单管理</a>
											</li> 
											 <li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/attract_list.action"
												target="main_right">广告招商管理</a></li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/delivery_list.action"
												target="main_right">广告投放管理</a></li>

										</ul>
									</dd>
								</dl>
							</dd>

							<dd>
								<dl>
									<dt>数据管理</dt>
									<dd>
										<ul>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/firstType_list.action" target="main_right">商品栏目</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/secondType_list.action" target="main_right">商品类型</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/dict_list.action?way=country"
												target="main_right">国家地区</a></li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/dict_list.action?way=definition" target="main_right">清晰度</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/dict_list.action?way=dub"
												target="main_right">配音</a></li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/dict_list.action?way=doc"
												target="main_right">版权文书</a></li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'">
												<a href="${ctx}/console/publishScope_list.action" 
													target="main_right">发行范围</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'">
												<a href="${ctx}/console/dict_list.action?way=employees" 
													target="main_right">员工人数</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'">
												<a href="${ctx}/console/dict_list.action?way=companyType"
													target="main_right">公司性质</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'">
												<a href="${ctx}/console/dict_list.action?way=money"
													target="main_right">资金</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'">
												<a href="${ctx}/console/dict_list.action?way=adType"
													target="main_right">投入方式</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'">
												<a href="${ctx}/console/dict_list.action?way=industry"
													target="main_right">行业类型</a>
											</li>
										</ul>
									</dd>
								</dl>
							</dd>

							<%-- <dd>
								<dl>
									<dt>关于我们</dt>
									<dd>
										<ul>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/company_input.action"
												target="main_right">公司简介</a></li>
										</ul>
									</dd>
								</dl>
							</dd> --%>

							<%-- <dd>
								<dl>
									<dt>消息模块</dt>
									<dd>
										<ul>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/msg_list.action" target="main_right">发送消息</a>
											</li>

											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/email_list" target="main_right">发送邮件</a>
											</li>
											<li class="index_left05"
												onmouseover="this.className='index_left06'"
												onmouseout="this.className='index_left05'"><a
												href="${ctx}/console/sms_list" target="main_right">发送短信</a>
											</li>
										</ul>
									</dd>
								</dl>
							</dd> --%>
						</div>
					</div>
					<div id="index_left02" title="关闭面板"></div>
					<div id="index_left03" title="打开面板"></div>
				</td>
				<td valign="top" class="index_man_right" id="index_man_right">
					<iframe name="main_right" id="kuangjia_01" src="" width="100%"
						border="0" frameborder="0"
						style="float: left; padding: 0px; margin: 0px;">
						浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
				</td>
				<td class="index_man_right02"></td>
			</tr>
		</table>
	</div>
	<div class="indextop_01">
		<div class="index_man01">
			
			<div class="index_man03">
				今天是：
				<script>
					CalConv();
				</script>
				&nbsp;时间：<span id="time24"></span>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var div_height = 0;
		var div_width = 0;
		function huoqi_liulanqichicun() //函数：获取尺寸
		{
			//获取窗口宽度
			if (window.innerWidth)
				div_height = window.innerWidth;
			else if ((document.body) && (document.body.clientWidth))
				div_height = document.body.clientWidth;
			//获取窗口高度
			if (window.innerHeight)
				div_width = window.innerHeight;
			else if ((document.body) && (document.body.clientHeight))
				div_width = document.body.clientHeight;
			//通过深入Document内部对body进行检测，获取窗口大小
			if (document.documentElement
					&& document.documentElement.clientHeight
					&& document.documentElement.clientWidth) {
				div_height = document.documentElement.clientHeight;
				div_width = document.documentElement.clientWidth;
			}
			document.getElementById("index_man_left").style.height = div_height
					- 130 + "px";
			document.getElementById("index_man_right").style.height = div_height
					- 130 + "px";
			document.getElementById("index_left02").style.marginTop = div_height
					/ 2 - 70 + "px";
			document.getElementById("index_left03").style.marginTop = div_height
					/ 2 - 70 + "px";
			document.getElementById("kuangjia_01").style.height = div_height
					- 130 + "px";
		}
		huoqi_liulanqichicun();
		//调用函数，获取数值
		window.onresize = huoqi_liulanqichicun;
	</script>
</body>
</html>
