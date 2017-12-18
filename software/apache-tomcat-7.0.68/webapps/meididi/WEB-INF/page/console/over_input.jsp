<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp"%>

</head>
<body>
	<div class="inquire_list account_infor project_infor">
		<table class="table">
			<thead>
				<tr>
					<th colspan="2" class="c_error f16">订单编号：${order.number }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td width="12%">用户名称</td>
					<td>${user.name }</td>
				</tr>
				<tr>
					<td>用户手机号</td>
					<td>${user.phone }</td>
				</tr>
				<tr>
					<td>医院名称</td>
					<td>${order.hosName }</td>
				</tr>
				<tr>
					<td>咨询医生</td>
					<td>${order.conName }</td>
				</tr>
				<tr>
					<td>订单确认时间</td>
					<td>${order.sureTime }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="inquire_list account_infor project_infor">
		<table class="table">
			<thead>
				<tr>
					<th colspan="2" class="c_error f16">在线支付</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><br></td>
				</tr>
				<!--未到期先支付-->
				<tr>
					<td width="12%">在线支付时间</td>
					<td>${order.firstTime }</td>
				</tr>
				<tr>
					<td>在线支付金额</td>
					<td>￥${order.firstMoney }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="inquire_list account_infor project_infor">
		<table class="table">
			<thead>
				<tr>
					<th colspan="2" class="c_error f16">订单完结</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><br></td>
				</tr>
				<!--未到期-->
				<tr>
					<td width="12%">订单完结时间</td>
					<td>${order.overTime }</td>
				</tr>
				<tr>
					<td>订单完结金额</td>
					<td>￥${order.finalMoney }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="inquire_list account_infor project_infor">
		<table class="table">
			<thead>
				<tr>
					<th colspan="2" class="c_error f16">结算信息</th>
				</tr>
			</thead>
		</table>
		<div class="indent_zt">
			<!-- 0为线上，1为线线下 -->
			<c:if test="${order.type=='0' }">
				<c:if test="${order.state=='6' }">
					<dl class="c_brown">
						<dd class="m0">
							<cite>已结算</cite>
							<p class="indent_p c_brown">
								<span>结算时间</span>
								<time>${order.overTime }</time>
							</p>
							<p class="indent_p c_brown">
								<span>结算人</span>
								<time>${order.overName }</time>
							</p>
							<p class="indent_p">
								<span>平台费用</span>
								<time>￥${order.plaCost}</time>
							</p>
							<p class="indent_p">
								<span>平台结算</span>
								<time class="c_brown">￥-${order.hosCost }</time>
							</p>
						</dd>
					</dl>
				</c:if>
				<c:if test="${order.state!='6' }">
					<dl class="c_peach">
					<dd class="m0">
						<cite>未结算</cite>
						<p class="indent_p">
							<span>平台费用</span>
							<time>￥${order.plaCost}</time>
						</p>
						<p class="indent_p">
							<span>平台结算</span>
							<time class="c_pink">￥-${order.hosCost}</time>
						</p>
						<p class="indent_p">
							<a href="javascript:;" class="clickb" onclick="jiesuan();">结算</a>
						</p>
						<p class="indent_p c_peach">如确认已结算，则该笔结算费用不支持修改为未结算状态，系统视为已完成该笔费用的结算</p>
					</dd>
				</dl>
				</c:if>
				

			</c:if>
			
			<c:if test="${order.type=='1' }">
			<c:set var="money" value="${(order.conCost+order.plaCost)-order.firstMoney}"></c:set>
				
				<c:choose>
					<c:when test="${order.state=='6' }">
						<dl class="c_brown">
						<dd class="m0">
							<cite>已结算</cite>
							<p class="indent_p c_brown">
								<span>结算时间</span>
								<time>${order.overTime }</time>
							</p>
							<p class="indent_p c_brown">
								<span>结算人</span>
								<time>${order.overName }</time>
							</p>
							<p class="indent_p">
								<span>平台费用</span>
								<time>￥${order.plaCost}</time>
							</p>
							<p class="indent_p">
								<span>平台结算</span>
								<time class="c_brown">￥${order.money}</time>
							</p>
						</dd>
					</dl>
					</c:when>
					<c:otherwise>
						<c:if test="${money<0}">
					<dl class="c_peach">
						<dd class="m0">
							<cite>未结算</cite>
							<p class="indent_p">
								<span>平台费用</span>
								<time>￥${order.plaCost }</time>
							</p>
							<p class="indent_p">
								<span>平台结算</span>
								<time class="c_pink">￥${money }</time>
							</p>
							<p class="indent_p">
								<a href="javascript:;" class="clickb" onclick="jiesuan();">结算</a>
							</p>
							<p class="indent_p c_peach">如确认已结算，则该笔结算费用不支持修改为未结算状态，系统视为已完成该笔费用的结算</p>
						</dd>
					</dl>
				</c:if>
				<c:if test="${money>=0}">
					<dl class="c_peach">
						<dd class="m0">
							<cite>未结算（请等待医院机构完成结算）</cite>
							<p class="indent_p">
								<span>平台费用</span>
								<time>￥${order.plaCost }</time>
							</p>
							<p class="indent_p">
								<span>平台结算</span>
								<time class="c_green">￥${money }</time>
							</p>
							
						</dd>
					</dl>
				</c:if>
					</c:otherwise>
				</c:choose>
				<%-- <c:if test="${order.state=='6' }">
					<dl class="c_brown">
						<dd class="m0">
							<cite>已结算</cite>
							<p class="indent_p c_brown">
								<span>结算时间</span>
								<time>${order.overTime }</time>
							</p>
							<p class="indent_p c_brown">
								<span>结算人</span>
								<time>${order.overName }</time>
							</p>
							<p class="indent_p">
								<span>平台费用</span>
								<time>￥${order.plaCost}</time>
							</p>
							<p class="indent_p">
								<span>平台结算</span>
								<time class="c_brown">￥${order.money}</time>
							</p>
						</dd>
					</dl>
				</c:if>
				<c:if test="${money<0}">
					<dl class="c_peach">
						<dd class="m0">
							<cite>未结算</cite>
							<p class="indent_p">
								<span>平台费用</span>
								<time>￥${order.plaCost }</time>
							</p>
							<p class="indent_p">
								<span>平台结算</span>
								<time class="c_pink">￥${money }</time>
							</p>
							<p class="indent_p">
								<a href="javascript:;" class="clickb" onclick="jiesuan();">结算</a>
							</p>
							<p class="indent_p c_peach">如确认已结算，则该笔结算费用不支持修改为未结算状态，系统视为已完成该笔费用的结算</p>
						</dd>
					</dl>
				</c:if>
				<c:if test="${money>=0}">
					<dl class="c_peach">
						<dd class="m0">
							<cite>未结算（请等待医院机构完成结算）</cite>
							<p class="indent_p">
								<span>平台费用</span>
								<time>￥${order.plaCost }</time>
							</p>
							<p class="indent_p">
								<span>平台结算</span>
								<time class="c_green">￥${money }</time>
							</p>
							
						</dd>
					</dl>
				</c:if>
				 --%>
			</c:if>
			
		</div>
	</div>
	<div class="btn_return">
		<input type="button" value="返回" class="input_grey"
			onclick="window.history.go(-1);">
	</div>
	</div>
	<div class="popup_box" id="jiesuanDiv" style="display: none">
		<cite class="popup_t">重要提示</cite>
		<div class="password_box">
			<div class="hint_box">
				<img alt="" src="${ctx}/assets/images/ture_hint_pic.png">
				<h3>是否已完成了该笔结算？</h3>
				<p>系统不支持确认已结算后重新修改状态！</p>
				<p>请再次确认已完成与相关医院的结算付款！</p>
			</div>
			<p class="password_btn">
				<input type="button" class="input_green mr20" value="确认"
					onclick="dojiesuan(${order.id})"> <input type="button"
					class="input_green" value="返回" onclick="layer.closeAll();">
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
	        url: "overCheck",
	        data:{"id":id},
	        dataType: 'text',
	        success: function (data) {
	            if (data == 'success') {
	                layer.alert("结算成功！",
	                        {title: false, closeBtn: false},
	                function () {
	                    window.layer.closeAll();
	                    window.location.href = 'overShow?id=' + id;
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