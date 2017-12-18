<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
</head>
<body>
        <!--right Start-->
            <form action="${ctx }/console/consultant_list" id="foodsForm" namespace="/console" method="post">
            <div class="inquire_box">
                    <div class="keyword_box" style="width:177px;">
                        <em class="ico_search"></em>
                        <input type="text" class="w195" placeholder="请输入医院名称" name="hosName" value="${hosName }"
                               style="width:140px !important">
                    </div>
                    <div class="keyword_box" style="width:177px;">
                        <em class="ico_search"></em>
                        <input type="text" class="w195" placeholder="请输入姓名" name="keywords" value="${keywords}"
                               style="width:140px !important">
                    </div>
                    <div class="keyword_box" style="width:177px;">
                        <em class="ico_search"></em>
                        <input type="text" class="w195" placeholder="请输入手机号" name="phone" value="${requestScope.phone}"
                               style="width:140px !important">
                    </div>
                	
                  <!--   <input type="text" placeholder="选择时间" id="datepicker" style="height: 33px; line-height: 33px; width: 90px; margin-bottom: 0px;" class="meidd_select " 
                    	name="time" value="选择时间"> -->
                    
                    <input type="submit" class="btn_inquire" value="查询">
               
            </div>
			<input type="hidden" name="page">
			<s:hidden name="pagesize"></s:hidden>
            <div class="inquire_list">
                <table class="table">
                    <thead>
                    <tr>
                        <th width="5%">序号</th>
                        <th width="10%">姓名</th>
                        <th width="20%">医院名称</th>
                        <th width="8%">平台编号</th>
                        <th>手机编号</th>
                        <th>性别</th>
                        <th>级别</th>
                        <th>抢单成功数</th>
                        <th>专属用户数</th>
                        <th width="17%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="index" value="0"></c:set>
                    <c:forEach var="consultant" items="${request.pageView.records}" >
                    	<tr>
                    	
                        <td class="account_id">
                        	${index+1 }
                        </td>
                        <td class="account_name">
                        	${consultant.name }
                        </td>
                        <td>${consultant.hosName }</td>
                        <td><span>${consultant.id}</span></td>
                        <td>${consultant.phone }</td>
                        <td>
                        	<c:if test="${consultant.sex==0 }">女</c:if>
                        	<c:if test="${consultant.sex==1 }">男</c:if>
                        </td>
                        <td>${consultant.lv }</td>
                        <td>${consultant.orderAmount }</td>
                        <td>${consultant.userAmount }</td>
                        
                        
                        <td style="position:relative;">
                        	<input type="hidden" id="consultantId" value="${consultant.id}" />
                            <a id="sub147"  href="javascript:;" onclick="deleteConsultant(this)" d_id="${consultant.id}" class="summary_a input_pink" >删除</a>
                            <input type="hidden" value="${consultant.state }" />
                            <div class="zt_switch_shade" onclick="consultantStatus(this)" c_id="${consultant.id}"></div>
                            <div class="wrap"  >
                                <input type="checkbox" id="checkbox_d${index }" c_state="${consultant.state}"
                                    	class="chk_4" <c:if test="${consultant.state== '1' }"> checked='checked'</c:if>>
                                <label for="checkbox_d${index }"></label>
                            </div>
                            
                        </td>
                    </tr>
                    
                    <c:set var="index" value="${index+1 }"></c:set>
                    </c:forEach>
                    
                    </tbody>
                </table>
                <!--page Start-->

                <div class="meidd_page_box">
                    <%@ include file="common/page.jsp"%>
                </div>
                <!--page End-->

            </div>
            </form>
            

            <div class="popup_box" id="delDiv" style="display: none">
                <cite class="popup_t">重要提示</cite>
                <div class="password_box">
                    <div class="hint_box">
                        <img alt="" src="../assets/images/close_hint_pic.png">
                        <h3>您是否要进行删除操作？</h3>
                        <p>彻底删除后无法恢复！</p>
                    </div>
                    <p class="password_btn">
                        <input type="button" class="input_green" value="确认" onclick="doDelete(this)">
                        <input type="hidden" id="delId">
                        <input type="button" class="input_grey ml60" value="取消" onclick="layer.closeAll();">
                    </p>

                </div>
            </div>
            
            
            <!-- 设置有效性 -->
            <div class="popup_box" id="consultantStatusDiv" style="display: none">
                <cite class="popup_t">重要提示</cite>
                <div class="password_box">
                    <div class="hint_box" id="switchStatusTips">
                        <img alt="" src="../assets/images/close_hint_pic.png">
                        
                    </div>
                    <p class="password_btn">
                        <input type="button" class="input_green" value="确认" onclick="doSwitchStatus(this)">
                        <input type="hidden" id="switchStatusHosId">
                        <input type="hidden" id="switchStatusK">
                        <input type="submit" class="input_grey ml60" value="取消" onclick="layer.closeAll();">
                    </p>

                </div>
            </div>
       	<!--right End-->
       	
	<script type="text/javascript">
	$("#datepicker").datepicker({
		changeMonth: true,
		changeYear: true, dateFormat: 'yy-mm-dd'
	});//日期修改年份
	
	//删除 弹出框
    function deleteConsultant(e) {
    	var tr = $(e);
    	var id = tr.attr("d_id");
        $('#delId').val(id);
        //$('#switchStatusHosId').val($.trim(tr.val()));
        //$('#switchStatusK').val($(e).next().val());
        //var html1 = '<img alt="" src="../assets/images/close_hint_pic.png"><h3>您是否要进行删除操作？</h3><p>本次删除只是冻结用户，</p><p>在冻结用户列表中进行恢复或彻底删除！</p>';
        //$('#switchStatusTips').html(html1);
        resetPsdIndex = layer.open({
            type: 1,
            title: false,
            shadeClose: true,
            closeBtn: false,
            maxmin: true,
            content: $('#delDiv')
        });
    }

    //执行删除
    function doDelete(e) {
        var id = $('#delId').val();
        //var k = $('#switchStatusK').val();
        //var status = ($("#checkbox_d" + k).attr("checked") == "checked") ? 0 : 1;
        $.ajax({
            type: "POST",
            url: "consultant_delete",
            data:{"id":id},
            success: function (data) {
                if (data == '1') {
                    layer.alert("操作成功", 
                    		{title: false, closeBtn: false}, 
                    		function () { window.location.href = 'consultant_list';
                    });
                   
                } else {
                    layer.alert("操作失败，请重试", {title: false, closeBtn: false}, function () {
                        layer.closeAll();
                    });
                }
            }
        });
    }
    
    
    //切换用户状态 弹出框
    function consultantStatus(e) {
    	var tr = $(e);
    	var id = tr.attr("c_id");
        $('#switchStatusHosId').val(id);
        $('#switchStatusK').val($(e).next().find("input:first").attr("c_state"));
        var html1 = '<img alt="" src="../assets/images/close_hint_pic.png"><h3>您是否要关闭该咨询师？</h3>';
        var html2 = '<img alt="" src="../assets/images/ture_hint_pic.png"><h3>您是否要恢复该咨询师？</h3>';
        var html = ($('#switchStatusK').val()=="1")?html1:html2;
      	$('#switchStatusTips').html(html);
        layer.open({
            type: 1,
            title: false,
            shadeClose: true,
            closeBtn: false,
            maxmin: true,
            content: $('#consultantStatusDiv')
        });
    }

    //执行切换用户状态
    function doSwitchStatus(e) {
        var h_id = $('#switchStatusHosId').val();
        var k = $('#switchStatusK').val();
        var status = (k == "0") ? 1 : 0;
        $.ajax({
            type: "POST",
            url: "consultant_check",
            data:{"id":h_id,"state":status},
            success: function (data) {
                if (data == '1') {
                    layer.alert("操作成功", 
                    		{title: false, closeBtn: false}, 
                    		function () {window.location.href = "consultant_list";
                    });
                   
                } else {
                    layer.alert("操作失败，请重试", {title: false, closeBtn: false}, function () {
                    	window.location.href = "consultant_list";
                    });
                }
            }
        });
    }
    
	</script>
</body>
</html>