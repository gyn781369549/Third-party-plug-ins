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
					<th colspan="2" class="c_error f16">订单编号：${csrd.commodityOrders.orderid }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td width="12%">用户名称</td>
					<td>${csrd.commodityOrders.user.name }</td>
				</tr>
				<c:if test="${csrd.commodityOrders.user.thirdid==null }">
				<tr>
					<td>用户手机号</td>
					<td>${csrd.commodityOrders.user.phone }</td>
				</tr>
				</c:if>
				<c:if test="${csrd.commodityOrders.user.thirdid!=null }">
				<tr>
					<td>用户手机号</td>
					<td>${csrd.commodityOrders.user.tpPhone }</td>
				</tr>
				</c:if>
				<tr>
					<td>医院名称</td>
					<td>${csrd.project.hospitalInformation.name }</td>
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
					<td>${csrd.commodityOrders.findtime }</td>
				</tr>
				<tr>
					<td>在线支付金额</td>
					<td>￥${csrd.price}</td>
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
					<td>${csrd.commodityOrders.findtime }</td>
				</tr>
				<tr>
					<td>订单完结金额</td>
					<td>￥${csrd.price}</td>
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
		
				
					<dl class="c_peach">
					<dd class="m0">
						<cite>${csrd.statusValue }</cite>
						
						
						<c:if test="${csrd.operatingName!=null }">
						<p class="indent_p">
							<span>结算人</span>
							<time class="c_pink">${csrd.operatingName }</time>
						</p>
						</c:if>
						<p class="indent_p">
							<span>平台费用</span>
							<time>￥${csrd.plaCost}</time>
						</p>
						
						<p class="indent_p">
							<span>平台结算</span>
							<time class="c_pink">-￥${csrd.hosCost }</time>
						</p>
						<c:if test="${csrd.status=='1' }">
						<p class="indent_p">
							<a href="javascript:;" class="clickb" onclick="dojiesuan('${csrd.id }');">结算</a>
						</p>
						<p class="indent_p c_peach">如确认已结算，则该笔结算费用不支持修改为未结算状态，系统视为已完成该笔费用的结算</p>
						</c:if>
					</dd>
				</dl>
			
	</div>
	<div class="btn_return">
		<input type="button" value="返回" class="input_grey"
			onclick="window.history.go(-1);">
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
	//jq请求接口 处理json数据  模板
	function dojiesuan(id) {
		//alert(id);
	    $.ajax({
	        type: "post",
	        url: "${ctx}/mall/mallSellRecordAction/update",
	        data:{"id":id},
	        
	        success: function (data) {
	        	
	        	var obj = jQuery.parseJSON(data);
	        	var d=obj.result;
	        	//alert(d);
	            if (d == 'success') {
	                layer.alert("结算成功！",
	                        {title: false, closeBtn: false},
	                function () {
	                    window.layer.closeAll();
	                    window.location.href = '${ctx}/mall/mallSellRecordAction/listView?id=' + id;
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