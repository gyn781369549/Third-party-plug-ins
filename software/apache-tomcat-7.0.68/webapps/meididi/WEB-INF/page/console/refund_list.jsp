<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
<style type="text/css">
.order-list-search-input{top: -21px;left: 34px;}

</style>

</head>
<body>

<!--right Start-->

     <div class="inquire_box">
        <form id="yw0" action="${ctx}/console/refund_list" method="post">
		<input type="hidden" name="page">
       
        <div class="keyword_box">
            <em class="ico_search"></em>
            <input type="text" class="w195" placeholder="请输入订单编号" name='orderNum' value='${orderNum }'/>
        </div>
         <p class="time_box">
            <input  type="text" name="start" class="test-style datepicker" id="datepicker" placeholder="开始时间" value="${start}"/>
            <label class="time-text">至</label>
            <input type="text" name="end" class="test-style datepicker"  id="datepicker1" placeholder="结束时间" value="${end}"/>
        </p>
        <select class="meidd_select" name="name">
            <option value="">全部处理人</option>
            <c:forEach var="refundName" items="${refundNames }">
            	<option  value="${refundName}" <c:if test="${name==refundName }">selected='selected'</c:if>>${refundName}</option>
            </c:forEach>
            
        </select>
        <select class="meidd_select" name="state">
            <option value="">全部状态</option>
            <option  value="7" <c:if test="${state==7 }">selected='selected'</c:if>>未处理</option>
            <option  value="8" <c:if test="${state==8 }">selected='selected'</c:if>>已处理</option>
            
        </select>
       
        <input type="submit" class="btn_inquire" value="查询" />
        </form>    
        </div>
    <div class="inquire_list">
        <table class="table">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>申请时间</th>
                    <th>用户昵称</th>
                    <th>订单号</th>
                    <th>在线支付</th>
                    <th>处理日期</th>
                    <th>处理人</th>
                    <th>状态</th>
                    <th class="tc">操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${pageView.records }" varStatus="status">
            	 <tr>
                        <td>${status.index+1 }</td>
                        <td>${order.refundTime }</td>
                        <td>${order.userName }</td>
                        <td>${order.number }</td>
                        <td>￥${order.firstMoney }</td>
                        <td>${order.delRefundTime }</td>
                        <td>${order.refundName }</td>
                        <td>
                        	<c:if test="${order.state=='7' }">
                        		<span class="c_peach">未处理</span></td>
                        	</c:if>
                        	<c:if test="${order.state=='8' }">
                        		<span class="c_dark_green">已处理</span></td>
                        	</c:if>
                        
                        <td class="tc">
                            <a class="look_details" title="查看详情" href="${ctx}/console/refund_input?id=${order.id}">查看详情</a>
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
 <!--right End-->
<script type="text/javascript">
$(".datepicker").datepicker({
	changeMonth: true,
	changeYear: true, 
	dateFormat: 'yy-mm-dd'
});//日期修改年份
</script>
</body>
</html>