<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/taglib.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style type="text/css">
	.addTips{
			width: 100%;
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
<body  style="background-image:url(${contextPath}/manage/upload/img/bs.jpg);">
        <!--right Start-->
       	<h1><center>更新商品</center></h1>
        <div class="tabCont label_infor" id="tags" >
            <c:forEach  items="${lcdty}" varStatus="i" var="account">
           
          
             
           <form action="${contextPath}/mall/mallCommodityAction/update" method="post" name="picForm"
			enctype="multipart/form-data" style="font-size:120%;" >
			 <input type="text" style="display: none;" id="" value="${account.id}" name="cid" />
			<table   >
				<tr>
					<td style="width: 200px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商品标题:</td>
					<td> <input type="text" style="width: 200px;" id="title" value="${account.title}" name="title" /></td>
				</tr>
				
				<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商品封面图:</td>
					<td>
					<img style="width: 100px;height: 100px;" src="${account.coverpic}"  alt="pic" />
				
						</td>
				</tr>
				<tr>
				<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商品轮播图:</td>
					<td>
					
					<!--  -->
						 <c:forEach items="${account.slpic}" var="age" >  
  							
  						
							<img style="width: 100px;height: 100px;" src="${age}"  alt="pic" />
							</c:forEach>  
						</td>
				</tr>
				
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商品内容:</td>
					<td><textarea name="content"  cols="100" rows="3">${account.content}</textarea>

					</td>
				</tr>
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp安全性:</td>
					<td> 
					<textarea name="safety" id="safety" 
							cols="100" rows="3">${account.safety}</textarea>
					
					</td>
				</tr>
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp用途:</td>
					<td><textarea name="cuse" id="cuse"
							cols="100" rows="3" >${account.cuse}</textarea> </td>
				</tr>
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp原价:</td>
					<td> <input type="text" style="width: 90px;" id="cost" value="${account.cost}" name="cost" /></td>
				</tr>
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp售价:</td>
					<td> <input type="text"  style="width: 90px;" id="price"  value="${account.price}"  name="price" /></td>
				</tr>
					<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商品是否上线:</td>
					<td><select name=valid >
							<option value="y">上线</option>
							<option value="n">下线</option>
							</select></td>
				</tr>
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商品类别:</td>
							<td>
							<select name=id id=friend>
							
							</select>	</td>
				</tr>
				
				
				
				<tr>
					<td></td>
							<td><br /> <input type="submit" name="button"
						onclick="return isCheckForm();"   value="更新" /></td>
				</tr>
				
			
				
			</table>

		</form>
          </c:forEach>
        </div>
    <!--right End-->
	<script type="text/javascript">
	window.onload=function()//用window的onload事件，窗体加载完毕的时候  http://www.meididi.com.cn/meididi/
	{
		
		$.ajax({	
			url:"${contextPath}/mall/mallCommodityAction/typeList",
			 dataType: "json", 
				async:false,
				success: function (data) {  
					var result =[];
					result= data["result"];//获取json中的 key
					var friends = $("#friend");
					friends.empty();
					for(var i=0;i<result.length;i++) {
					    var option = $("<option >").text(result[i].type).val(result[i].id)
					    friends.append(option);
					}
				}
	})

	}
	//判断提交的表单
	function isCheckForm(){
		
		if($("#title").val()==null||$("#title").val().length<1){
			alert("请写标题");
			return false;
		}
	
		
		return true; 
		
	}
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