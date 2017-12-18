<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>

<html>
<head>
<meta charset="utf-8" />
<title>提问</title>
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
 --> 

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
</head>
<body style="background-image:url(${contextPath}/manage/upload/img/bs.jpg);"  topmargin=0 leftmargin=0 onload="init()">
	<div  >
		<h1><center>专题上传</center></h1>
		<form action="${contextPath}/api/Hospital/themeUpload" method="post" name="picForm"
			enctype="multipart/form-data" >
			<table  cellpadding="0" cellspacing="0" >
				<tr>
					<td>标题</td>
					<td> <input type="text" style="width: 645px;" id="title" name="title" /></td>
				</tr>
				
				<tr style="display: none;">
					<td>问题</td>
					<td>
					<input type="text" style="width: 645px;" id="askTitle" name="askTitle" value=" " />
					</td>
				</tr>
				<!-- 
				<tr>
					<td >图片:
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				 -->
				<tr>
					<td style="width: 100px;">封面图片460*240:
					</td>
					<td><input
						type="file"  name="files" /></td>
				</tr>
				
				
				<tr>
					<td>内容：</td>
					<td colspan="2"><textarea name="content" id="content"
							cols="100" rows="8"
							style="width: 500px; height: 500px; visibility: hidden;"></textarea>

					</td>
				</tr>
				
				<tr>
					<td>作者</td>
					<td> <input type="text" style="width: 645px; " id="author" name="author" /></td>
				</tr>
				
				
				
				
				
				
				
				
				
				<tr>
					<td >
					</td>
					<td >已选美容师
					
					<!-- -->
					<div id=divcName style="background-color:#00D5FF;width: 200px;"></div>
					
					<div style="display: none" id=divcid></div>
					<!--  已选咨询师id 用于提交 -->
					<input style="display:none; " type="text"  id=consutantIds name=consutantIds >
					</td>
				
					
					
				</tr>
				
				
				<tr>
					
					
					<td >
					</td>
					<td >名字,医院名,手机号:<input id=texthosname type="text"/><input type="button" onclick="zixuns(0);" value="搜索"/>
					</td>
					
				</tr>
				<tr >
					<td>选择咨询师：</td>
					<td>
					<!-- 
						<label><input onclick="cktd(0)" id=radioxz name="radioxz" type="radio" value="" checked="checked" />默认咨询师</label> 

						<label><input onclick="cktd(1)" name="radioxz" type="radio" value="" />自选</label>
 -->
	<div   id=divlc>
	<!-- 用于记录分页  页数 -->
	<div style="display:none ;" id=currentPage>0</div>
			<table  id=Result border="1" cellpadding="2" cellspacing="0">
		
				<tr>
					<td>咨询师
					</td>
					<td >医院信息

					</td>
					<td >手机号

					
					
					
				</tr>
			<!-- 循环输出咨询师信息 -->
			<c:forEach items="${consltl}" var="z" varStatus="s">
				<tr >
					<td>
						<label name=lname>
							<input  name="consutantIdsinput" id="<c:out value="${z.id}"/>"
							 type="checkbox" 
							 onclick="return conCheck('<c:out value="${z.name}"/>','<c:out value="${z.id}"/>');"
							  value="<c:out value="${z.name}"/>,<c:out value="${z.id}"/>" />
   						
   						
   							<c:out value="${z.name}"/>
   						</label>
					</td>
					<td >
						<c:out value="${z.hosName}"/>
					</td>
					<td >
						<c:out value="${z.phone}"/>
					</td>
					
				</tr>
			</c:forEach>
			
				<tr>
					<td >
						<input type="button" onclick="zixuns(0);" value="首页"/>
						<input type="button" onclick="zixuns(-1);"  value="上一页"/>
						<input type="button" onclick="zixuns(1);"  value="下一页"/>				
					</td>
					
				</tr>
				
				
				 <!--
				<label><input name="tipsId" type="checkbox" value="<c:out value="${z.id}"/>," />
   <c:out value="${z.content}"/></label> 
   个数<c:out value="${s.count}"/> 
    -->


  
			</table>

</div>
					</td>
				</tr>
				
				
				
				
				<tr >
					<td>标签：</td>
					<td colspan="2">
					
					<!-- 循环输出标签 -->
		<c:forEach items="${list}" var="z" varStatus="s">
 
   
   						<label><input name="tipsId" id="tipsId"  type="checkbox" value='<c:out value="${z.id}"/>' />
   							<c:out value="${z.content}"/></label> 
   				<!-- 个数<c:out value="${s.count}"/> 
   					<c:if test="${s.count}%9==0}"></c:if>
    					-->
		

  		</c:forEach>
					
					</td>
				</tr>
				
				
				<tr>
					<td></td>
							<td><br /> <input type="submit" name="button"
						onclick="return isCheckForm();"  style="width: 50%; height:30px;background-color: #7FFFD4;" value="提交" /></td>
				</tr>

			</table>

		</form>
		
		</div>

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
		$.ajax({
				
				url:turl,
				 dataType: "json", 
					async:false,
					success: function (data) {  
						var val = data["consltl"];//获取json中的 key
						var ht="";
						if(val==null){
							return ;
						}
						
						$("#Result tr:gt(0)").remove();
						
						for (i=0; i<val.length; i++) {
							
							//alert(val[i].name);
							//var name=val[i].name;
							ht+='<tr >';
								ht+='<td>';
									ht+='<label>';
										ht+='	<input  name="consutantIdsinput" type="checkbox"';
											ht+='onClick="javascript:return conCheck('+val[i].id+','+val[i].id+')"';
										
											ht+='value='+val[i].name+","+val[i].id+'>';
										ht+='	'+val[i].name+'';
									//	ht+='<input type="button" onclick="cka();">';
									ht+='</label>';
								ht+='</td>';
								ht+='	<td >';
								ht+='	'+val[i].hosName+'';
								ht+='	</td>';
								ht+='	<td >';
								ht+='	'+val[i].phone+'</td>';
							ht+='	</tr>';
							
												
						}
						ht+='<tr>';
							ht+='<td >';
								ht+='	<input type="button" onclick="zixuns(0);"  value="首页"/>';
								ht+='	<input type="button" onclick="zixuns(-1);"  value="上一页"/>';
								ht+='   <input type="button" onclick="zixuns(1);"  value="下一页"/>';
							ht+='</td>';
					    ht+='</tr>';
					   
						$("#Result").append(ht);
						var divId=$("#consutantIds").val();
						var chk_value =[];//定义一个数组
						chk_value=divId.split(",");
						
						//全部的
						$(document.getElementsByName('consutantIdsinput')).each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数      
				         		   
				    	for(var i=0;i<chk_value.length;i++){
				    		//alert(chk_value[i]);
				    		if($(this).val().split(",")[1]==chk_value[i]){
				    			 $(this).attr("checked","checked");
				    		}
				    	}
				 		
				        });   
						$("#divlc").show();
						// location.reload();
					
					}
		})
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
			  document.getElementById("divcName").innerHTML=divcName+"<br>美容师："+lname+" "; 
			  
		  }
		 
		  return true;
		  
	}
	
	
	
	//判断提交的表单
	function isCheckForm(){
		if($("#consutantIds").val()==""||$("#consutantIds").val().split(",").length!=4){
			alert("请选择三个咨询师");
			return false;
		}
		if($("#title").val()==null||$("#title").val().length<1){
			alert("请写标题");
			return false;
		}
		
	
		if($('input[name="tipsId"]:checked')[0]==null){
			alert("请选标签！");
			return false;
		}
		if($("#author").val()==null||$("#author").val().length<1){
			alert("请写作者");
			return false;
		}
		
		return true; 
		
	}
	</script>
</html>
