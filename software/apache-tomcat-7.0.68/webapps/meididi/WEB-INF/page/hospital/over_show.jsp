<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
	
</head>
<body style="background:transparent;">
 <!--right Start-->
 	<div class="bwh_crumbs">当前位置：<a href="javascript:void(0);" title="结算详情">结算详情</a><em>&gt;</em>结算详情</div>
    <div class="tabBox">
        <ul class="tabNav">
            <li>结算详情</li>
        </ul>
        <!--订单详情start-->
        <div class="tabCont" style="display: block;">
            <div class="item_line">
                <ol>
                    <li><cite>订单编号</cite><span>${order.number }</span></li>
                    <li><cite>订单确认时间</cite><span>${order.sureTime }</span></li>
                    <li><cite>用户名称</cite><span>${user.name }</span></li>
                    <li><cite>用户手机号</cite><span>${user.phone }</span></li>
                    <li><cite>医院名称</cite><span>${order.hosName }</span></li>
                    <li><cite>咨询医生</cite><span>${order.conName }</span></li>
                </ol>
            </div>
        </div>
        <!--订单详情end-->
        <!--在线支付start-->
        <ul class="tabNav">
            <li>在线支付</li>
        </ul>
        <div class="tabCont" style="display: block;">
			<div class="item_line">
				<ol>
					<li><cite>在线支付时间</cite><span>${order.firstTime }</span></li>
					<li><cite>在线支付金额</cite><span>￥${order.firstMoney }</span></li>
				</ol>
			</div>
		</div>
        <!--在线支付end-->
        <!--订单完结start-->
        <ul class="tabNav">
            <li>订单完结</li>
        </ul>
        <div class="tabCont" style="display: block;">
			<div class="item_line">
				<ol>
					<li><cite>订单完结时间</cite><span>${order.finalTime }</span></li>
					<li><cite>订单完结金额</cite><span>￥${order.finalMoney }</span></li>
				</ol>
			</div>
		</div>
        <!--订单完结end-->
        <!--结算信息start-->
        <ul class="tabNav">
            <li>结算信息</li>
        </ul>
		<div class="tabCont" style="display: block;">
			
			<!--未结算(等待平台支付)状态-->
			<div class="item_line">
				<!-- 在线支付 -->
				<c:if test="${order.type=='0' }">
					
					<c:if test="${order.state!='6' }">
						<ol>
						<li class="c_pink"><cite>未结算</cite><span>请等待美滴滴平台完成结算</span></li>
						<li><cite>平台费用</cite><span>￥${order.plaCost }</span></li>
						<li><cite>平台结算</cite><span class="c_green">￥${order.hosCost}</span></li>
						</ol>
					</c:if>
					<c:if test="${order.state=='6' }">
						<ol>
						<li class="c_green"><cite>已结算</cite></li>
						<li><cite>平台费用</cite><span>￥${order.plaCost }</span></li>
						<li><cite>平台结算</cite><span class="c_green">￥${order.hosCost}</span></li>
						</ol>
					</c:if>
				</c:if>
				<!-- 线下支付 -->
				<c:if test="${order.type=='1'}">
					<c:set var="money" 
						value="${order.firstMoney-order.conCost-order.plaCost}"></c:set>
					<c:choose>
						<c:when test="${order.state=='6' }">
							<ol>
							<li class="c_green"><cite>已结算</cite></li>
							<li><cite>平台费用</cite><span>￥${order.plaCost }</span></li>
							<li><cite>平台结算</cite><span class="c_green">￥${money}</span></li>
							</ol>
						</c:when>
						
						<c:otherwise>
							<c:if test="${money<0}">
						<ol>
						<li class="c_pink"><cite>未结算</cite></li>
						<li><cite>平台费用</cite><span>￥${order.plaCost }</span></li>
						<li><cite>平台结算</cite><span class="c_pink">￥${money}</span></li>
						<li>
							<a class="load_head" title="确认结算" href="javascript:void(0);" 
								onclick="jiesuan();">确认结算</a>
						</li>
						</ol>
					</c:if>
					<c:if test="${money>=0}">
						<ol>
						<li class="c_pink"><cite>未结算</cite><span>请等待美滴滴平台完成结算</span></li>
						<li><cite>平台费用</cite><span>￥${order.plaCost }</span></li>
						<li><cite>平台结算</cite><span class="c_green">￥${money}</span></li>
						</ol>
					</c:if>
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${order.state=='6' }">
						<ol>
						<li class="c_green"><cite>已结算</cite></li>
						<li><cite>平台费用</cite><span>￥${order.plaCost }</span></li>
						<li><cite>平台结算</cite><span class="c_green">￥${money}</span></li>
						</ol>
					</c:if>
					<c:if test="${money<0}">
						<ol>
						<li class="c_pink"><cite>未结算</cite></li>
						<li><cite>平台费用</cite><span>￥${order.plaCost }</span></li>
						<li><cite>平台结算</cite><span class="c_pink">￥${money}</span></li>
						<li>
							<a class="load_head" title="确认结算" href="javascript:void(0);" 
								onclick="jiesuan();">确认结算</a>
						</li>
						</ol>
					</c:if>
					<c:if test="${money>=0}">
						<ol>
						<li class="c_pink"><cite>未结算</cite><span>请等待美滴滴平台完成结算</span></li>
						<li><cite>平台费用</cite><span>￥${order.plaCost }</span></li>
						<li><cite>平台结算</cite><span class="c_green">￥${money}</span></li>
						</ol>
					</c:if> --%>
					
					
				</c:if>
				
			</div>
		</div>
		<!--结算信息end-->
    </div>
    <div class="btn_tab">
        <input type="button" class="input_green" value="返回" onclick="window.history.go(-1);">
    </div>
</div>
    <div class="popup_box" id="jiesuanDiv" style="display: none">
    <cite class="popup_t">重要提示</cite>
    <div class="popup_cont">
        <div class="create_box">
            <h2>您是否确认已完成该笔金额的结算？</h2>
            <h1>确认之后，系统视为该笔费用已完成结算，不可修改</h1>
        </div>
        <p class="popup_btn">
            <span class="popup_btn_p">
                <input type="button" class="input_green mr20" value="确认" onclick="dojiesuan(${order.id})">
                <input type="button" class="input_green" value="返回" onclick="layer.closeAll();">
            </span>
        </p>
    </div>
</div>
<script type="text/javascript">
function jiesuan() {
    layer.open({
        type: 1,
        title: false,
        closeBtn: false,
        content: $('#jiesuanDiv')
    });
}
function dojiesuan(id) {
    $.ajax({
        type: "post",
        url: "order_overCheck",
        data:{"id":id},
        dataType: 'text',
        success: function (data) {
            if (data == 'success') {
                layer.alert("结算成功！",
                        {title: false, closeBtn: false},
                function () {
                    window.layer.closeAll();
                    window.location.href = 'order_overShow?id=' + id;
                });
            } else {
                layer.alert("结算失败，请重试！",
                        {title: false, closeBtn: false},
                function () {
                    window.layer.closeAll();
                });
            }
        }
    });
}
</script>
</body>
</html>