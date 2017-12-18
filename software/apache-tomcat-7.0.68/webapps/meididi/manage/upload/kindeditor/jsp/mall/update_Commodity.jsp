<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>

<html>
<head>
<meta charset="utf-8" />
<title>广告发布</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/manage/upload/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${contextPath}/manage/upload/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="${contextPath}/manage/upload/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="${contextPath}/manage/upload/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="${contextPath}/manage/upload/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="${contextPath}/manage/upload/kindeditor/jsp/js/jquery.cityselect.js"></script> 
<script language="javascript" src="${contextPath}/manage/upload/kindeditor/jsp/js/cityselect.js"></script>
<script src="${contextPath}/manage/upload/js/jquery-1.9.1.js"></script>
<!--
<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
 

<script type="text/javascript">
	function cka(){
		 if(confirm("确定放弃当前操作返回主页？ "))
		 	{
			
			  return true;
		 	}
		 		else{
			   return false;
		 		}
	}

	

	function check(creator)
	{
		 var imgFile=creator.imgFile.value;   
		 var imgFilemax=creator.imgFilemax.value;   
		  var title = document.getElementById("title").value;
		  var summary = document.getElementById("summary").value;
		  var imgFilemax = document.getElementById("imgFilemax").value;
		  var img = document.getElementById("imgFile").value;
		
		  var area = document.getElementById("province").value;
		  var areas = document.getElementById("city").value;
		  var timet = document.getElementById("timet").value;
		  var point = imgFile.lastIndexOf(".");
		  var type = imgFile.substr(point);
		 var p= imgFilemax.lastIndexOf(".");
		 var typemax = imgFilemax.substr(p); 
		
		   if (title==""||title==null||title.length>30)
	    	{
	    		alert("请填写30个汉字以内标题！");
	    	
	    		return false;
	  	}
	    if (summary==""||summary==null||summary.length>30)
	    	{
	    		alert("请正确填写概要30字以内！");
	    	
	    		return false;
	  	}
	    if (area==""||area==null)
		{
			alert("请填写地区省级！");
		
			return false;
		}
	    if (areas==""||areas==null)
		{
			alert("请填写地区市级！");
		
			return false;
		}
	    if (timet==""||timet==null)
		{
			alert("请输入时间！");
		
			return false;
		} 
	    if(type!=".jpg"&&type!=".gif"&&type!=".JPG"&&type!=".GIF"){  
			  alert("小图 请上传 正确格式的图片   您传的是"+type);
			  return false;
		  } 
		  if(typemax!=".jpg"&&typemax!=".gif"&&typemax!=".JPG"&&typemax!=".GIF"){  
			  alert("大图 请上传 正确格式的图片   您传的是"+typemax);
			  return false;
		  } 
return true;
	}
	
	
	
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
	--> 
</head>
<body style="background-image:url(${contextPath}/manage/upload/img/bs.jpg);"  topmargin=0 leftmargin=0 onload="init()">

		<h1><center>更新商品</center></h1>
		<form action="${contextPath}/mall/mallCommodityAction/update" method="post" name="picForm"
			enctype="multipart/form-data" >
			<table  cellpadding="0" cellspacing="0" >
			
				<c:forEach  items="${lcdty}" varStatus="i" var="account">
				
						 <input type="text" style="display: none;" id="" value="${account.id}" name="cid" />
						 
						
						
				<tr>
					<td>商品标题</td>
					<td> <input type="text" style="width: 645px;" id="title" value="${account.title}" name="title" /></td>
				</tr>
				
				<tr>
				<td>商品封面图</td>
					<td>
					<img style="width: 100px;height: 100px;" src="${account.coverpic}"  alt="pic" />
				
						</td>
				</tr>
				<tr>
				<td>商品轮播图</td>
					<td>
					
					<!--  -->
						 <c:forEach items="${account.slpic}" var="age" >  
  							
  						
							<img style="width: 100px;height: 100px;" src="${age}"  alt="pic" />
							</c:forEach>  
						</td>
				</tr>
					<tr>
					<td ><div id="ip5s">商品封面图:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				<tr>
					<td ><div id="ip5s">示例图1:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				
				<tr>
					<td ><div id="ip6s">示例图2:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				<tr>
					<td ><div id="ip6p">示例图3:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				<tr>
					<td ><div id="ip6p">示例图4:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				<tr>
					<td ><div id="ip6p">示例图5:</div>
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				 
				<tr>
					<td>商品内容</td>
					<td colspan="2"><textarea name="content" id="content"
							cols="100" rows="8"
							>${account.content}</textarea>

					</td>
				</tr>
				<tr>
					<td>安全性</td>
					<td> 
					<textarea name="safety" id="safety" 
							cols="100" rows="8">${account.safety}</textarea>
					
					</td>
				</tr>
				<tr>
					<td>用途</td>
					<td><textarea name="cuse" id="cuse"
							cols="100" rows="8">${account.cuse}</textarea> </td>
				</tr>
					<tr>
					<td>原价</td>
					<td> <input type="text" style="width: 45px;" id="cost" value="${account.cost}" name="cost" /></td>
				</tr>
				<tr>
					<td>售价</td>
					<td> <input type="text"  style="width: 45px;" id="price" value="${account.price}" name="price" /></td>
				</tr>
					<tr>
					<td>商品是否上线</td>
					<td><select name=valid >
					
							<option value="y">上线</option>
							<option value="n">下线</option>
							</select></td>
				</tr>
				<tr>
					<td>商品类别</td>
							<td>
							<select name=id id=friend>
							</select>	</td>
				</tr>
				
				<tr>
					<td></td>
							<td><br /> <input type="submit" name="button"
						onclick="return isCheckForm();"  style="width: 50%; height:30px;background-color: #7FFFD4;" value="提交更新" />
						<input type="button" name="button"
						  style="width: 50%; height:30px;background-color: #7FFFD4;" value="删除" />
						</td>
				</tr>
				
			
					</c:forEach>
			</table>

		</form>
		

</body>
<script type="text/javascript">

//num区分上一页 首页 下一页 -1 0 1
	var zixuns=(function(num) {
		
		if(num>0){
			 $("#currentPage").html( parseInt($("#currentPage").html())+1); 
		}
		
		if(num<0){
		 	 $("#currentPage").html(parseInt($("#currentPage").html())-1==-1?0:parseInt($("#currentPage").html())-1); 
		}
		
		if(num==0){
			 $("#currentPage").html(parseInt(0)); 
		}
		
		//alert("${contextPath}");
		var thn=$("#texthosname").val();
		var turl="${contextPath}/api/getConsultantToJson?currentPage="+$("#currentPage").html();
		if(thn!=null){
			if(thn.length>0){
			var turl="${contextPath}/api/getConsultantToJson?name="+thn+"&currentPage="+$("#currentPage").html();
			}
		}
		
		//alert("num"+num+"cpe"+ $("#currentPage").html());
	
	})
	
	//控制默认选择 还是手动选择
	var cktd=(function(num){
		
		//alert("点击了");
		
		if(num==0){
			
			 $("#divlc").hide();     //如果元素为显现,则将其隐藏
			 $("#consutantIds").val("");
		     $("#divcName").text("");
		     $(document.getElementsByName('consutantIdsinput')).each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数      
		    	 
		   			  $(this).attr("checked",false);//清除
		        
		       }); 
		}
		
		if(num==1){
		 	$("#divlc").show();    //如果元素为隐藏,则将它显现
		}
		
		if($("#divlc").is(":hidden")){
	    //   	$("#divlc").show();    //如果元素为隐藏,则将它显现
		}else{
	     
		}
	})	
	//记录选择内容 判断个数
	var ckconsutantIds=(function() {
		var lname,id,obj,divcName,divId;
		var num=$("#consutantIds").val().split(",").length ;//获取选中个数
		if(num>=4){
		 		$("input[name='consutantIdsinput']").attr("disabled",true);	
		 		 return false;
		 }  
		//获取name，id
        var chk_value =[];//定义一个数组      
        $('input[name="consutantIdsinput"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数      
        chk_value.push($(this).val());//将选中的值添加到数组chk_value中      
        });    
        obj=chk_value[chk_value.length-1];
        lname=obj.split(",")[0];
        id=obj.split(",")[1];
        
        
        //判断name，id 是否存在
        divcName=$("#divcName").text();
        divId=$("#consutantIds").val();
        //存在  移出对应name id
       
    	 //alert(divcName);
    	 if(divcName!=null&&divcName.indexOf("美容师："+lname+" ")!=-1){
   				//删除
   				//divcName=divcName.replace("美容师："+lname+" ", "");
   				//$("#divcName").text(divcName); 
   				//divId=divId.replace(id+",","");
   			//	$("#consutantIds").val(divId); 
   				
   		}else{
   				//用于显示美容师姓名
				$("#divcName").text($("#divcName").text()+"美容师："+lname+" "); 
				//用于记录美容师id
				$("#consutantIds").val( $("#consutantIds").val()+id+",");
   		}
    	 
      
    	
        return true;
		   
    })
    
    
    //处理选中 咨询师 新增咨询师
	function conCheck(lname,id)
	{
	
		var chk_value =[];//定义一个数组      
		//全部的
		$(document.getElementsByName('consutantIdsinput')).each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数      
        chk_value.push($(this).val());//将选中的值添加到数组chk_value中        		   
 		if($(this).val().split(",")[1]==id){
 			 lname=$(this).val().split(",")[0];	
 			  $(this).attr("checked","checked");
        }
        });    
       
		//存到text的 咨询师 id
		var divId = document.getElementById("consutantIds").value;
		var divcName = document.getElementById("divcName").innerHTML;
		
		//alert("id:"+id+"\nlname:"+lname+"\ndivId:"+divId+"\ndivcName:"+divcName);
		   
		  //存在删除掉
		  if(divId!=null&&divId.indexOf(id+",")!=-1){
			  
			  divId=divId.replace(id+",","");
			  document.getElementById("consutantIds").value=divId;			  
			  divcName=divcName.replace("美容师："+lname+" ","");
			  document.getElementById("divcName").innerHTML=divcName;
			  return true;
			  
		  }else{
			  
			  if(divId!=null&&document.getElementById("consutantIds").value.split(",").length>=4){
				  return false;
			  }
			  document.getElementById("consutantIds").value=divId+id+","; 
			  document.getElementById("divcName").innerHTML=divcName+"美容师："+lname+" "; 
			  
		  }
		 
		  return true;
		  
	}
	
	
	
	//判断提交的表单
	function isCheckForm(){
		
		if($("#title").val()==null||$("#title").val().length<1){
			alert("请写标题");
			return false;
		}
	
		
		
		return true; 
		
	}
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
	</script>
</html>
