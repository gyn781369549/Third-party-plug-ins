<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>

</head>
<body>
	 <div class="inquire_list account_infor project_infor">
        <table class="table">
            <thead>
                <tr>
                    <th colspan="2" class="c_error f16">退款申请内容</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td width="12%">用户昵称</td>
                    <td>${order.userName }</td>
                </tr>
                <tr>
                    <td width="12%">联系电话</td>
                    <td>${user.phone }</td>
                </tr>
                <tr>
                    <td>申请时间</td>
                    <td>${order.refundTime }</td>
                </tr>
                <tr>
                    <td>订单号</td>
                    <td>${order.number }</td>								
                </tr>
                <tr>
                    <td>在线支付时间</td>
                    <td>${order.firstTime }</td>
                </tr>
                <tr>
                    <td>在线支付</td>
                    <td>￥${order.firstMoney }</td>
                </tr>
                <tr>
                    <td>退款说明</td>
                    <td>
                        <div class="project_intro">${order.message }</div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
	<c:if test="${order.state=='7' }">
		<form target="" id="finish_form" name="wanjie_form" action=""
		method="POST" >
		<div class="inquire_list account_infor project_infor">
			<table class="table">
				<thead>
					<tr>
						<th colspan="2" class="c_error f16">处理说明</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<!--未处理状态-->
							<div class="appeal_p">
								<p class="indent_p">
									<textarea name="message" id="finish_remark"
										placeholder="请填写100字以内的处理说明" rows="3" class=""></textarea>
								</p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_return">
			<input type="button" onclick="submitRefund(${order.id })" value="保存处理结果" class="input_green mr20"> <input
				type="button" value="返回" class="input_grey"
				onclick="window.history.go(-1);">
		</div>
	</form>
	</c:if>
	<c:if test="${order.state=='8' }">
		<div class="inquire_list account_infor project_infor">
			<table class="table">
				<thead>
					<tr>
						<th colspan="2" class="c_error f16">处理说明</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<!--已处理状态-->
							<div class="appeal_p">
								<p class="indent_p">
									<span>处理说明</span>
								</p>
								<p class="indent_p">
									<span>处理时间</span>
									<time>${order.delRefundTime }</time>
								</p>
								<p class="indent_p">
									<span>处理人</span>
									<time>${order.refundName }</time>
								</p>
								<p class="indent_p">
									<span>处理纪要</span>
								</p>
								<div class="project_intro">${order.refundInformation}</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_return">
			<input type="button" value="返回" class="input_grey"
				onclick="window.history.go(-1);">
		</div>
	</c:if>
	
<script type="text/javascript">
	function submitRefund(id){
		$.ajax({
			url:"refund_input",
			type:"POST",
			data:{"id":id,
					"message":$("#finish_remark").val()},
			success:function(data){
				if(data=="success"){
					layer.alert("处理成功",function(){
						window.location.href = "refund_input?id="+id;
					});
				}else{
					layer.alert("处理失败");
				}
			}
		});
	}
</script>
</body>
</html>