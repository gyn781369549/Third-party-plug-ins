<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html>
<head>
<meta charset="utf-8" />
<title>下拉</title>
<script src="${contextPath}/meididi/manage/upload/js/jquery-1.8.0.min.js"></script>
</head>
<body style="background: #adc;">
	<from>
	<!-- 用于记录分页  页数 -->
	<div style="display:none ;" id=currentPage>0</div>
			<table  id=Result border="1" cellpadding="2" cellspacing="0">
				<tr>
				<td>咨询师id
					</td>
					<td>咨询师名字
					</td>
					<td >医院信息

					</td>
					<td >手机号

					
					
					
				</tr>
			<!-- 循环输出咨询师信息 -->
			<c:forEach items="${consltl}" var="z" varStatus="s">
				<tr >
					<td><c:out value="${z.id}"/>
					</td>
					<td>
						<label name=lname>
							<input  name="consutantIdsinput" id="<c:out value="${z.id}"/>"
							 type="checkbox" 
							 onclick="return ckconsutantIds();"
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
			</from>
</body>
<script type="text/javascript">


//点击选择咨询师  判读个数  获取咨询师id
function fun(name,id){
	var checks = document.getElementsByName("consutantIdsinput");//获取当前页面已选个数
	//var consutantIds=document.getElementById('consutantIds').value;//获取已选咨询师id
	//var arr = new Array();
	//arr = consutantIds.split(",");
  //  document.getElementById('consutantIds').value =consutantIds+id+",";// save id
	n = 0;
	for(i=0;i<checks.length;i++){
    if(checks[i].checked)
        	n++;
	}
	alert("选中项目数为："+n);
}
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
		//alert("currentPage"+$("#currentPage").html());
		var thn=$("#texthosname").val();
		var turl="/meididi/api/getConsultantToJson?currentPage="+$("#currentPage").html();
		if(thn!=null){
			if(thn.length>0){
			var turl="/meididi/api/getConsultantToJson?name="+thn+"&currentPage="+$("#currentPage").html();
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
							ht+='<tr >';
							ht+='<td>'+val[i].id+'</td>';
							
								ht+='<td>';
									ht+='<label>';
										ht+='	<input  name="consutantIdsinput" type="checkbox" onclick="return ckconsutantIds();"  value='+val[i].name+","+val[i].id+'>';
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
						
						// location.reload();
					
					}
		})
	})
	
	//控制默认选择 还是手动选择
	var cktd=(function(){
		//alert("点击了");
		if($("#divlc").is(":hidden")){
	       	$("#divlc").show();    //如果元素为隐藏,则将它显现
		}else{
	      $("#divlc").hide();     //如果元素为显现,则将其隐藏
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
        obj=chk_value[0];
        lname=obj.split(",")[0];
        id=obj.split(",")[1];
        
        
        //判断name，id 是否存在
        divcName=$("#divcName").text();
        divId=$("#consutantIds").val();
        //存在  移出对应name id
       alert("id=="+id+"shifou"+divId.indexOf(id+","));
    	 //alert(divcName);
        //存在需要删除  不存在 要新增
    	 if(divId!=null&&divId.indexOf(id+",")!=-1){
   				//删除
   				divcName=divcName.replace("美容师："+lname+" ", "");
   				$("#divcName").text(divcName); 
   				divId=divId.replace(id+",","");
   				$("#consutantIds").val(divId); 
   				
   		}else{
   				//用于显示美容师姓名
				$("#divcName").text($("#divcName").text()+"美容师："+lname+" "); 
				//用于记录美容师id
				$("#consutantIds").val( $("#consutantIds").val()+id+",");
   		}
    	 
      
    	
        return true;
		   
    })  
	</script>
</html>
