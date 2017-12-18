<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="common/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/assets/css/fsgallery.css">
<style type="text/css">
	#up0,#up1{
		    height: 30px;
    width: 96px;
    /* margin: 44px; */
    margin-top: 10px;
    margin-left: 46px;
	}
	
</style>
</head>
<body>
<form action="${ctx}/console/hospitalAccount_input" method="post" id="hospitalAccountForm">
<div class="inquire_list account_infor">
		
        <table class="table">
            <thead>
                <tr>
                    <th colspan="2" class="c_error f16">医院账号信息</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td width="13%"><br></td>
                </tr>
                <tr>
                    <td>医院名称</td>
                    <td>
                    	<input type="text" name="hosInf.name" value="${hosInf.name}"/>
                    	
                    </td>
                </tr>
                <tr>
                    <td>医院账号</td>
                    <td>
                    	<input type="text" name="hospitalAccount.accounts" value="${hospitalAccount.accounts}"/>
                    </td>
                </tr>
                <tr>
                    <td>医院联系人</td>
                    <td>
                    	<input type="text" name="hosInf.contacts" value="${hosInf.contacts}"/>
                    </td>
                </tr>
                <tr>
                    <td>手机号</td>
                    <td>
                    	<input type="text" name="hospitalAccount.phone" value="${hospitalAccount.phone}"/>
                   </td>
                </tr>
               
                <tr>
                    <td>医院地址</td>
                    <td>
                    	<input type="text" name="hosInf.address" value="${hosInf.address}"/>
                    </td>
                </tr>
                <tr>
                    <td>联系邮箱</td>
                    <td>
                    	<input type="text" name="hosInf.email" value="${hosInf.email}"/>
                    	</td>
                </tr>
                <tr>
                    <td>医院网址</td>
                    <td><input type="text" name="hosInf.url" value="${hosInf.url}"/></td>
                </tr>
				<tr>
                    <td>抽成比率</td>
                    <td><input type="text" name="hospitalAccount.serviceCharge" value="${hospitalAccount.serviceCharge}"></td>
                </tr>
                <tr>
                    <td width="11%">提交时间</td>
                    <td>${fn:substring(hospitalAccount.createTime,0,10)}</td>
                </tr>

                <tr>
                    <td>审核时间</td>
                    <td>${fn:substring(hospitalAccount.checkTime,0,10)}</td>
                </tr>
                <tr>
                    <td>审核人</td>
                    <td>${hospitalAccount.checker}</td>
                </tr>
                <tr>
                    <td colspan="2">
                    <div class="gallery">
                    <ul class="account_pic" id="gallery">
                    
                    	<c:forEach var="img" items="${fn:split(hospitalAccount.img,',') }" varStatus="status">
                    		<li>
                    			<c:if test="${empty img||img==''}">
                    				<a href="${ctx }/assets/images/figure.png" id="" data-type="image">
	                           			<img src="${ctx }/assets/images/figure.png" alt="" >
	                           		</a>
	                           		<a class="btn_account_down"  href="${ctx }/download?fileName=${img}" title="点击下载">点击下载</a>	
                    			</c:if>
                    			<c:if test="${!empty img||img!='' }">
                    				<div>
	                    				<a href="${ctx }/upload${img}" data-type="image">
	                    					<img src="${ctx }/upload${img}" alt="" onerror="javascript:this.src='${ctx}/assets/images/figure.png'" />
	                    				</a>
                           			</div>
                           			<a class="btn_account_down"  href="${ctx }/download?fileName=${img}" title="点击下载">点击下载</a>
                           			<div class="uploadImage"  id="up${status.index}" ></div>
	                           		<input type="hidden" name="hospitalAccount.img" value="${img}">
                    			</c:if>
                       			
                     		</li>
                    	</c:forEach>
                    	</ul>
                       </div>
                    </td>
                </tr>
            </tbody>
        </table>
       
    </div>
    <div class="btn_return">
    	<input  type="hidden" name="hospitalAccount.id" value="${hospitalAccount.id }" id="accountId"/>
        <c:if test="${!empty hospitalAccount&&(hospitalAccount.state =='-1'||hospitalAccount.state =='-2') }">
        	<input type="button" value="审核通过" class="input_green" onclick='checkPass()' />
        	<input type="button" value="审核不通过" class="input_pink ml20" onclick='checkRefuse()' />
        </c:if>
        <c:if test="${!empty hospitalAccount&&(hospitalAccount.state=='0'||hospitalAccount.state=='1')}">
        	<input type="button" id="accountSub" value="保存"  class="input_grey ml20" />
        </c:if>
        <input type="button" value="返回" class="input_grey ml20" onclick="javascript:history.go(-1)"/>
    </div>
	<div class="popup_box" id='checkPassDiv' style="display: none">
    <cite class="popup_t">审核通过</cite>
    <div class="password_box">
        <div class="audit_box">
            <img alt="" src="${ctx }/assets/images/admin_pic.png">
            <p>操作成功</p>
        </div>
        <p class="password_btn">
            <input type="button" class="input_green" value="确认"  onclick="doCheckPass()"/>
            <input type="button" class="input_grey ml60" value="取消"  onclick="layer.closeAll()"/>
        </p>
    </div>
    
</div>
<div class="popup_box" id='checkRefuseDiv' style="display: none">
    <cite class="popup_t">审核结果备注</cite>
    <div class="password_box">
        <p class="cause_textarea">
            <textarea placeholder="请填写审核不通过原因..." rows="5" id='checkRefuseReason' value=""></textarea>
        </p>
        <p class="password_btn">
            <input type="button" class="input_green" value="确认" onclick="doCheckRefuse();"/>
            <input type="button" class="input_grey ml60" value="取消" onclick="layer.closeAll();"/>
        </p>
    </div>
    
</div>
 </form>
 <script type="text/javascript" src="${ctx}/assets/js/fs_forse.js"></script>
 <script type="text/javascript" src="${ctx }/assets/js/country.js"></script>
 <script type="text/javascript" src="${ctx }/assets/js/hos.account.js"></script>
<script >


	function checkRefuse() {
		layer.open({
			type : 1,
			title : false,
			shadeClose : true,
			closeBtn : 2,
			maxmin : true,
			content : $('#checkRefuseDiv')
		});
	}
	//确认审核通过
	function checkPass() {
		$.ajax({
			type : "POST",
			url : "hospitalAccount_checkState",
			data : {
				id : $("#accountId").val(),
				"pass" : "1"
			},
			success : function(data) {
				if (data == 'success') {
					layer.alert("操作成功", {
						title : false,
						closeBtn : false
					}, function() {
						history.go(-1);
					});
				} else {
					layer.alert("操作失败，请重试", {
						title : false,
						closeBtn : false
					}, function() {
						window.location.href='hospitalAccount_list';
					});
				}
			}
		});
	}
	function doCheckRefuse() {
		$.ajax({
			type : "POST",
			url : "hospitalAccount_checkState",
			data : {
				id : $("#accountId").val(),
				"pass" : "0",
				"inf":$("#checkRefuseReason").val()
			},
			success : function(data) {
				if (data == 'success') {
					layer.alert("操作成功", {
						title : false,
						closeBtn : false
					}, function() {
						window.location.href='hospitalAccount_list';
					});
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
	
	
		
		$.each($(".uploadImage"),function(i,v){
			console.log(i);
			var target = $("#up"+i);
			target.uploadify({
				'auto' : true, // 关闭自动上传
				'removeTimeout' : 1, // 文件队列上传完成1秒后删除
				'swf' : '../assets/js/uploadify/uploadify.swf',
				'uploader' : '../up_img',
				'method' : 'post', // 方法，服务端可以用$_POST数组获取数据
				'buttonText' : '点击修改', // 设置按钮文本
				'multi' : false, // 允许同时上传多张图片
				'fileTypeDesc' : '请选择图片文件', // 只允许上传图像
				'fileTypeExts' : '*.jpg;*.png;*.jpeg', // 限制允许上传的图片后缀
				'queueSizeLimit' : 1,
				'fileSizeLimit' : 2048,
				'progressData' : 'speed',
				'formData' : {},
				'onSelect' : function(event, queueId, fileObj) {
					imgSelect = layer.load(1, {
						shade : [ 0.1, '#fff' ]
					});
				},
				'onUploadError' : function(file, errorCode, errorMsg,
						errorString) {
				},
				'onSelectError' : function(file, errorCode, errorMsg) {
					if (errorCode == '-110') {
						layer.alert("文件太大，请上传小于2M的图片", {
							title : false,
							closeBtn : false
						});
					} else {
						layer.alert("上传失败，请重试", {
							title : false,
							closeBtn : false
						});
					}
				},
				'onUploadSuccess' : function(file, data, response) {// 每次成功上传后执行的回调函数，从服务端返回数据到前端
					
					if (data == '-1') {
						layer.alert("上传失败", {
							title : false,
							closeBtn : false
						});
						layer.close(imgSelect);
					} else {
						layer.closeAll();
						$("#up"+i).prev().attr("href","/meididi/download?fileName="+data);
						$("#up"+i).prev().prev().find("a").attr("href","/meididi/upload"+data);
						$("#up"+i).prev().prev().find("img").attr("src","/meididi/upload"+data);
						$("#up"+i).next().next().val(data);
					}
				}
			});
		});
	

</script>
</body>
</html>