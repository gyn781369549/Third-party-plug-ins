<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html lang='zh-CN'>
<head>
	<c:set var="ctx" value="${pageContext.request.contextPath}" />
	<script type='text/javascript' src='${ctx }/assets/js/jquery.min.js'></script>
	<script type='text/javascript' src='${ctx }/assets/plugins/layer/layer.js'></script>
	<link rel='stylesheet' type='text/css' href='${ctx }/assets/css/consult/base.css'/>
	<link rel='stylesheet' type='text/css' href='${ctx }/assets/css/jquery.ui.datepicker.css'/>
	<script type="text/javascript" src="${ctx}/assets/js/jquery.ui.core.js"></script>
	
	<script type="text/javascript" src="${ctx}/assets/js/jquery.uploadify.img.js"></script>
	<script type='text/javascript'>
	    window['SCHEMETYPE'] = 'http';
	    if(navigator.userAgent.indexOf('MSIE 9')!=-1){
	      window.WEB_XHR_POLLING = true;
	    }
	</script>
	<script src="http://cdn.ronghub.com/RongIMLib-2.1.3.min.js"></script>
	<script src="http://cdn.ronghub.com/RongEmoji-2.1.3.min.js"></script>
	<script src="http://cdn.ronghub.com/RongIMVoice-2.1.3.min.js"></script>
</head>
<body >
	<input type="hidden" id="targetId" value=""/>
	<input type="hidden" id="targetName" value=""/>
	<input type="hidden" id="targetPhoto" value=""/>
	<div class='box'>
		<!--左侧-->
		<div class='left'>
			<div class='head'>
				<div id='user_menu'>
					<div data-toggle='dropdown' class='menuDropdown js-menuDropdown'>
					<div id='current_user_avatar'>
					<img class='member_image thumb_48 logo js-my-logo' src='${ctx}/upload${consult.photo }' id='mylogo'></div>
					<span id='current_user_name' class='overflow_ellipsis js-customer-service' title=''>${consult.name }</span> 
					<span id='connection_style' class='js-server-group'>${consult.hosName}</span> 
					</div>
					
				</div>
				<div id="out">
					<a href="javascript:;" onclick="out()">退出</a>
				</div>
			</div>
			<ul class='mainNav'>
				<li>
					<ul class='nav nav-tabs js-tab-ul' id='main_tab' style="height: 30px; margin-bottom: 10px;">
						<li class='js-tab-item active' style='float:left'>
							<!-- <span class="i1"></span> -->
							<a href='javascript:;' class="i1" select="tab1" onclick="changeTab(this)" ></a>
						</li>
						<li class='js-tab-item' style='float: left'>
							<!-- <span class="i2"></span> -->
							<a href='javascript:;' class="i2" select="tab2" onclick="changeTab(this)"></a>
						</li>
						<li class='js-tab-item' style='float: right'>
							<!-- <span class="i3"></span> -->
							<a href='javascript:;' class="i3" select="tab3" onclick="changeTab(this)"></a>
						</li>
					</ul>
				</li>
			</ul>
			<div class='tab-content'>
				<div class='tab-pane active tab1' style="overflow-y:auto;" id='chatonline' >
					<ul id='users' class='js-users-list js-list click_user-list'>
						
					</ul>
				</div>
				
				<div class='tab2' style="display:none; overflow-y:auto;" id='exclusiveList' >
					<ul class="exclusiveTitle">
						<li class="user1 green_bg " onclick="changeExclusive(this)">专属用户</li>
						<li class="user2" onclick="changeExclusive(this)">普通用户</li>
					</ul>
					<ul  class='user1 js-users-list js-list click_user-list'>
						
					</ul>
					<ul class='user2 js-users-list js-list click_user-list' style="display: none;">
						
					</ul>
				</div>
				<div class='tab3' style="display:none; overflow-y:auto;" id='orderList' >
					<p>订单</p>
					<ul id='orders' class='js-users-list js-list'>
						
					</ul>
				</div>
			</div>
		</div>
		<!--右侧-->
		<div class='right' >
			<div class='nick_name'>
				<p></p>
			</div>
			<div class='content' style="overflow-y:auto;">
				
			</div>

			<div style='position: absolute;  width: 100%; display: block;' class='botTextBox js-botTextBox'>
				<p class='userTextNow'></p>
				<span class='faceButton'>
					<i class='fa face faceIcon js-emotion' style='font-size:20px;cursor:pointer'></i> 
					<i id='maskFace'></i> 
				</span>
				<span class='picButton'>
					<i id='maskPhoto'></i>
					<form class='js-fileinfo' enctype='multipart/form-data' method='post'>	
						<div class="js-upload" id="uploadImg"></div>
						<!-- <input value='' type='file' class='js-upload' style='opacity:0;position:absolute;left:0;top:0;z-index:10;width:30px;cursor:pointer'> -->
						<p style='opacity:0;position:absolute;left:30px;top:0;z-index:11;width:300px;height:30px;background:green'></p>
						<i class='photoTag fa upload' style='font-size: 20px'></i>
					</form>
				</span>
				<span class="addButton">
					<i id='addPhoto'></i>
					
				</span>
				<textarea id='js-sendMessage' class='animatedTextArea form-control msg-send-input sendMessage js-sendMessage' maxlength='1024' placeholder='请输入..' style='resize: none;max-height: 54px' robot='other'></textarea>
				<div id='faceGroupTarea' style='display:none'>
					<div id='faceGroup' class='groupChildren item' style='overflow-y: auto; outline: none;' tabindex='5000'>
							
					</div>
					<div id='emojiGroup' class='groupChildren item' style='display: none; overflow-y: hidden; outline: none;' tabindex='5001'></div>
					
					<ul class='GroupTab'>
						<li class='firsticoLi icoLi active' data-tab='#faceGroup'>默认表情</li>
					</ul>
				</div>
				<div id='faceGroupTarea' style='display:none'>
					<div id='faceGroup' class='groupChildren item' style='overflow-y: hidden; outline: none;' tabindex='5000'>
							
					</div>
					<div id='emojiGroup' class='groupChildren item' style='display: none; overflow-y: hidden; outline: none;' tabindex='5001'></div>
					
					<ul class='GroupTab'>
						<li class='firsticoLi icoLi active' data-tab='#faceGroup'>默认表情</li>
					</ul>
				</div>
				
				<div id='addArea' style='display:none'>
					<div id='addGroup' class='groupChildren item' style='overflow-y: auto; height:80px; outline: none;' tabindex='5000'>
						<div class="send_project_area" onclick="openFunction('project')">
							<span id="sendProject" class="open_area_text">
							发送项目</span>
						</div>
						<div class="create_order_area" onclick="openFunction('order')">
							<span id="createOrder" class="open_area_text">创建订单</span>
						</div>
						
					</div>
				</div>
				<div>
					<button class='js-btnSend btnSend' id='btnSend' type='button'>发送</button>
				</div>
			</div>
		</div>

	</div>
	
	<!-- <div id="rob">
		<ul>
			<li><img alt="" src="">
			<div class="rob_content">
				<ul>
					<li>性别:<span>女</span></li>
					<li>年龄:<span>18</span></li>
					<li><span class="next">换一个</span></li>
				</ul>
			</div>
			
			<div class="rob_button" order_num="111" >抢单</div>
			</li>
		</ul>
		
	</div> -->
	
	<div  id="rob" style="display: none;">
        
    </div>
    <div class="rob_button_area" style="display:none; width: 200px;text-align: center;position: fixed;right: 0;bottom:20px;z-index: 11111111;">
	        <input class="rob_button" type="button" value="换一个" onclick="changeNext()"/>
	        <input class="rob_button" type="button" class="rob_button"  value="抢单"/>
	</div>
	
	<div id="project_list" >
		
		<div id = "project_list_content" style="margin-bottom: 30px;">
		</div>
		<!-- <a href ="#">
			<div class="order_list">
				<input class="selectProject" style="float: left;
    margin-top: 40px;" value="" type="checkbox">
				<div class="media">
				  <div class="media-left">
					<a href="#">
					  <img class="media-object" src="img/o15.png" alt="图片"  width="100px">
					</a>
				  </div>
				  <div class="media-body media-middle">
					<h4 class="media-heading">专业隆鼻</h4>
					<p style="color: #666;">项目简介：膨体加隆鼻+鼻尖成型术</p>
					<p style="color:#ccb98b">￥<span>2555.00</span></p>
				  </div>
				</div>
			</div>
		</a>
		<a href = "#">
			<div class="order_list">
				<div class="media">
				  <div class="media-left">
					<a href="#">
					  <img class="media-object" src="img/o15.png" alt="图片"  width="100px">
					</a>
				  </div>
				  <div class="media-body media-middle">
					<h4 class="media-heading">专业隆鼻&nbsp;&nbsp;&nbsp;&nbsp;<small>300人购买</small></h4>
					<p>项目简介：膨体加隆鼻+鼻尖成型术</p>
					<p style="color:#ccb98b">￥2555.00</p>
				  </div>
				</div>
			</div>
		</a> -->
		<div class="send_project_button">
			<a class="send_button" onclick="" href="javascript:;" >确认推送</a>
			<input type="hidden" value="">
		</div>
	</div>
	
	<div id="order_create">
		<input type='hidden' class='orderNum' value='' />
		<input type='hidden' class='projectIds' value='' />
		
		<div class="project_list">
			
		</div>
		<!-- <div class="change_project">
			<a href="javascript:;">+-项目</a>
		</div> -->
		<div class="order_desc">
			<h4>备注信息</h4>
			<textarea rows="5" cols="20" class="" placeholder="请输入"></textarea>
		</div>
		<div class="all_price">
			<p>本单金额为:￥<span>10000</span></p>
		</div>
		<div class="order_time">
			<input id="datepicker" type="text" placeholder="请输入预约时间">
		</div>
		<div class="consult_price">
			<input class="" type="text" placeholder="请输入优惠后价格">
		</div>
		<div class="pay_price">
			<input id="" type="text" placeholder="请输入预付款金额">
		</div>
		<a class="send_button" onclick="sendOrder();" href="javascript:;" >确认推送</a>
	</div>
	
	<script type="text/javascript" src="${ctx}/assets/js/jquery.ui.datepicker_mdd.js"></script>
    <script type='text/javascript'>
	
    RongIMLib.RongIMClient.init('n19jmcy59ut19', RongIMLib.ConnectionChannel.XHR_POLLING);
	
    var token = '${ryToken}';
    var sid = '${sessionScope.sid}';
    var baseUrl = '${ctx}';
    var conName = '${sessionScope.consult.name}';
    var myPhoto = baseUrl+"/upload"+'${sessionScope.consult.photo}';
    var ryId = "c"+'${sessionScope.consult.id}';
    $().ready(function(){
    	
    	$("#datepicker").datepicker({
        	changeMonth: true,
        	changeYear: true, dateFormat: 'yy-mm-dd'
        });//日期修改年份
    });
    
    
   
    //var client = RongIMLib.RongIMClient.getInstance();
	</script>
	<script type="text/javascript" src="${ctx}/assets/js/consult/ry.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/consult/index.js"></script>
	
</body>
</html>
