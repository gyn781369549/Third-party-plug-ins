<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/taglib.jsp" %>
<style type="text/css">
	#search_result_ul{
	display: none;
    position: absolute;
    background: #f1f1f1;
    width: 150px;
    margin-top: 6px;}
    #search_result_ul li{
	    border-bottom: 1px solid #ccc;
	    font-size: 14px;
	    line-height: 28px;
	    padding-left: 10px;
    }
</style>
</head>
<body>
	<div class="inquire_box">
 <input
				type="button" value="新增录入" class="btn_inquire"
				onclick="window.location.href = '${ctx}/mall/mallFengAction/activitySave'">
				
				
					商品
  							
				<select  name=selectname id=select1 onchange="gradeChange()" >
							
							
							
							
				</select>
				</div>
	<!--right Start-->
	<form action="${ctx }/console/hospitalInf_list" id="foodsForm" namespace="/console"
		method="post">
		

		<input type="hidden" name="page">
		<s:hidden name="pagesize"></s:hidden>
		<input type="hidden" name="del" />
		<div class="inquire_list">
			<table class="table">
				<thead>
					<tr>
						<td width="">活动名</td>
						<td width="">活动类型</td>
						<td width="">操作</td>
						
						
					</tr>
					
					

					</tr>
				</thead>
				<tbody>
					<c:set var="index" value="0"></c:set>
					<c:forEach var="account" items="${fl}" 
						varStatus="status">
						<tr>

							
							<td class="account_name">${account.title}</td>
							<td class="account_name">${account.typeValue}</td>
							
						
					
						
							<td>
								<div class="operation_box">
									<p class="operation_link">
										<a
											href="${ctx }/mall/mallFengAction/listView?id=${account.id}">
											<em class="look_details_ico"></em>编辑
										</a>
									</p>
								</div>
							
							</td>
						</tr>
						
					</c:forEach>

				</tbody>
			</table>
		
			<!--page End-->

		</div>
	</form>

	<script type="text/javascript" src="${ctx }/assets/js/country.js"></script>
		<script type="text/javascript">
			$().ready(function() {
				
			$("#searchHosAccount").keyup(function(){
				var kw = $(this).val();
				if(kw==''){
					$("#search_result_ul").css('display','none');
					$("#search_result_ul").html("");
				}else{
					$("#search_result_ul").html("");
					if(kw.length>1){
						$.ajax({
							url:"hospitalInf_getNames",
							type:"POST",
							data:{'kw':kw,"way":"inf"},
							dataType:"JSON",
							success:function(data){
								var val = data;
								$.each(val,function(i,v){
									$("#search_result_ul").css('display','block');
									$("#search_result_ul").append("<li>"+v+"</li>");
								});
							}
						});
					}
				}
			});
			
			
			$("#searchHosAccount").next().on('click','li',function(){
				var li = $(this);
				var searchVal = li.text();
				$("#searchHosAccount").val(searchVal);
				li.parent().html("");
			});
			

			
			$(".datepicker").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : 'yy-mm-dd'
			});//日期修改年份
			
			//调用联动
			$(window).selectCity({
				province : '.province',
				city : '.city',
				value : '',
				callback : function(indexArr) {
					$("#cityVal").val(provinceArr[indexArr[0]]+ 
							","+ 
							cityArr[indexArr[0]][indexArr[1]]);
				}
			});
			});
			
			//切换用户状态 弹出框
			function switchStatus(e) {
				
				var tr = $(e).parent().parent().parent();
				$('#switchStatusHosId').val($.trim($(e).next().val()));
				$('#switchStatusK').val($.trim($(e).next().next().val()));
				var html1 = '<img alt="" src="../assets/images/close_hint_pic.png"><h3>您是否要修改该医院状态为关闭？</h3><p>将该医院账号状态修改为关闭，</p><p>则该医院所有咨询师将不能登录及使用美滴滴系统！</p>';
				var html2 = '<img alt="" src="../assets/images/ture_hint_pic.png"><h3>您是否要修改该医院状态为开启？</h3><p>将该医院账号状态修改为开启，</p><p>则该医院所有咨询师将能正常登录及使用美滴滴系统！</p>';
				
				($(e).next().next().val() == "1") ? $(
						'#switchStatusTips').html(html1)
						: $('#switchStatusTips').html(html2);
				resetPsdIndex = layer.open({
					type : 1,
					title : false,
					shadeClose : true,
					closeBtn : false,
					maxmin : true,
					content : $('#switchStatusDiv')
				});
			}
			
			
			//执行切换用户状态
			function doSwitchStatus(e) {
				var h_id = $('#switchStatusHosId').val();
				var k = $('#switchStatusK').val();
				//var status = ($("#checkbox_d" + k).attr("checked") == "checked") ? 2 : 1;
				$.ajax({
					type : "POST",
					url : "hospitalInf_check",
					data : {
						"id" : h_id,
						"state" : k
					},
					success : function(data) {
						if (data == 'success') {
							layer.alert("操作成功", {
								title : false,
								closeBtn : false
							}, function() {
								window.location.href = "hospitalInf_list";
							});
							$("#checkbox_d" + k).click();
						} else {
							layer.alert("操作失败，请重试", {
								title : false,
								closeBtn : false
							}, function() {
								layer.closeAll();
							});
						}
					}
				});
			}
			
			  //发送链接
			function toUrl(url)
			{
				window.location.href=url; 
			}
			$("#sele1111ct1").click(function(){
			
			
				});
			function gradeChange(){
				var checkValue=$("#select1").val();
				//alert(checkValue);
				window.location.href="${ctx}/mall/mallFengAction/listView?pageSize=1000&type="+checkValue; 
				//alert("${ctx}/mall/listView?valid="+checkValue);
		       }
			
			
			window.onload=function()//用window的onload事件，窗体加载完毕的时候  http://www.meididi.com.cn/meididi/
			{
				
				
				$.ajax({	
					url:"${ctx}/api/mallFengAction/activityType",
					 dataType: "json", 
						async:false,
						success: function (data) {  
							var result =[];
							result= data["result"];//获取json中的 key
							var friends = $("#select1");
							friends.empty();
							for(var i=0;i<result.length;i++) {
								//if(result[i].value!=5&&result[i].value!=2){
									 var option = $("<option >").text('请选择').val('')
									if(i==0){
										 friends.append(option);
									}
									 option = $("<option >").text(result[i].name).val(result[i].value)
							   
							    friends.append(option);
							//	}
							}
						}
			})

			}
		</script>
       	<!--right End-->
</body>
</html>