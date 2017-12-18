<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                    <th colspan="2" class="c_error f16">订单详情</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td width="11%"><br/></td>
                </tr>
                <tr>
                    <td width="11%">订单编号</td>
                    <td>${order.number }</td>
                </tr>
               <tr>
                    <td>创建时间</td>
                    <td>${order.sureTime }</td>
                </tr>
                
                <tr>
                    <td>医院名称</td>
                    <td>${order.hosName }</td>								
                </tr>
                
                <tr>
                    <td>咨询师</td>
                    <td>${order.conName }</td>
                </tr>
                <tr>
                    <td>医院地址</td>
                    <td>${hosInf.countries }${hosInf.address }</td>
                </tr>
                <tr>
                    <td>医院电话</td>
                    <td>${hosInf.phone }</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="indent_infor">
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
                            <div class="moneDiv">
                                <p class="moneyS c_pink">订金金额<em class="ml40">￥${order.firstMoney }</em></p>
                                <p class="moneyS">尾款金额<em class="ml40">￥${order.finalMoney }</em></p>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                <td>预约时间</td>
                <td>
                	<c:if test="${order.time!=''}">
               		${order.time}
                	</c:if>
                	<c:if test="${order.time==''}">
               			未设定预约时间
                	</c:if>
                	
                </td>
                </tr>
                
                <tr>
                    <td>备注信息</td>
                        <td>
                            <div class="project_intro">
                                <p>${order.content }</p>
                            </div>
                        </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="inquire_list account_infor project_infor">
        <table class="table">
            <thead>
                <tr>
                    <th colspan="2" class="c_error f16">订单状态</th>
                </tr>
            </thead>
        </table>
        <div class="indent_zt">
        	<c:if test="${order.state=='-1'}">
        		<dl class="c_dark_green">
                    <dt>1</dt>
                    <dd>
                        <cite>订单已取消</cite>
                       
                    </dd>
                </dl>
        	</c:if>
        	 
        	<c:if test="${order.state>='1' }">
        		 <!--订单已确认-->
                <dl class="c_dark_green">
                    <dt>1</dt>
                    <dd>
                        <cite>订单已确认</cite>
                        <p class="indent_p">
                            <span>订单确认时间</span>
                            <time>${order.sureTime }</time>
                        </p>
                    </dd>
                </dl>
        	</c:if>
             <c:if test="${order.state>='2'&&order.state<='6' }">
                <!--预付款已付-->
                <dl class="c_green">
                    <dt>2</dt>
                    <dd>
                        <cite>预付款已付</cite>
                        <p class="indent_p">
                            <span>支付时间</span>
                            <time>${order.firstTime }</time>
                        </p>
                        <p class="indent_p">
                            <span>订金金额</span>
                            <time>￥${order.firstMoney }</time>
                        </p>
                    </dd>
                </dl>
                </c:if>
                <c:if test="${order.state>='3'&&order.state<='6' }">
                <!--服务开始-->
                <dl class="c_orange">
                    <dt>3</dt>
                    <dd>
                        <cite>服务开始</cite>
                        <%-- <p class="indent_p">
                            <span>到院时间</span>
                            <time>${order.serverTime }</time>
                        </p> --%>
                    </dd>
                </dl>
                </c:if>
			<c:if test="${order.state>='5' }">
				<!--待完结已过-->
				<dl class="c_peach">
					<dt>4</dt>
					<dd>
						<cite>已支付尾款</cite>
						<p class="indent_p">
							<span>支付时间</span>
							<time>${order.finalTime }</time>
						</p>
						<p class="indent_p">
							<span>支付金额</span>
							<time>￥${order.finalMoney }</time>
						</p>
					</dd>
				</dl>
			</c:if>
			<c:if test="${order.state=='6' }">  
                    <!--已完结正常完结-->
                        <dl class="c_error">
                            <dt>5</dt>
                            <dd>
                                <cite>已完结</cite>
                                <p class="indent_p">
                                    <span>完结时间</span>
                                    <time>${order.overTime }</time>
                                </p>
                                <p class="indent_p">
                                    <span>完结金额</span>
                                    <time>￥${order.finalMoney }</time>
                                </p>
                                <p class="indent_p">
                                    <span>完结人</span>
                                    <time>${order.userName }</time>
                                </p>
                            </dd>
                       </dl>
              </c:if>
              <c:if test="${order.state=='9' }">  
                    <!--已完结正常完结-->
                        <dl class="c_error">
                            <dt>5</dt>
                            <dd>
                                <cite>有争议</cite>
                                <p class="indent_p">
                                    <span>时间</span>
                                    <time>${complain.time }</time>
                                </p>
                                <p class="indent_p">
                                    <span>描述</span>
                                    <time>${complain.content }</time>
                                </p>
                                <p class="indent_p">
                                    <span>实际金额</span>
                                    <time>￥${complain.price }</time>
                                </p>
                            </dd>
                       </dl>
                       
              </c:if>
              
        </div>
    </div>
    <div class="inquire_list account_infor project_infor"  >
    	<c:if test="${appraise!=null }">
        <table class="table">
            <thead>
                <tr>
                    <th colspan="2" class="c_error f16">服务状态</th>
                </tr>
            </thead>
            <!--已完成-->
             <tbody>
                    <tr><td colspan="2" class="c_green">已完成服务并评价</td></tr>
                    <%-- <tr>
                        <td width="14%">提交时间</td>
                        <td>${appraise.time }</td>
                    </tr> --%>
                    <tr><td colspan="2" class="c_green">已评价</td></tr>
                    <tr><td colspan="2" class="c_atrous">本次服务针对医院评价</td></tr>
                    <tr>
                        <td>医院环境满意度</td>
                        <td>
                            <img src="${ctx }/assets/images/iss${appraise.huanjing }.png" alt="">
                        </td>								
                    </tr>
                    <tr>
                        <td>项目执行满意度</td>
                        <td>
                            <img src="${ctx }/assets/images/iss${appraise.zhixing }.png" alt="">
                        </td>
                    </tr>
                    <tr>
                        <td>医疗团队专业度</td>
                        <td>
                            <img src="${ctx }/assets/images/iss${appraise.tuandui }.png" alt="">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="c_atrous">本次服务针对咨询师评价</td>
                    </tr>
                    <tr>
                        <td>服务整体满意度</td>
                        <td>
                            <img src="${ctx }/assets/images/iss${appraise.zhengti }.png" alt="">
                        </td>
                    </tr>
                    <tr>
                        <td>业务领域专业度</td>
                        <td>
                            <img src="${ctx }/assets/images/iss${appraise.yewu }.png" alt="">
                        </td>
                    </tr>
                </tbody>
       </table>
       </c:if>
       
       <c:if test="${appraise==null }">
       	<!-- 未评价 -->
       		<table class="table">
            <thead>
                <tr>
                    <th colspan="2" class="c_error f16">服务状态</th>
                </tr>
            </thead>
            <!--已完成-->
            <!--未完成-->
                <tbody>
                    <tr>
                        <td width="14%">未完成服务</td>
                        <td>用户还未确认完成服务</td>
                    </tr>
                    <tr>
                        <td>未评价</td>
                        <td>用户还未做出评价</td>
                    </tr>
                </tbody>
       		</table>
       </c:if>
       
    </div>
    <div class="btn_return"><input type="submit" value="返回" class="input_grey"  onclick="window.history.go(-1);"/></div>
<!--right End-->

</body>
</html>