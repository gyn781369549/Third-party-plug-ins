<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
	
</head>
<body style="background:transparent;">
 <!--right Start-->
 	<div class="bwh_crumbs">当前位置：<a href="javascript:void(0);" title="订单信息">订单信息</a><em>&gt;</em>订单信息</div>
        <div class="tabBox">
        <ul class="tabNav">
            <li>订单详情</li>
        </ul>
        <!--订单详情start-->
        <div class="tabCont" style="display: block;">
            <div class="item_line">
                <ul>
                    <li><cite>订单编号</cite><span>${order.number }</span></li>
                    <li><cite>创建时间</cite><span>${order.sureTime }</span></li>
                    <li><cite>咨询师名称</cite><span>${order.hosName }</span></li>
                    <li><cite>咨询师手机</cite><span>${consult.id}</span></li>
                    <li><cite>用户名称</cite><span>${order.userName }</span></li>
                    <li><cite>用户手机</cite><span>${user.id}</span></li>
                </ul>
            </div>
            <div class="item_line">
                <div class="w700">
                	<c:forEach var="project" items="${projects }">
                        	<div class="picMain">
                         	<p class="cp">
                         	<!--无图默认img onerror="this.src='image/p108.gif'" src="image/p108.gif"-->
                         	 <img src="${ctx }/upload${project.cover}" onerror="this.src='${ctx }/assets/images/p108.gif'">
                         	</p>
                         	<div class="picT">
                        	 <p>${project.name }</p>
                         	<p>${project.information }</p>
                         	</div>
                         </div>
                   </c:forEach>
                    <p class="moneyP">协商金额：<em class="yuanjia">￥${order.total }</em>￥${order.money }</p>
                </div>
            </div>
            <div class="item_line">
                <div class="w700">
                    <p class="moneyS c_pink">订金金额<em class="ml40">￥${order.firstMoney }</em></p>
                    <p class="moneyS">尾款金额<em class="ml40">￥${order.finalMoney }</em></p>
                </div>
            </div>
            <div class="item_line">
                <ol>
                </ol>
            </div>
        </div>
        <!--订单详情end-->
        <ul class="tabNav">
            <li>订单状态</li>
        </ul>
        <!--订单状态start-->
        <div class="tabCont" style="display: block;">
        	<c:if test="${order.state>='1' }">
        		 <!--订单已确认-->
        		  <div class="item_line zhuangT">
                 <h4 class="c_petrol petrolH"><cite>1</cite>订单已确认</h4>
                 	<p class="pl38"><em>订单确认时间</em>${order.sureTime }&nbsp;&nbsp;&nbsp;&nbsp;</p>
            	 </div>
               
        	</c:if>
             <c:if test="${order.state>='2'&&order.state<='6' }">
                <!--预付款已付-->
                <div class="item_line zhuangT">
                    <h4 class="c_green greenH"><cite>2</cite>预付款已付</h4>
                    <ol class="pl38">
                        <li><cite>支付时间</cite><span>${order.firstTime }</span></li>
                        <li><cite>订金金额</cite><span>${order.firstMoney }</span></li>
                    </ol>
                    
                     <c:if test="${order.state>='4'&&order.state<='6' }">
                        <h4 class="c_green greenH"><cite>3</cite>已支付尾款</h4>
                        <ol class="pl38">
                            <li><cite>支付时间</cite><span>${order.finalTime }</span></li>
                            <li><cite>订金金额</cite><span>${order.finalMoney }</span></li>
                        </ol>
                    </c:if>
                    
                    
                     <!--修改状态-->
                    <!-- <div id="wanjie_div" style="display: none">
                        <iframe id="orderIframe" name="orderIframe" width="0" height="0" style="display:none"></iframe>
                        <form target="" id="" name="" action="" method="POST" novalidate="novalidate">
                            <div class="repForm pl38">
                                <label class="radio-inline" style="width:100%">
                                    <input type="radio" name="weikuan_radio" value="0" checked="true">已支付订单尾款金额
                                </label>
                                <label class="radio-inline" style="width:100%">
                                    <input type="radio" name="weikuan_radio" value="1">已支付如下尾款金额（如尾款金额与订单协商金额不一致，请填写）
                                </label>
                            </div>
                            <div class="cname pl38 mt20" id="weikuan_div" style="display: none">
                                <textarea class="w700" rows="5" placeholder="请输入内容" name="order_remark" id="order_remark"></textarea>
                                <input type="text" class="w700" placeholder="请输入尾款金额" name="order_weikuan_price" id="order_weikuan_price">
                                <input type="hidden" name="wanjie_order_id" id="wanjie_order_id" value="89">
                            </div>
                            <input class="load_head ml38 mt20" type="submit" value="确认完结" id="button_has_weikuan" style="border:none;display: none">
                            <input class="load_head ml38 mt20" type="button" value="确认完结" id="button_not_weikuan" style="border:none" onclick="wanjie(89)">
                            <input class="load_head ml38 mt20" type="reset" value="取消" style="border:none" onclick="$('#wanjie_div').hide()">
                        </form>
                    </div> -->
                </div>
                </c:if>
        </div>
         <!--订单状态end-->
        <ul class="tabNav">
            <li>服务状态</li>
        </ul>
        <!--服务状态start-->
        <div class="tabCont" style="display: block;">
            <c:if test="${appraise!=null }">
            <div class="item_line">
                 <h5>已评价</h5>
                    <div class="fwpj">
                        <h5>本次服务针对医院评价</h5>
                           <ol>
                                <li><cite>医院环境满意度</cite>
                                	<img src="${ctx}/assets/images/iss${appraise.huanjing }.png" alt="">
                                </li>
                                <li><cite>项目执行满意度</cite>
                                	<img src="${ctx}/assets/images/iss${appraise.zhixing }.png" alt="">
                                </li>
                                <li><cite>医疗团队专业度</cite>
                                <img src="${ctx}/assets/images/iss${appraise.tuandui }.png" alt="">
                                </li>
                            </ol>
                    </div>
                    <div class="fwpj">
                        <h5>本次服务针对咨询师评价</h5>
                           <ol>
                                <li><cite>服务整体满意度</cite>
                                	<img src="${ctx}/assets/images/iss${appraise.zhengti }.png" alt="">
                                </li>
                                <li><cite>业务领域专业度</cite>
                                	<img src="${ctx}/assets/images/iss${appraise.yewu }.png" alt="">
                                </li>
                            </ol>
                    </div>
            </div>
            </c:if>
            <c:if test="${appraise==null }">
            	<div class="item_line">
                    <!--无内容-->
                    <h5>未评价</h5>
                    <ol>
                        <li>用户还未做出评价</li>
                    </ol>
            </div>
            </c:if>
        </div>
        <!--服务状态end-->
    </div>
    <div class="btn_tab">
        <input type="button" class="input_green" value="返回" onclick="window.history.go(-1);">
    </div>
</div>
    
    
<script type="text/javascript">
    
</script>
</body>
</html>