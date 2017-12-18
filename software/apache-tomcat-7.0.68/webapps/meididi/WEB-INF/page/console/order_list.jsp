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
        <form id="yw0" action="${ctx }/console/order_list" method="post">
        <input type="hidden" name="page">
		<div class="keyword_box">
            <em class="ico_search"></em>
            <input type="text" class="w195" placeholder="请输入订单内容" name='proName' value='${proName }'/>
        </div>
        <div class="keyword_box">
            <em class="ico_search"></em>
            <input type="text" class="w195" placeholder="请输入医院名称" name='hosName' value='${hosName }'/>
        </div>
        <div class="keyword_box">
            <em class="ico_search"></em>
            <input type="text" class="w195" placeholder="请输入订单编号" name='orderNum' value='${orderNum }'/>
        </div>
        <select class="meidd_select" name="state">
            <option value="">全部状态</option>
            <option  value="1" <c:if test="${state==1 }">selected='selected'</c:if>>已确认</option>
            <option  value="2" <c:if test="${state==2 }">selected='selected'</c:if>>预付款已付(开始服务，服务中)</option>
            <option  value="7" <c:if test="${state==7 }">selected='selected'</c:if>>申请退款</option>
            <option  value="4" <c:if test="${state==4 }">selected='selected'</c:if>>待完结(医院或平台申报完结)</option>
            <option  value="6" <c:if test="${state==6 }">selected='selected'</c:if>>已完结(用户结束服务，已结算，已退款)</option>
        </select>
        <p class="time_box">
            <input  type="text" name="start" class="test-style datepicker" id="datepicker" placeholder="开始时间" value="${start}"/>
            <label class="time-text">至</label>
            <input type="text" name="end" class="test-style datepicker"  id="datepicker1" placeholder="结束时间" value="${end}"/>
        </p>
        <input type="submit" class="btn_inquire" value="查询" />
        </form>    
        </div>
        
    <div class="inquire_list">
        <table class="table">
            <thead>
                <tr>
                    <th width="5%">序号</th>
                    <th width="10%">确认时间</th>
                    <th width="10%">订单编号</th>
                    <th width="10%">订单内容</th>
                    <th width="10%">咨询师</th>
                    <th>客户名称</th>
                    <th width="12%">订单金额（元）</th>
                    <th width="14%">医院名称</th>
                    <th width="10%">订单状态</th>
                    <th class="tc">操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${pageView.records }" varStatus="status">
            	<tr>
                        <td>${status.index+1 }</td>
                        <td>${order.sureTime }</td>
                        <td>${order.number }</td>
                        <td><p>${order.proName }</p></td>
                        <td>${order.conName}</td>
                        <td><span>${order.userName}</span></td>
                        <td>￥${order.money }</td>
                        <td>${order.hosName }</td>
                        <td>
                        	
                        	<c:if test="${order.state=='-1' }"><span class="c_error">已取消</span></c:if>
                        	<c:if test="${order.state=='7' }"><span class="c_error">退款申请</span></c:if>
                        	<c:if test="${order.state=='1' }"><span class="c_green">已确认</span></c:if>
                        	<c:if test="${order.state=='2' }"><span class="c_green">已支付预付款</span></c:if>
                        	<c:if test="${order.state=='4'||order.state=='3'}"><span class="c_green">待完结</span></c:if>
                        	<c:if test="${order.state=='6'||order.state=='5' }"><span class="c_error">已完结</span></c:if>
                        	<c:if test="${order.state=='9'}"><span class="c_error">有争议</span></c:if>
                        </td>
                        <td class="tc">
                        	<a title="查看详情" href="${ctx }/console/order_input?id=${order.id}" class="look_details">查看详情</a>
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
	changeYear: true, dateFormat: 'yy-mm-dd'
});//日期修改年份
</script>
</body>
</html>