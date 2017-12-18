<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
</head>
<body>
        <!--right Start-->
            <form action="consultant_list" id="foodsForm" namespace="/console" method="post">
            	<input type="hidden" value="reg" name="way" />
            	<div class="inquire_box">
                    <div class="keyword_box" style="width:177px;">
                        <em class="ico_search"></em>
                        <input type="text" class="w195" placeholder="请输入医院名称" name="keywords" value=""
                               style="width:140px !important">
                    </div>
                    
                	
                    <input type="text" placeholder="选择时间" id="datepicker" style="height: 33px; line-height: 33px; width: 90px; margin-bottom: 0px;" class="meidd_select " 
                    	name="time" value="" readonly="readonly" />
                    
                    <input type="submit" class="btn_inquire" value="查询">
               
            </div>
			<input type="hidden" name="page">
			<s:hidden name="pagesize"></s:hidden>
			<input type="hidden" name="del" />
            <div class="inquire_list">
                <table class="table">
                    <thead>
                    <tr>
                        <th width="5%">序号</th>
                        <th width="14%">申请手机号</th>
                        <th width="16%">医院名称</th>
                        <th width="16%">医院联络人</th>
                        <th width="16%">提交时间</th>
                        <th>联络纪要</th>
                        <th width="16%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="consultant" items="${request.pageView.records}" varStatus="status">
                    	<tr>
                    	
                        <td class="account_id">
                        	${status.index+1 }
                        </td>
                        <td class="account_name">
                        	${consultant.phone }
                        </td>
                        <td>${consultant.hosName }</td>
                        <td><span>${consultant.hosContacts }</span></td>
                        <td>${fn:substring(consultant.createTime,0,10)}</td>
                        
                        <td>
                        	<div class="summary_box">
                                <p class="summary" id="p${consultant.id }" style="display: block;">
                                    <span id="span${consultant.id }">${consultant.summary }</span>
                                </p>
                                <textarea id="textarea${consultant.id }" class="summary_all" style="display: none;" name="summary"></textarea>
                            </div>
                        </td>
                        
                        <td>
                            <a id="up${consultant.id}" item="${consultant.id}" href="javascript:;" class="summary_a summary_change input_green" style="">修改</a>
                            <a id="sub${consultant.id}" item="${consultant.id}" href="javascript:;" class="summary_a summary_submit input_pink" style="display: none;">保存</a>
                        </td>
                    </tr>
                    
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

       	<!--right End-->
	<script type="text/javascript">
	$("#datepicker").datepicker({
		changeMonth: true,
		changeYear: true, dateFormat: 'yy-mm-dd'
	});//日期修改年份
	
	$().ready(function(){
		var change = $(".summary_change");
		var submit = $(".summary_submit");
		
		
		change.click(function(){
			var id = $(this).attr("item");
			console.log(id);
			$(this).css('display','none');
			$(this).next().css('display','block');
			$("#textarea"+id).css('display','block');
			$("#p"+id).css('display','none');
			
		});
		
		submit.click(function(){
			var summarySub = $(this);
			var id = $(this).attr("item");
			var val = $("#textarea"+id).val();
			console.log(val);
			$.ajax({
				url:"consultant_summary",
				data:{'id':id,'summary':val},
				type:"POST",
				dataType:"json",
				success:function(data){
					console.log(data);
					//var json = $.parseJSON(data);
					//console.log(json);
					if(data.code==0){
						layer.alert("操作成功",function(){
							summarySub.css('display','none');
							summarySub.prev().css('display','block');
							$("#textarea"+id).css('display','none');
							$("#textarea"+id).val("");
							$("#p"+id).css('display','block');
							$("#p"+id).text(data.result);
							layer.closeAll();
						});
					}else{
						layer.alert("操作失败");
					}
				}
			});
			
		});
		
	});
	
	</script>
</body>
</html>