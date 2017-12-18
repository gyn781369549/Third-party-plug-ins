<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx }/assets/css/jquery-ui.css">
</head>
<body>
        
        <div class="inquire_box2">
            <form id="yw0" action="${ctx }/console/project_list" method="post">
            <input type="hidden" name="page" />
            <div class="keyword_box" style="width:177px;">
            	<em class="ico_search"></em>
            	<input type="text" placeholder="请输入医院名称" name="hosName" value="${hosName }"
                       style="width:140px !important" id="searchHos">
            </div>
			<div class="keyword_box">
                <em class="ico_search"></em>
                <input type="text" class="w195" placeholder="请输入项目名称关键字" name="keywords" value="">
			</div>
           <%--  <select class="meidd_select" name="tips">
                <option value="">全部标签</option>	
            	<c:forEach var="tip" items="${allTips}">
            		<option value="${tip.key }" <c:if test="${tips==tip.key }">selected='selected'</c:if>>${tip.value }</option>	
            	</c:forEach>
            </select>
            <select class="meidd_select" name="state">
                <option value="" <c:if test="${state== '' }">selected='selected'</c:if> >全部状态</option>
                <option value="1" <c:if test="${state=='1' }">selected='selected'</c:if> >在线</option>
                <option value="0" <c:if test="${state=='0' }">selected='selected'</c:if> >下线</option>
            </select>
            <p class="time_box">
                <input type="text" name="start" readonly="readonly" class="test-style datepicker"  placeholder="开始时间" value="${start }">
                <label class="time-text">至</label>
                <input type="text" name="end" readonly="readonly" class="test-style datepicker" placeholder="结束时间" value="${end }">
            </p> --%>
            <input type="submit" class="btn_inquire" value="搜索">
            </form>
            </div>
        <div class="inquire_list">
            <table class="table">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th width="15%">上线时间</th>
                        <th width="16%">项目标题</th>
                        <th width="">项目金额</th>
                        <th width="18%">项目标签</th>
                        <th width="18%">医院名称</th>
                        <th width="20%">操作</th>
                    </tr>
                </thead>
                <tbody>
                        <c:forEach var="project" items="${request.pageView.records }" varStatus="status" >
                		<tr>
                            <td>${status.index+1}</td>
                            <td>${project.createTime }</td>
                            <td>${project.name }</td>
                            <td>${project.money }</td>
                            <td><span class="col_smoke">
                            	<c:set var="tips" value="${fn:split(project.tips,',')}"></c:set>
                            	<c:if test="${fn:length(tips)>0 }">
                            		<c:forEach var="tip" items="${tips }">
                            			${allTips[tip]}
                            		</c:forEach>
                            	</c:if>
                            	
                            </span></td>
                            <td>${hosNames[project.hosId]}</td>
                            <td>
                            	<div class="operation_box">
                                <p class="operation_link">
                        			<a href="${ctx}/console/project_show?id=${project.id}">
                        			<em class="look_details_ico"></em>查看详情</a>
                        			<a href="javascript:;"></a>
                                </p>
                                
                                <div class="zt_switch_shade" onclick="switchStatus(${status.index+1},${project.id})"></div>
                                <input type="hidden" value="${index }">
                                <div class="wrap">
                                    <input type="checkbox" id="checkbox_d${status.index+1 }" 
                                    	class="chk_4" <c:if test="${project.state==1 }">checked='checked'</c:if>>
                                    <label for="checkbox_d${status.index+1 }"></label>
                                </div>

                            	</div>
                                <%-- <div class="operation_box">
                                    <p class="operation_link">
                                        <a href="${ctx}/console/project_show?project.id=${project.id}"><em class="look_details_ico"></em>查看详情</a>
                                    </p>
                                    <div onclick="switchStatus(${status.index+1},${project.id})" class="zt_switch_shade"></div>
                                    <div class="wrap">
                                    	<input type="checkbox" <c:if test="${project.state==1 }">checked='checked'</c:if> class="chk_3 chk_4" id="checkbox_d${status.index+1 }">
                                    	<label for="checkbox_d${status.index+1 }"></label>
                                    </div>
                                </div> --%>
                            </td>
                        </tr>
                	</c:forEach>
                                           
                                         <!--    <tr>
                            <td>9</td>
                            <td>2016-03-09 15:03:14</td>
                            <td>玻尿酸</td>
                            <td><span class="col_smoke">注射美容</span></td>
                            <td>1,500.00</td>
                            <td>
                                <div class="operation_box">
                                    <p class="operation_link">
                                        <a href="http://meididi.com.cn/index.php?r=project/proDetail&p_id=38"><em class="look_details_ico"></em>查看详情</a>
                                    </p>
                                                                                              
                                </div>
                            </td>
                        </tr> -->
                </tbody>
            </table>
        </div>
    <!--page Start-->
    <div class="meidd_page_box">
    	<jsp:include page="common/page.jsp"></jsp:include>
           </div>
    <!--page End-->


<div class="popup_box" id="switchStatusDiv" style="display: none">
    <cite class="popup_t">重要提示</cite>
    <div class="password_box">
        <div class="hint_box " id="switchStatusTips"></div>
        <p class="password_btn">
                <input type="submit" class="input_green " value="确认" onclick="doSwitchStatus();">
                <input type="hidden" id="switchStatusProId">
                <input type="hidden" id="switchStatusK">
                <input type="submit" class="input_grey m160" value="取消" onclick="layer.closeAll();">
        </p>
    </div>
</div>
<script src="${ctx}/assets/js/jquery-ui.js" type="text/javascript"></script>
<script>
//初始化下拉框
$(".datepicker").datepicker({
	changeMonth: true,
	changeYear: true, dateFormat: 'yy-mm-dd'
});//日期修改年份
//自动完成
$("#searchHos").autocomplete({
	source:"hospitalInf_getNames?way=account",
	messages: {
        noResults: '',
        results: function() {}
    }
});
//切换用户状态 弹出框
function switchStatus(i,k) {
    var html1 = '<img alt="" src="../assets/images/close_hint_pic.png"><h3>您是否需要将该项目下线？</h3><p>进行项目下线操作后</p><p>将不支持前端用户查看、咨询师不可推荐给用户购买！</p>';
    var html2 = '<img alt="" src="../assets/images/ture_hint_pic.png"><h3>您是否需要将该项目上线？</h3><p>进行项目上线操作后</p><p>将支持前端用户查看、咨询师推荐给用户购买！</p>';

    $('#switchStatusProId').val(k);
    $('#switchStatusK').val(i);
    ($("#checkbox_d" + i).attr("checked") == "checked") ? $('#switchStatusTips').html(html1) : $('#switchStatusTips').html(html2);
    resetPsdIndex = layer.open({
        type: 1,
        title: false,
        shadeClose: true,
        closeBtn: false,
        maxmin: true,
        content: $('#switchStatusDiv')
    });
}

//执行切换用户状态
function doSwitchStatus() {

    var k = $('#switchStatusK').val();
    var p_id = $('#switchStatusProId').val();
    var status = ($("#checkbox_d" + k).attr("checked") == "checked") ? 0 : 1;
    $.ajax({
        type: "POST",
        url: "project_check",
        data:{id:p_id,state:status},
        success: function (data) {
            if (data == '1') {
                layer.alert("操作成功", {title: false, closeBtn: false}, function () {
                    layer.closeAll();
                });
                $("#checkbox_d" + k).click();
            } else {
                layer.alert("操作失败，请重试", {title: false, closeBtn: false}, function () {
                    layer.closeAll();
                });
            }
        }
    });
}
</script> 

</body>
</html>