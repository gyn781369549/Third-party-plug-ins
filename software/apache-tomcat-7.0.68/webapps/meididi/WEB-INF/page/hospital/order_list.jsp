<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>

</head>
<body style="background:transparent;">
 <!--right Start-->
 	<div class="bwh_crumbs">当前位置：<a href="javascript:void(0);" title="订单管理">订单管理</a><em>&gt;</em>订单列表</div>
    <div class="tabBox">
        <div class="inquire_box">
            <form id="yw0" action="" method="post">
            <input type="hidden" name="page">
                <div class="keyword_box">
                <em class="ico_search"></em>
                <input type="text" class="w195" placeholder="请输入订单号" name="orderNum" value="${orderNum }">
            </div>
            <div class="keyword_box">
                <em class="ico_search"></em>
                <input type="text" class="w195" placeholder="请输入订单内容" name="proName" value="${proName }">
            </div>
            <p class="time_box">
                <input type="text" name="start" class="test-style datepicker" id="datepicker" placeholder="开始时间" value="${start }">
                <label class="time-text">至</label>
                <input type="text" name="end" class="test-style datepicker" id="datepicker1" placeholder="结束时间" value="${end }">
            </p>
            <select class="meidd_select" name="state">
                <option value="">全部状态</option>
                <option  value="1" <c:if test="${state==1 }">selected='selected'</c:if>>已确认</option>
	            <option  value="2" <c:if test="${state==2 }">selected='selected'</c:if>>预付款已付(开始服务，服务中)</option>
	            <option  value="7" <c:if test="${state==7 }">selected='selected'</c:if>>申请退款</option>
	            <option  value="4" <c:if test="${state==4 }">selected='selected'</c:if>>待完结(医院或平台申报完结)</option>
	            <option  value="6" <c:if test="${state==6 }">selected='selected'</c:if>>已完结(用户结束服务，已结算，已退款)</option>
            </select>
            <select class="meidd_select" name="consult">
                <option value="">全部咨询师</option>
                <c:forEach var="con" items="${consults}">
                	<option value="${con.id}" <c:if test="${consult==con.id }">selected='selected'</c:if>>${con.name }</option>
                </c:forEach>

            </select>
            <input type="submit" class="btn_inquire" value="搜索">
            </form>   
            </div>
        <div class="inquire_list">
            <table class="table">
                <thead>
                    <tr>
                        <th width="5%">序号</th>
                        <th width="11%">订单确认时间</th>
                        <th>订单号</th>
                        <th width="8%">用户名</th>
                        <th width="16%">订单内容</th>
                        <th>项目金额</th>
                        <th>订单金额</th>
                        <th width="8%">咨询师</th>
                        <th width="8%">订单状态</th>
                        <th width="10%">操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${pageView.records }" varStatus="status">
            	<tr>
                        <td>${status.index+1 }</td>
                        <td>${order.sureTime }</td>
                        <td>${order.number }</td>
                        <td><span>${order.userName}</span></td>
                        <td><p>${order.proName }</p></td>
                        <td>￥${order.total }</td>
                        <td>￥${order.money }</td>
                        
                        <td>${order.conName}</td>
                        <td>
                        	<c:if test="${order.state=='7' }"><span >退款申请</span></c:if>
                        	<c:if test="${order.state=='1' }"><span >已确认</span></c:if>
                        	<c:if test="${order.state=='2' }"><span >已支付预付款</span></c:if>
                        	<c:if test="${order.state=='4'||order.state=='3'}"><span >待完结</span></c:if>
                        	<c:if test="${order.state=='6'||order.state=='5' }"><span>已完结</span></c:if>
                        </td>
                        <td>
                       <div class="operation_box">
                           <p class="operation_link">
                               <a href="${ctx }/hospital/order_input?id=${order.id}"><em class="look_details_ico"></em>查看详情</a>
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

	<div class="popup_bg" style="display:none;"></div>
	
		<!--right End-->
<script>
$(".datepicker").datepicker({
	changeMonth: true,
	changeYear: true, dateFormat: 'yy-mm-dd'
});//日期修改年份
</script>

</body>
</html>