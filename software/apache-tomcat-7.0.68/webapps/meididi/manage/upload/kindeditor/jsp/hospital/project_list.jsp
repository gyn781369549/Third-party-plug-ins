<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
</head>
<body style="background:transparent;">
 <!--right Start-->
 	<div class="bwh_crumbs">当前位置：<a href="javascript:void(0);" title="项目管理">项目管理</a><em>&gt;</em>项目列表</div>
    <div class="tabBox">
        <div class="inquire_box">
            <form id="yw0" action="${ctx }/hospital/project_list" method="post">
            <input type="hidden" name="page">
			<input type="hidden" name="pagesize" >
			<div class="keyword_box">
                <em class="ico_search"></em>
                <input type="text" class="w197" placeholder="请输入项目标题" name="keywords" value="${keywords }">
            </div>
            <select class="meidd_select" name="tips">
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
                <input type="text" name="start"  class="test-style datepicker"  placeholder="开始时间" value="${start }">
                <label class="time-text">至</label>
                <input type="text" name="end" class="test-style datepicker" placeholder="结束时间" value="${end }">
            </p>
            <input type="submit" class="btn_inquire" value="搜索">
            <input type="button" value="新建项目" class="btn_inquire" onclick="window.location.href = '${ctx}/hospital/project_input'" />
            </form>        
        </div>
        <div class="inquire_list">
            <table class="table">
                <thead>
                    <tr>
                        <th width="8%">序号</th>
                        <th width="20%">创建时间</th>
                        <th width="20%">项目标题</th>
                        <th width="">项目标签</th>
                        <th width="10%">项目金额</th>
                        <th width="30%">操作</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="project" items="${request.pageView.records }" varStatus="status" >
                		<tr>
                            <td>${status.index+1}</td>
                            <td>${project.createTime }</td>
                            <td>${project.name }</td>
                            <td><span class="col_smoke">
                            	<c:set var="tips" value="${fn:split(project.tips,',')}"></c:set>
                            	<c:if test="${fn:length(tips)>0 }">
                            		<c:forEach var="tip" items="${tips }">
                            			${allTips[tip]}
                            		</c:forEach>
                            	</c:if>
                            	
                            </span></td>
                            <td>${project.money }</td>
                            <td>
                                <div class="operation_box">
                                    <p class="operation_link">
                                        <a href="${ctx}/hospital/project_show?id=${project.id}"><em class="look_details_ico"></em>查看详情</a>
                                    
                                        <a href="${ctx}/hospital/consultant_cForumInput?projectId=${project.id}"><em class="look_details_ico"></em>添加案例</a>
                                  
                                      <!--   <a href="${ctx}/hospital/consultant_cForumInput?projectId=${project.id}"><em class="look_details_ico"></em>查看案例</a> -->
                                    </p>
                                    <div class="wrap">
                                    <div onclick="switchStatus(${status.index+1},${project.id})" class="zt_switch_shade"></div>
                                    	<input type="checkbox" <c:if test="${project.state==1 }">checked='checked'</c:if> class="chk_3 chk_4" id="checkbox_d${status.index+1 }">
                                    	<label for="checkbox_d${status.index+1 }"></label>
                                    </div>
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

<div class="popup_box" id="switchStatusDiv" style="display: none">
    <cite class="popup_t">重要提示</cite>
    <div class="popup_cont">
        <div class="hint_box create_box" id="switchStatusTips"></div>
        <p class="popup_btn">
            <span class="popup_btn_p">
                <input type="submit" class="input_green mr20" value="确认" onclick="doSwitchStatus()">
                <input type="hidden" id="switchStatusProId">
                <input type="hidden" id="switchStatusK">
                <input type="submit" class="input_green" value="取消" onclick="layer.closeAll();">
            </span>
        </p>
    </div>
</div>
<script>
    $().ready(function(){
    	$(".datepicker").datepicker({
    		changeMonth: true,
    		changeYear: true, dateFormat: 'yy-mm-dd'
    	});//日期修改年份
    });
	
    //切换用户状态 弹出框
    function switchStatus(i,k) {
        var html1 = '<h1>您是否需要将该项目下线？</h1><h2>进行项目下线操作后</h2><h2>将不支持前端用户查看、咨询师不可推荐给用户购买！</h2>';
        var html2 = '<h1>您是否需要将该项目上线？</h1><h2>进行项目上线操作后</h2><h2>将支持前端用户查看、咨询师推荐给用户购买！</h2>';

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
                    window.location.href = window.location.href;
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