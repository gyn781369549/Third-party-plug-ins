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
	<form action="${ctx }/console/hospitalInf_list" id="foodsForm" namespace="/console"
		method="post">
		<div class="inquire_box">

			<div class="keyword_box" style="width: 177px;">
				<em class="ico_search"></em> 
				<input type="text" id="searchHosAccount"
					placeholder="请输入医院名称" name="keywords" value="${keywords }"
					style="width: 140px !important">
					<ul id="search_result_ul">
				</ul>
			</div>

			<select class="province meidd_select"></select> <select
				class="city meidd_select" style="width: 91px;"></select> <input
				type="hidden" id="cityVal" name="countries" />
			<!-- <select class="meidd_select" name="state">
                        <option value="">全部状态</option>
                        <option value="-1">待审核</option>
                        <option value="1">审核通过</option>
                        <option value="0">审核不通过</option>
                    </select> -->
			<input type="text" placeholder="开始时间" id="datepicker"
				style="height: 33px; line-height: 33px; width: 90px; margin-bottom: 0px;"
				class="meidd_select datepicker" name="startTime"
				value="${startTime }"> 
				<label class="time-text">至</label> 
			<input type="text" placeholder="结束时间" id="datepicker1"
				style="height: 33px; line-height: 33px; width: 90px; margin-bottom: 0px;"
				class="meidd_select datepicker" name="endTime" value="${endTime }">

			<input type="submit" class="btn_inquire" value="查询"> <input
				type="button" value="新增录入" class="btn_inquire"
				onclick="window.location.href = '${ctx}/console/hospitalInf_input'">

		</div>
		<input type="hidden" name="page">
		<s:hidden name="pagesize"></s:hidden>
		<input type="hidden" name="del" />
		<div class="inquire_list">
			<table class="table">
				<thead>
					<tr>
						<th width="8%">序号</th>
						<th width="20%">医院名称</th>
						<th width="12%">地区</th>
						<th width="20%">医院地址</th>
						<th>创建时间</th>
						<th>创建人</th>
						<th width="17%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="index" value="0"></c:set>
					<c:forEach var="account" items="${request.pageView.records}"
						varStatus="status">
						<tr>

							<td class="account_id">${status.index+1}</td>
							<td class="account_name">${account.name }</td>
							<td>${account.countries }</td>
							<td><span>${account.address }</span></td>
							<td>${fn:substring(account.createTime,0,10)}</td>
							<td>${account.createPerson }</td>
							<td>

								<div class="operation_box">
									<p class="operation_link">
										<a
											href="${ctx }/console/hospitalInf_show?hospitalInformation.id=${account.id}">
											<em class="look_details_ico"></em>查看详情
										</a>
									</p>

									<div class="zt_switch_shade" onclick="switchStatus(this)"></div>
									<input type="hidden" value="${account.id }"> 
									<input type="hidden" value="${account.state }">

									<div class="wrap">
										<input type="checkbox" id="checkbox_d${index }" class="chk_4"
											<c:if test="${account.state==1 }"> checked='true'</c:if>>
										<label for="checkbox_d${index }"></label>
									</div>

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


	<div class="popup_box" id="switchStatusDiv" style="display: none">
		<cite class="popup_t">重要提示</cite>
		<div class="password_box">
			<div class="hint_box" id="switchStatusTips"></div>
			<p class="password_btn">
				<input type="button" class="input_green" value="确认"
					onclick="doSwitchStatus(this)"> <input type="hidden"
					id="switchStatusHosId"> <input type="hidden"
					id="switchStatusK"> <input type="submit"
					class="input_grey ml60" value="取消" onclick="layer.closeAll();">
			</p>

		</div>
	</div>
	<script type="text/javascript" src="${ctx }/assets/js/country.js"></script>
		<script type="text/javascript">
			$().ready(function() {
				
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
							data:{'kw':kw,"way":"inf"},
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
			

			
			$(".datepicker").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : 'yy-mm-dd'
			});//日期修改年份
			
			//调用联动
			$(window).selectCity({
				province : '.province',
				city : '.city',
				value : '',
				callback : function(indexArr) {
					$("#cityVal").val(provinceArr[indexArr[0]]+ 
							","+ 
							cityArr[indexArr[0]][indexArr[1]]);
				}
			});
			});
			
			//切换用户状态 弹出框
			function switchStatus(e) {
				
				var tr = $(e).parent().parent().parent();
				$('#switchStatusHosId').val($.trim($(e).next().val()));
				$('#switchStatusK').val($.trim($(e).next().next().val()));
				var html1 = '<img alt="" src="../assets/images/close_hint_pic.png"><h3>您是否要修改该医院状态为关闭？</h3><p>将该医院账号状态修改为关闭，</p><p>则该医院所有咨询师将不能登录及使用美滴滴系统！</p>';
				var html2 = '<img alt="" src="../assets/images/ture_hint_pic.png"><h3>您是否要修改该医院状态为开启？</h3><p>将该医院账号状态修改为开启，</p><p>则该医院所有咨询师将能正常登录及使用美滴滴系统！</p>';
				
				($(e).next().next().val() == "1") ? $(
						'#switchStatusTips').html(html1)
						: $('#switchStatusTips').html(html2);
				resetPsdIndex = layer.open({
					type : 1,
					title : false,
					shadeClose : true,
					closeBtn : false,
					maxmin : true,
					content : $('#switchStatusDiv')
				});
			}
			
			
			//执行切换用户状态
			function doSwitchStatus(e) {
				var h_id = $('#switchStatusHosId').val();
				var k = $('#switchStatusK').val();
				//var status = ($("#checkbox_d" + k).attr("checked") == "checked") ? 2 : 1;
				$.ajax({
					type : "POST",
					url : "hospitalInf_check",
					data : {
						"id" : h_id,
						"state" : k
					},
					success : function(data) {
						if (data == 'success') {
							layer.alert("操作成功", {
								title : false,
								closeBtn : false
							}, function() {
								window.location.href = "hospitalInf_list";
							});
							$("#checkbox_d" + k).click();
						} else {
							layer.alert("操作失败，请重试", {
								title : false,
								closeBtn : false
							}, function() {
								layer.closeAll();
							});
						}
					}
				});
			}
		</script>
       	<!--right End-->
</body>
</html>