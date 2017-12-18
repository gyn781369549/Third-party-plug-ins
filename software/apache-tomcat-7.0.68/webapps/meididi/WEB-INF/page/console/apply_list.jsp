<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp"%>
<style type="text/css">
.order-list-search-input {
	top: -21px;
	left: 34px;
}
</style>

</head>
<body>

	<!--right Start-->
	<div class="inquire_box">
		<form id="yw0" action="${ctx}/console/apply_list" method="post">
		<input type="hidden" name="page">
			<div class="keyword_box">
				<em class="ico_search"></em> 
				<input name="conName" type="text"
					class="w195" placeholder="请输入咨询师名" value="${conName }">
			</div>
			<div class="keyword_box">
				<em class="ico_search"></em> 
				<input name="hosName" type="text"
					class="w195" placeholder="请输入医院名称" value="${hosName }">
			</div>
			
			
			<p class="time_box">
				<input value="${start }" name="start" type="text"
					placeholder="开始时间" id="datepicker" class="test-style datepicker">
				<label class="time-text">至</label> 
				<input value="${end }" name="end" type="text" placeholder="结束时间"
					id="datepicker1" class="test-style datepicker">
			</p>
			<select class="meidd_select" name="state">
				<option value="">全部状态</option>
				<option value="0">未结算</option>
				<option value="1">已结算</option>
			</select>
			<input type="submit" class="btn_inquire" value="查询">
		</form>
	</div>
		
		<div class="tabCont">
			<div class="inquire_list mt0">
				<table class="table">
					<thead>
						<tr>
							<th width="5%">序号</th>
							<th width="7%">咨询师</th>
							<th>医院名称</th>
							<th width="10%">可提现金额</th>
							<th width="11%">提现日期</th>
							<th width="11%">提现金额</th>
							<th width="11%">结算状态</th>
							<th width="7%">结算人</th>
							<th width="20%" class="tc">操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="apply" items="${pageView.records }" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${apply.conName}</td>
								<td>${apply.hosName}</td>
								<td>￥${apply.allMoney }</td>
								<td>${apply.start}</td>
								<td>￥${apply.money }</td>
								<td>
									<c:if test="${apply.state=='0' }">未结算</c:if>
									<c:if test="${apply.state=='1' }">已结算</c:if>
								</td>
								<td>${apply.name}</td>
								<td class="tc">
									<c:if test="${apply.state=='0'}">
										<p class="operation_link jies">
										<a title="提现处理" href="javascript:void(0);"
											onclick="prejiesuan(${apply.id},0);">
											<em class="withdraw_deposit"></em>提现处理</a>
										
										</p>
									</c:if>
									<c:if test="${apply.state=='1'}">
										<p class="operation_link jies">
										<a title="提现处理" href="javascript:void(0);"
											onclick="prejiesuan(${apply.id},1);">
											<em class="withdraw_deposit"></em>查看详情</a>
										
										</p>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				<!--page Start-->
				<div class="meidd_page_box">
					<jsp:include page="common/page.jsp"></jsp:include>
				</div>
				<!--page End-->
			</div>
		</div>
	<div class="popup_box" id="prejiesuanDiv" style="display: none;margin:-310px 0 0 -282px;' ">
		<cite class="popup_t">提现申请</cite>
		<div class="password_box">
			<div class="inquire_list mr0 txsq" style="margin-right: 0">
				<table class="table">
					<tbody id="html">
						<tr><th width="20%">咨询师姓名</th><td class="conName"></td></tr>
		                <tr><th>剩余可提现金额</th><td class="allMoney"></td></tr>
		                <tr><th>提现申请时间</th><td class="start"></td></tr>
		                <tr><th>提现申请金额</th><td class="money">￥</td></tr>
		                <tr><th>持卡人姓名</th><td class="name"></td></tr>
		                <tr><th>银行信息</th><td class="bank"></td></tr>
		                <tr><th>开卡城市</th><td class="depositBank"></td></tr>
		                <tr><th>借记卡号</th><td class="bankCode"></td></tr>
		                <tr><th>手机号</th><td class="phone"></td></tr></tbody>
					</tbody>
				</table>
			</div>
			<p class="password_btn">
				
				<input type="submit" id="apply_check_submit" class="input_green" value="确认汇款"
					onclick="jiesuan()"> 
				<input type="submit" class="input_grey ml60" value="返回" onclick="layer.closeAll();">
			</p>
		</div>
	</div>
	<div class="popup_box" id="jiesuanDiv" style="display: none">
		<cite class="popup_t">重要提示</cite>
		<div class="password_box">
			<div class="hint_box">
				<img alt="" src="${ctx}/assets/images/ture_hint_pic.png">
				<h3>您是否确认已经完成汇款？</h3>
				<p>确认汇款后，不可修改该笔结算的状态</p>
			</div>
			<p class="password_btn">
				<input type="hidden" id="jiesuanId" value=""> 
				<input type="button" class="input_green" value="确认" onclick="dojiesuan()">
				<input type="button" class="input_grey ml60" value="返回"
					onclick="layer.closeAll();">
			</p>
		</div>
	</div>
	<script type="text/javascript">
		$(".datepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy-mm-dd'
		});//日期修改年份

		function prejiesuan(id,state) {
			$('#jiesuanId').val(id);
			$.ajax({
				type : "POST",
				url : "apply_inf?id=" + id,
				dataType : 'json',
				success : function(result) {
					//var json = $.parseJSON(result);
					var apply = result.apply;
					var bank = result.bank;
					console.log(state);
					if(state==0){
						$("#apply_check_submit").css('display','inline-block');
					}else{
						$("#apply_check_submit").css('display','none');
					}
					if (result.status == '1') {
						//$('#html').html(data.html);
						var valTd = $('#html').find("td");
						$.each(valTd,function(i,v){
							var key = $(this).attr("class");
							var val = apply[key];
							if(val==null){
								val = bank[key];
							}
							$(this).text(val);
						});
						
						
					} else {
						layer.alert("系统错误，请联系管理员！", {
							title : false,
							closeBtn : false
						}, function() {
							window.layer.closeAll();
						});
					}
				}
			});
			layer.open({
				type : 1,
				title : false,
				closeBtn : false,
				content : $('#prejiesuanDiv')
			});

		}

		function jiesuan() {
			layer.open({
				type : 1,
				title : false,
				closeBtn : false,
				content : $('#jiesuanDiv')
			});
		}

		//结算
		function dojiesuan() {
			$.ajax({
				type : "POST",
				url : "apply_check",
				data:{"id":$("#jiesuanId").val()},
				dataType : 'text',
				success : function(data) {
					if (data == 'success') {
						layer.alert("结算成功！", {
							title : false,
							closeBtn : false
						}, function() {
							window.layer.closeAll();
							window.location.href = window.location.href;
						});
					} else if (data == 'error') {
						layer.alert("操作失败！", {
							title : false,
							closeBtn : false
						}, function() {
							window.layer.closeAll();
							window.location.href = window.location.href;
						});
					}
				}
			});
		}
	</script>
</body>
</html>