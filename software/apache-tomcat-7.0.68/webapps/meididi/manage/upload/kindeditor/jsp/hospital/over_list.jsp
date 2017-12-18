<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp"%>

</head>
<body style="background: transparent;">
	<!--right Start-->
	<div class="bwh_crumbs">
		当前位置：<a href="javascript:void(0);" title="结算管理">结算管理</a><em>&gt;</em>结算列表
	</div>
	<div class="tabBox">
		<div class="inquire_box">
			<form id="yw0" action="${ctx}/hospital/order_overList" method="post">
				<input type="hidden" name="page">
				<!-- <div class="jies_hints">
					<span>完结总金额：114.5</span><span>线上支付总金额：9.6</span><span>到院支付总金额：104.9</span><span>结算总金额：-1.2</span>
				</div> -->
				<div class="keyword_box">
					<em class="ico_search"></em> <input type="text" class="w195"
						placeholder="请输入订单号" name="orderNum" value="${orderNum }">
				</div>
				<p class="time_box">
					<input value="${start }" type="text" name="start" class="test-style datepicker"
						id="datepicker" placeholder="结算开始时间">
					<label class="time-text">至</label> 
					<input value="${end }" type="text" name="end" class="test-style datepicker" 
						id="datepicker1" placeholder="结算结束时间">
				</p>
				<select class="meidd_select" name="state">
					<option value="">全部状态</option>
					<option value="0">未结算</option>
					<option value="1">已结算</option>
				</select> 
				<input type="submit" class="btn_inquire" value="搜索">
			</form>
		</div>
		<div class="inquire_list">
			<table class="table">
				<thead>
					<tr>
						<th width="5%">序号</th>
						<th width="11%">订单完结时间</th>
						<th>订单号</th>
						<th>完结金额</th>
						<th>平台结算</th>
						<th>结算日期</th>
						<th>结算状态</th>
						<th width="17%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${pageView.records }" varStatus="status">
					<tr>
						<td>${status.index+1 }</td>
						<td>${order.finalTime }</td>
						<td>${order.number }</td>
						<td><span>￥${order.money }</span></td>
						<td>
							<!-- 在线支付 -->
							<c:if test="${order.type==0 }">
							<c:set var="money" value="${order.hosCost}"></c:set>
								<span class="c_green">￥${money }</span>
							</c:if>
							<!-- 线下支付 -->
							<c:if test="${order.type==1}">
								<c:set var="money" value="${order.firstMoney-order.conCost-order.plaCost}"></c:set>
								<c:if test="${money<0}">
									<span class="c_pink">￥${money}</span>
								</c:if>
								<c:if test="${money>=0}">
									<span class="c_green">￥${money}</span>
								</c:if>
							</c:if>
						</td>
						<td>${order.overTime}</td>
						<td>
							<c:if test="${order.state<6}">
							<span class="c_pink">未结算</span>
							</c:if>
							<c:if test="${order.state==6}">
							<span class="c_green">已结算</span>
							</c:if>
						</td>
						<td>
                           <div class="operation_box">
                               <p class="operation_link">
                                 <a href="${ctx}/hospital/overShow?id=${order.id}"><em class="look_details_ico"></em>查看详情</a>
                               </p>
                           </div>
                        </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
	<!--page Start-->
	<div class="meidd_page_box">
		<jsp:include page="common/page.jsp"></jsp:include>
	</div>
	<!--page End-->

	<div class="popup_bg" style="display: none;"></div>

	<!--right End-->
	<script>
	$(".datepicker").datepicker({
		changeMonth : true,
		changeYear : true,
		dateFormat : 'yy-mm-dd'
	});//日期修改年份
</script>


						</body>
</html>