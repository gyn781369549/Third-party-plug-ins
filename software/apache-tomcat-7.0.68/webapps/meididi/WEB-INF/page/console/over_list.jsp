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
		<form id="yw0" action="${ctx}/console/overList" method="post">
		<input type="hidden" name="page">
			<div class="keyword_box">
				<em class="ico_search"></em> 
				<input name="orderNum" type="text"
					class="w195" placeholder="请输入订单编号" value="${orderNum }">
			</div>
			<div class="keyword_box">
				<em class="ico_search"></em> 
				<input name="hosName" type="text"
					class="w195" placeholder="请输入医院名称" value="${hosName }">
			</div>
			
			 <select class="meidd_select" name="state">
				<option value="">全部状态</option>
				
				<option value="0" <c:if test="${state=='0' }">selected='selected'</c:if>>未结算</option>
				<option value="1" <c:if test="${state=='1' }">selected='selected'</c:if>>已结算</option>
			</select>
			<p class="time_box">
				<input value="${start }" name="start" type="text"
					placeholder="开始时间" id="datepicker" class="test-style datepicker">
				<label class="time-text">至</label> 
				<input value="${end }" name="end" type="text" placeholder="结束时间"
					id="datepicker1" class="test-style datepicker">
			</p>
			
			<div class="clear"></div>
			<input type="submit" class="btn_inquire" value="查询">
		</form>
	</div>
		
		<div class="tabCont">
			<div class="inquire_list mt0">
				<table class="table">
					<thead>
                        <tr>
                            <th>序号</th>
                            <th>订单完结时间</th>
                            <th>医院名称</th>
                            <th>结算订单号</th>
                            <th>在线支付</th>
                            <th>完结金额</th>
                            <th>结算日期</th>
                            <th>结算金额</th>
                            <th>状态</th>
                            <th class="tc">操作</th>
                        </tr>
                    </thead>
					<tbody>
					<c:forEach var="order" items="${pageView.records }" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${order.finalTime }</td>
								<td>${order.hosName }</td>
								<td>${order.number }</td>
								<td><span>￥${order.firstMoney}</span></td>
								<td><span>￥${order.finalMoney }</span></td>
								<td>${order.overTime }</td>
								<td>
									<!-- 在线支付 --> 
									<c:if test="${order.type=='0' }">
										<c:set var="money" value="${order.hosCost}"></c:set>
										<span class="c_pink">￥-${money }</span>
									</c:if> 
									<!-- 线下支付 --> 
									<c:if test="${order.type=='1'}">
										<c:set var="money"
											value="${(order.conCost+order.plaCost)-order.firstMoney}"></c:set>
										<c:if test="${money<0}">
											<span class="c_pink">￥${money}</span>
										</c:if>
										<c:if test="${money>=0}">
											<span class="c_green">￥${money}</span>
										</c:if>
									</c:if>
								</td>
								<td><c:if test="${order.state<6}">
										<span class="c_pink">未结算</span>
									</c:if> <c:if test="${order.state==6}">
										<span class="c_green">已结算</span>
									</c:if></td>
								<td class="tc">
									<a href="${ctx}/console/overShow?id=${order.id}" title="查看详情" class="look_details">查看详情</a></td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				<!--page Start-->
				<div class="meidd_page_box">
					<jsp:include page="common/page.jsp"></jsp:include>
				</div>
				<!--page End-->
				<!--page End-->
			</div>
		</div>

	<script type="text/javascript">
$(".datepicker").datepicker({
	changeMonth: true,
	changeYear: true, dateFormat: 'yy-mm-dd'
});//日期修改年份
</script>
</body>
</html>