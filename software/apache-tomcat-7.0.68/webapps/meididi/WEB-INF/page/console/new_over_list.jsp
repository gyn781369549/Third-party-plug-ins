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

	<!--right Start
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
	-->
		
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
					<c:forEach var="csrd" items="${csrdl }" varStatus="status">
							<tr>
								<td>${csrd.id }</td>
								<td>${csrd.commodityOrders.findtime }</td>
								<td>${csrd.project.hospitalInformation.name }</td>
								<td>${csrd.commodityOrders.orderid }</td>
								<td><span>￥${csrd.price}</span></td>
								<td><span>￥${csrd.price }</span></td>
								<td>${csrd.findtTime }</td>
								<td>
									￥${csrd.hosCost }
								</td>
								<td>${csrd.statusValue }</td>
								<td class="tc">
									<a href="${ctx}/mall/mallSellRecordAction/listView?id=${csrd.id}" title="查看详情" class="look_details">查看详情</a></td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				<!--page Start
				<div class="meidd_page_box">
					<jsp:include page="common/page.jsp"></jsp:include>
				</div>-->
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