<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
<style type="text/css">
	.addTips{
		width: 300px;
		margin-left:20px; 
	}
	.addTips>input[type='text']{
		width: 140px;
		height: 32px;
		margin-left: 20px;
		margin-right: 20px;
	}
</style>
</head>
<body>
        <!--right Start-->
       
        <div class="tabCont label_infor" id="tags" >
            <div class="label_all">

                <h6>标签</h6>
                <ul class="label_box" id="label_cur">
                	<c:if test="${tips !=null }">
	                	<c:forEach var="tip" items="${tips}">
	                		<li p_id="${tip}">
	                    		<input type="hidden" name="tips" value="${tip}">
	                     		<a href="javascript:;" onclick="deleteTips(this)" d_id="${tip.id }">${tip.content }</a>
	                     	</li>
	                	</c:forEach>
                	</c:if>
                    
                </ul>
            </div>
            <form action="${ctx }/console/tips_input" method="post">
            <div class="addTips">
            	<span>添加标签:</span>
            	<input type="text" width="160px;" height="40px;" name="tips.content"  />
            	<input type="submit" value="提交" />
            </div>
            </form>
        </div>
    <!--right End-->
	<script type="text/javascript">
		function deleteTips(e){
			var id = $(e).attr("d_id");
			layer.confirm('确认要删除该标签吗', {
				  btn: ['确定','取消']
				}, function(){
				 	$.ajax({
				 		url:"tips_del",
				 		type:"POST",
				 		data:{'id':id},
				 		success:function(data){
				 			if('1'==data){
				 				layer.alert("操作成功",function(){
				 					window.location.href = "tips_list";
				 				});
				 			}else{
				 				layer.alert("操作失败");
				 			}
				 		}
				 	});
				}, function(){
				  layer.closeAll();
				});
		}
	</script>
    
</body>
</html>