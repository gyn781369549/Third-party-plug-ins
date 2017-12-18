<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>

</head>
<body style="background:transparent;">
 <!--right Start-->
 	<div class="bwh_crumbs">当前位置：<a href="#" title="咨询师管理">咨询师管理</a><em>&gt;</em>咨询师列表</div>
		<div class="tabBox">
			<form id="zxsForm" style="margin:0px;" action="${ctx }/hospital/consultant_list" method="post">
				<input type="hidden" name="page">
				<input type="hidden" name="pagesize" >
				
				<div class="inquire_box">
					<div class="keyword_box"><em class="ico_search"></em>
					<input type="text" name="keywords" value="${keywords }" class="w195" placeholder="请输入咨询师姓名"></div>
					<div class="keyword_box"><em class="ico_search"></em>
					<input type="text" name="phone" value="${phone }" class="w195" placeholder="请输入手机号">
					</div>
					<input type="submit" class="btn_inquire" value="查询">
				</div>
				</form>
				<div class="inquire_list">
					<table class="table">
						<thead>
							<tr>
							<th width="5%">序号</th>
	                        <th width="10%">姓名</th>
	                        <th>性别</th>
	                        <th>手机</th>
	                        <th>级别</th>
	                        <th>抢单成功数</th>
	                        <th>专属用户数</th>
	                        <th width="17%">操作</th>
							</tr>
						</thead>
						<tbody>
						
						<c:set var="index" value="0"></c:set>
                    	<c:forEach var="consultant" items="${request.pageView.records}">
                    	<tr>
                        	<td class="account_id">
                        		${index+1 }
                        	</td>
                        	<td class="account_name">
                        		${consultant.name }
                        	</td>
                        	<td>
                        		<c:if test="${consultant.sex==0 }">女</c:if>
                        		<c:if test="${consultant.sex==1 }">男</c:if>
                        	</td>
                        	<td>${consultant.phone }</td>
                       	 	<td>${consultant.lv }</td>
                        	<td>${consultant.orderAmount }</td>
                        	<td>${consultant.userAmount }</td>
                        	
                        	<%-- <td>
                        	
                            	<a id="sub147"  href="javascript:;" onclick="switchStatus(this)" class="summary_a input_pink" >删除</a>
                            <input type="hidden" value="${consultant.state }" />
                        	</td> --%>
                        	<td>
                        	<div class="operation_box">
                                <p class="operation_link" style="width:42px;text-align: center;">
									<a href="${ctx }/hospital/consultant_input?id=${consultant.id}">编辑</a>
								</p>
								<div class="wrap">
									<input type="hidden" id="consultantId" value="${consultant.id}" />
									<input zid="${consultant.id }" onclick="switchStatus(this)" is_in="${consultant.state }" type="button" id="checkbox_d${index}" class="chk_4" >
									<label for="checkbox_d${index }"></label>
								</div>
							</div>
							</td> 
                    	</tr>
                    
                    <c:set var="index" value="${index+1 }"></c:set>
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
	
	
		<!-- <div class="popup_box" id="switchStatusDiv" style="display: none">
                <cite class="popup_t">重要提示</cite>
                <div class="password_box">
                    <div class="hint_box" id="switchStatusTips">
                        <img alt="" src="../assets/images/close_hint_pic.png">
                        <h3>您是否要进行删除操作？</h3>
                        <p>本次删除只是冻结用户，</p>
                        <p>在冻结用户列表中进行恢复或彻底删除！</p>
                    </div>
                    <p class="password_btn">
                        <input type="button" class="input_green" value="确认" onclick="doSwitchStatus(this)">
                        <input type="hidden" id="switchStatusHosId">
                        <input type="hidden" id="switchStatusK">
                        <input type="submit" class="input_grey ml60" value="取消" onclick="layer.closeAll();">
                    </p>

                </div>
            </div> -->
	<!--咨询师列表-关闭提示 start-->
 	<div class="popup_box infoclose" id="switchStatusDiv" style="display:none;">
		<cite class="popup_t">重要提示</cite>
		<div class="popup_cont">
			<div class="create_box">
				<img alt="" src="../assets/images/close_hint_pic.png">
				<h3>您是否要进行删除操作？</h3>
                <p>若需恢复，请联系管理员！</p>
                <p>若无法重新创建，请联系管理员</p>
			</div>
			<p class="popup_btn">
				<span class="popup_btn_p">
					<input onclick="doSwitchStatus(this)" type="button" value="确定" class="input_green mr20">
					<input type="hidden" id="switchStatusHosId">
                       <input type="hidden" id="switchStatusK">
					<input onclick="layer.closeAll();" type="button" value="取消" class="input_green">
				</span>
			</p>
		</div>
	</div>
	
		<!--right End-->
<script>

//切换用户状态 弹出框
function switchStatus(e) {
	var tr = $(e).prev();
    $('#switchStatusHosId').val($.trim(tr.val()));
    $('#switchStatusK').val($(e).next().val());
    var html1 = '<img alt="" src="../assets/images/close_hint_pic.png"><h3>您是否要进行删除操作？</h3><p>本次删除只是冻结用户，</p><p>在冻结用户列表中进行恢复或彻底删除！</p>';
    $('#switchStatusTips').html(html1);
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
function doSwitchStatus(e) {
    var id = $('#switchStatusHosId').val();
    var k = $('#switchStatusK').val();
    var status = ($("#checkbox_d" + k).attr("checked") == "checked") ? 0 : 1;
    $.ajax({
        type: "POST",
        url: "consultant_check",
        data:{"id":id,"state":"0"},
        success: function (data) {
            if (data == '1') {
                layer.alert("操作成功", 
                		{title: false, closeBtn: false}, 
                		function () {layer.closeAll();
                });
                window.location.href = 'consultant_list';
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