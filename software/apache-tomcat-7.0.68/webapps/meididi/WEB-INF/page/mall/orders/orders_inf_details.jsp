<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/taglib.jsp" %>
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
<c:set var="bell" value="${0}" />
	<div class="inquire_box">
  							订单查询
				

	</div>
	<!--right Start-->
	<form action="${ctx}/mall/mallOrdersAction/updateView"  method="post">
		

		
		<div class="inquire_list">
			<table class="table" >
				<thead>
					<tr>
						
					
						<td width="">姓名</td>
						<td width="5%" height="3%">地址</td>		
						<td width="">手机</td>
						<td width="">下单时间</td>
						<td width="">订单状态</td>
						<td width="">支付状态</td>
						<td width="">支付金额</td>
						<td width="">订单ID</td>
						
						
						
					</tr>
					
					

					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${l}" 
						varStatus="status">
						<tr>
							
							<td class="account_name">${order.commodityaddress.name}</td>
							<td class="account_name">${order.commodityaddress.address}</td>						
							<td class="account_name">${order.commodityaddress.phone}</td>							
							<td class="account_name">${order.time}</td>													
							<td class="account_name">${order.statusValue}</td>
							<td class="account_name">${order.paystatusValue}</td>					
							<td class="account_name">${order.price}</td>
							<td class="account_name">${order.orderid}</td>
		
						</tr>
						
						
					</c:forEach>
						
					<tr>
							<td class="account_name"  style="width: 100px;">商品名称</td>
							<td class="account_name">购买数量</td>
							<td class="account_name"  style="width: 100px;">原价</td>
							<td class="account_name"  style="width: 100px;">售价</td>
							<td class="account_name" style="width: 100px;">合计</td>
					</tr>
					
					
					
					
					
				<c:forEach var="order" items="${l}" >
						<input name="id" type="text" value="${order.id}" style="display: none;"/>
						    <input name="status" type="text" value="2" style="display: none;"/>
				<c:forEach var="CommoditytSellRecord" items="${order.lCommoditytSellRecord}" >
						
			<c:choose>
				 <c:when test="${CommoditytSellRecord.commodity!=null}">
				 <c:set var="bell" value="${1}" />
					<tr>
				
						
						
							<td class="account_name">
							
							
							${CommoditytSellRecord.commodity.title}
							</td>
							<td class="account_name">${CommoditytSellRecord.amount}</td>
							<td class="account_name">${CommoditytSellRecord.commodity.cost}</td>
							<td class="account_name">${CommoditytSellRecord.commodity.price}</td>
							<td class="account_name">${CommoditytSellRecord.price}</td>
							
						</tr>
				</c:when>
				<c:when test="${CommoditytSellRecord.project!=null}">
					<tr>
				
						
						
							<td class="account_name">
							
							
							${CommoditytSellRecord.project.name}
							</td>
							<td class="account_name">${CommoditytSellRecord.amount}</td>
							<td class="account_name">${CommoditytSellRecord.project.money}</td>
							<td class="account_name">${CommoditytSellRecord.project.money}</td>
							<td class="account_name">${CommoditytSellRecord.price}</td>
							
						</tr>
					</c:when>
				</c:choose>
						
							
						</c:forEach>
						
						<c:choose>
						<c:when test="${bell!='0'}">
						<tr>
							<td width="">第三方快递名</td>
							<td width="">第三方订单号</td>
							<td width="">操作</td>
						</tr>
						<tr>
							<td class="account_name" ><input name="expressordersname" value="${order.expressordersname}" type="text"/></td>
							<td class="account_name" ><input name="expressorders" value="${order.expressorders}"  type="text"/></td>
						<c:choose>
						<c:when test="${order.paystatus=='1'&&order.status=='1'}">
							<td width=""><input type="submit" value="确定发货"/></td>
						</c:when>
						</c:choose>
						<c:choose>
						<c:when test="${order.paystatus=='1'&&order.status!='1'}">
							<td width=""><input type="submit" value="修改"/></td>
						</c:when>
						</c:choose>
						
						</tr>
						
						</c:when>
						</c:choose>
						
						</c:forEach>
					

				</tbody>
			</table>
		
			<!--page End-->

		</div>
	</form>

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
			function gradeChange(){
				var checkValue=$("#select1").val();
			//	alert(checkValue);
				window.location.href="${ctx}/api/mallCommodityOrdersAction/listView"+checkValue; 
				//alert("${ctx}/mall/listView?valid="+checkValue);
		       }
		</script>
       	<!--right End-->
</body>
</html>