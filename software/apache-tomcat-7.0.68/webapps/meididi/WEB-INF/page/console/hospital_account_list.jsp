<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
<style type="text/css">
	#search_result_ul{
	    display: none;
    position: absolute;
    background: #f1f1f1;
    width: 150px;
    margin-top: 6px;}
    #search_result_ul li{
	    border-bottom: 1px solid #ccc;
	    font-size: 14px;
	    line-height: 28px;
	    padding-left: 10px;
    }
</style>
</head>
<body>
	<!--right Start-->
	<form action="hospitalAccount_list" id="foodsForm" namespace="/console"
		method="post">
		<div class="inquire_box">
			<div class="keyword_box" style="width: 177px; z-index: 999;">
				<em class="ico_search"></em> 
				<input type="text" placeholder="请输入医院名称" name="keywords" value="${keywords }"
					style="width: 140px" id="searchHosAccount">
				<ul id="search_result_ul">
				</ul>
			</div>
			
			<select class="province meidd_select"></select> <select
				class="city meidd_select" style="width: 91px;"></select> <input
				type="hidden" id="cityVal" name="countries" /> <select
				class="meidd_select" name="state">
				<option value="">全部状态</option>
				<option value="-1"
					<c:if test="${state=='-1' }">selected='selected'</c:if>>待审核</option>
				<option value="1"
					<c:if test="${state=='1' }">selected='selected'</c:if>>审核通过</option>
				<option value="0"
					<c:if test="${state=='0' }">selected='selected'</c:if>>审核不通过</option>
			</select> <input type="text" placeholder="选择时间" class="datepicker"
				style="height: 33px; line-height: 33px; width: 90px; margin-bottom: 0px;"
				class="meidd_select " name="time" value="${time }"> <input
				type="submit" class="btn_inquire" value="查询">

		</div>
		<input type="hidden" name="page">
		<s:hidden name="pagesize"></s:hidden>
		<input type="hidden" name="del" />
		<div class="inquire_list">
			<table class="table">
				<thead>
					<tr>
						<th width="5%">序号</th>
						<th width="10%">医院名称</th>
						<th width="8%">地区</th>
						<th width="10%">医院地址</th>
						<th>联系人</th>
						<th>联系电话</th>
						<th>创建时间</th>
						<th>审核时间</th>
						<th>审核人</th>
						<th width="17%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="index" value="0"></c:set>
					<c:forEach var="account" items="${request.pageView.records}"
						varStatus="status">
						<c:set var="hosInf" value="${hosInfs[status.index]}"></c:set>
						<tr>
							<td class="account_id">${status.index+1}</td>
							<td class="account_name">${hosInf.name } <input
								type="hidden" value="${account.accounts }" class="hos_accounts" />
							</td>
							<td>${hosInf.countries }</td>
							<td><span>${hosInf.address }</span></td>
							<td>${hosInf.contacts }</td>
							<td>${hosInf.phone }</td>
							<td>${fn:substring(account.createTime,0,10)}</td>
							<td>${fn:substring(account.checkTime,0,10) }</td>

							<td>${account.checker}</td>
							<td>

								<div class="operation_box">
									<p class="operation_link">
										<c:if test="${account.state==-2 }">
											<a href="${ctx }/console/hospitalAccount_input?id=${account.id}"
												class="c_error"> 
												<em class="enroll_enroll_ico"></em>
												审核不通过
											</a>
										</c:if>
										<c:if test="${account.state==-1 }">
											<a href="${ctx }/console/hospitalAccount_input?id=${account.id}"
												class="c_error"> 
												<em class="enroll_enroll_ico"></em>
												注册审核
											</a>
										</c:if>
										<c:if test="${account.state>=0}">
											<a
												href="${ctx }/console/hospitalAccount_input?id=${account.id}"><em
												class="look_details_ico"></em>查看详情</a>
											<a onclick="resetPsd(this)"><em class="code_reset_ico"></em>密码重置</a>
											<input  type="hidden"  value="${account.id }"/>
										</c:if>
									</p>
									<c:if test="${account.state>=0}">
										<div class="zt_switch_shade" onclick="switchStatus(this)"></div>
										<input type="hidden" value="${account.id}">
										<div class="wrap">
											<input type="checkbox" id="checkbox_d${index }" class="chk_4"
												<c:if test="${account.state==1 }"> checked='true'</c:if>>
											<label for="checkbox_d${index }"></label>
										</div>
									</c:if>

								</div>

							</td>
						</tr>
						<c:set var="index" value="${index+1 }"></c:set>
					</c:forEach>

				</tbody>
			</table>
			<!--page Start-->

			<div class="meidd_page_box">

				<%@ include file="common/page.jsp"%>
			</div>
			<!--page End-->

		</div>
	</form>
	<div class="popup_box" id="resetPsdDiv" style="display: none">
		<cite class="popup_t">密码重置</cite>
		<div class="password_box">
			<div class="admin_infor">
				<img id="hosImg" src="../assets/images/admin_pic.png" alt="">
				<p class="admin_t">
					<span>医院名称</span><span id="hosName" style="width: auto"></span>
				</p>
				<p class="admin_t">
					<span>医院账号</span><span id="hosAcount" style="width: auto"></span>
				</p>
			</div>

			<form method="post" class="password_cont" id="resetPsdForm"
				name="resetPsdForm" target="resetPstIframe"
				action="${ctx }/console/hospitalAccount_newPass"
				novalidate="novalidate">
				<input type="hidden" id="h_id" name="id">
				<fieldset>
					<input type="password" placeholder="请输入新密码" id="password1"
						name="password"> 
					<label id="password2-error" class="error"
						for="password1" style="display: inline-block;"></label>
				</fieldset>
				<fieldset>
					<input type="password" placeholder="请再次输入新密码" id="password2"
						name="password2"> <label id="password2-error"
						class="error" for="password2" style="display: inline-block;"></label>
				</fieldset>
				<p class="password_btn">
					<input type="button" value="确认" class="input_green"
						onclick="submitResPass()"> <input type="button"
						value="取消" class="input_grey ml60" onclick="layer.closeAll();">
				</p>
			</form>
		</div>
	</div>

	<div class="popup_box" id="switchStatusDiv" style="display: none">
		<cite class="popup_t">重要提示</cite>
		<div class="password_box">
			<div class="hint_box" id="switchStatusTips">
				<img alt="" src="../assets/images/close_hint_pic.png">
				<h3>您是否要修改该医院状态为关闭？</h3>
				<p>将该医院账号状态修改为关闭，</p>
				<p>则该医院所有咨询师将不能登录及使用美滴滴系统！</p>
			</div>
			<p class="password_btn">
				<input type="button" class="input_green" value="确认"
					onclick="doSwitchStatus(this)"> <input type="hidden"
					id="switchStatusHosId" value=""> <input type="hidden"
					id="switchStatusK"> <input type="submit"
					class="input_grey ml60" value="取消" onclick="layer.closeAll();">
			</p>

		</div>
	</div>
	<script type="text/javascript" src="${ctx }/assets/js/country.js"></script>
		<script type="text/javascript" src="${ctx }/assets/js/hos.account.js"></script>
		<script type="text/javascript">
		$().ready(function(){
			//调用联动
			$(window).selectCity({
			province : '.province',
			city : '.city',
			value :'${countries}',
			callback : function(indexArr){
				$("#cityVal").val(provinceArr[indexArr[0]]+","+cityArr[indexArr[0]][indexArr[1]]);
			}
			
			});
			
			$("#searchHosAccount").keyup(function(){
				var kw = $(this).val();
				if(kw==''){
					$("#search_result_ul").css('display','none');
					$("#search_result_ul").html("");
				}else{
					$("#search_result_ul").html("");
					if(kw.length>1){
						$.ajax({
							url:"hospitalInf_getNames",
							type:"POST",
							data:{'kw':kw,"way":"account"},
							dataType:"JSON",
							success:function(data){
								var val = data;
								$.each(val,function(i,v){
									$("#search_result_ul").css('display','block');
									$("#search_result_ul").append("<li>"+v+"</li>");
								});
							}
						});
					}
				}
			});
			$("#searchHosAccount").next().on('click','li',function(){
				var li = $(this);
				var searchVal = li.text();
				$("#searchHosAccount").val(searchVal);
				li.parent().html("");
			});
			/*  //自动完成
			$("#searchHosAccount").autocomplete({
				source:"hospitalInf_getNames?way=account",
				messages: {
			        noResults: '',
			        results: function() {}
			    }
			}); */
			$(".datepicker").datepicker({
	    		changeMonth: true,
	    		changeYear: true, dateFormat: 'yy-mm-dd'
	    	});//日期修改年份
		});
	    	

		</script>
       	<!--right End-->
</body>
</html>