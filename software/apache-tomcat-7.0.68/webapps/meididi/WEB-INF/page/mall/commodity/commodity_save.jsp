<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../common/taglib.jsp" %>
<head>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
	td{
	 style="height: 100px;";
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/manage/upload/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${contextPath}/manage/upload/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="${contextPath}/manage/upload/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="${contextPath}/manage/upload/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="${contextPath}/manage/upload/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="${contextPath}/manage/upload/kindeditor/jsp/js/jquery.cityselect.js"></script> 
<script language="javascript" src="${contextPath}/manage/upload/kindeditor/jsp/js/cityselect.js"></script>
<script src="${contextPath}/manage/upload/js/jquery-1.9.1.js"></script>


<script type="text/javascript">
			KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : '${contextPath}/manage/upload/kindeditor/plugins/code/prettify.css',
				uploadJson : '${contextPath}/manage/upload/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '${contextPath}/manage/upload/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
		
		
	</script>
</head>
<body style="background-image:url(${contextPath}/manage/upload/img/bs.jpg);" onload="init()">
        <!--right Start-->
       	<h1><center>商品发布</center></h1>
        <div class="tabCont label_infor" id="tags" >
            
           
            <form action="${contextPath}/mall/mallCommodityAction/add" method="post" name="picForm"
			enctype="multipart/form-data" style="font-size:120%;" >
			<table style="border-collapse:separate; border-spacing:0px 10px;">
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商品标题:</td>
					<td> <input type="text" style="width: 200px;" id="title" name="title" /></td>
				</tr>
				
			
				<tr>
					<td ><div id="ip5s">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商品封面图:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				<tr>
					<td ><div id="ip5s">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp轮播图1:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				
				<tr>
					<td ><div id="ip6s">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp轮播图2:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				<tr>
					<td ><div id="ip6p">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp轮播图3:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				<tr>
					<td ><div id="ip6p">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp轮播图4:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				<tr>
					<td ><div id="ip6p">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp轮播图5:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				 <div>
				<tr>
				<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp商品内容:</td>
					<td><textarea name="content" id="content"  cols="100" rows="8"></textarea>

					</td>
				</tr>
				</div>
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp安全性:</td>
					<td> 
					<textarea name="safety" id="safety" 
							cols="100" rows="3"></textarea>
					
					</td>
				</tr>
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp用途:</td>
					<td><textarea name="cuse" id="cuse"
							cols="100" rows="3" ></textarea> </td>
				</tr>
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp原价:</td>
					<td> <input type="text" style="width: 90px;" id="cost" name="cost" /></td>
				</tr>
				<tr>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp售价:</td>
					<td> <input type="text"  style="width: 90px;" id="price" name="price" /></td>
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
						onclick="return isCheckForm();"   value="提交" /></td>
				</tr>
				
			
				
			</table>

		</form>
          
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
		
		alert("子框架里文本框里的内容为："+$("#content").val());
	 ;
		if($("#title").val()==null||$("#title").val().length<1){
			alert("请写标题");
			return false;
		}
	
		
		return true; 
		
	}
		
	</script>
    
</body>
</html>