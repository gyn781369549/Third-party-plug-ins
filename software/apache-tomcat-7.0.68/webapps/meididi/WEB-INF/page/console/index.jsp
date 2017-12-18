<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<%@include file="common/taglib.jsp" %>
	<script type="text/javascript" src="${ctx}/assets/js/index.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/cutImage.js"></script>
	
</head>
<body role="document" class="login_bg">
	<div class="meidd_bg">
    	<!--header Start-->
    	<header class="meidd_header">
        	<div class="left_box">
            	<div class="left_logo">
            		
                	<img src="${ctx }/assets/images/ico_meidd_logo1.png" alt="">
            	</div>
        	</div>
        <cite id="menu_title" class="meidd_crumbs"><strong>医院账号管理</strong><em>/</em><b>医院账号列表</b></cite>
    	</header><!--header End-->
    <div class="meidd_cont">
        <!--菜单-->
        <%@ include file="common/left.jsp" %>
		<div class="meidd_right_box" id="meiddRight">
        	<iframe name="main_content" id="main_content" src="console/hospitalAccount_list" border="0" frameborder="0" style="padding: 0px; margin: 0px;width: 100%;min-height: 630px;"onload="this.height=(this.contentWindow.document.body.offsetHeight+30);"></iframe>
		</div>
    </div>
    <!--footer Start-->
    <footer class="meidd_footer">CopyRight©www.meididi.com.cn</footer>
    <!--footer End-->
	</div>
	<div class="popup_box upload_pic" id="resetAdminPsdDiv" style="display:none">
    <cite class="popup_t">修改密码</cite>
    <form method="post" class="password_cont" id="resetAdminPsdForm" name="resetAdminPsdForm"
           action="" novalidate="novalidate">
        <div class="password_box">
            <div class="alter_code">
                <p class="code_form">
                    <input type="password" placeholder="请输入当前使用密码" id="oldPwd" name="adminPwd">
                    <label id="adminPwd-error" class="error code_error_hint" for="adminPwd"
                           style="display: block;"></label>
                </p>
                <p class="code_form">
                    <input type="password" placeholder="请输入新密码，6-18位数字及字母，不支持特殊字符及空格" id="newPwd"
                           name="adminPwd1"><span>*</span>
                    <label id="adminPwd1-error" class="error code_error_hint" for="newPwd"
                           style="display: block;"></label>

                </p>
                <p class="code_form">
                    <input type="password" placeholder="请重复输入新密码" id="newPwd2" name="adminPwd2"><span>*</span>
                    <label id="adminPwd2-error" class="error code_error_hint" for="newPwd2"
                           style="display: block;"></label>
                </p>
            </div>
            <p class="password_btn">
                <input type="button" id="resetSubmit" class="input_green" value="确认">
                <input type="reset" class="input_grey ml60" value="取消" onclick="layer.closeAll();">
            </p>
        </div>
    </form>
	</div>

	<div class="popup_box upload_pic" id="upIconDiv" style="display: none">
    <cite class="popup_t">头像上传</cite>
    <!-- <form class="pic_uploading" action="" method="post"> -->
        <div class="password_box">
            <div class="uploading_cont">
                <p class="default_pic">
                	<c:if test="${!empty sessionScope.admin.photo&&sessionScope.admin.photo != '' }">
            			<img id="iconPreview" src="${ctx }/upload${sessionScope.admin.photo}" alt="">
            		</c:if>
            		<c:if test="${empty sessionScope.admin.photo||sessionScope.admin.photo == '' }">
            			<img id="iconPreview" src="${ctx }/assets/images/admin_pic.png" alt="">
            		</c:if>
                    <span></span>
                </p>
                
                <div class="upload_box clearfix">
                    <div id="uploadIcon" class="uploadify" style="height: 30px; width: 120px;">
                        
                        <div id="uploadIcon-button" class="uploadify-button "
                             style="height: 30px; line-height: 30px; width: 120px;"><span class="uploadify-button-text">浏览上传</span>
                        </div>
                    </div>
                    <div id="uploadIcon-queue" class="uploadify-queue"></div>
                    
                    <input type="hidden" name="icon_val" value="${sessionScope.admin.photo}" id="icon_val">
                </div>
                <p class="upload_hint" style="text-align: center;">上传头像图片支持JPG、JPEG、PNG格式;<br>上传头像图片大小不超过2M
                </p>

            </div>
            <p class="password_btn">
                <input type="button" id="upPhotoSub" class="input_green" value="确认">
                <input type="reset" class="input_grey ml60" value="取消" onclick="layer.closeAll();">
            </p>
        </div>
    <!-- </form> -->
	</div>
	
	
	<%-- <div class="popup_box2 upload_pic" id="upCutDiv" style="display: none">
	<form action="" id="cutForm">
	<cite class="popup_t">裁剪</cite>
		 <div class="" style="height:450px; width: 450px;overflow-y: hidden; overflow-x:hidden; ">
		 	<img id="cutPhoto" src="" style="background-color: #FFF" >
         </div>
         <p class="password_btn">
         	<input type="button" class="input_green" value="确认" onclick="subCut()">
         	<input type="reset" class="input_grey ml60" value="取消" onclick="layer.closeAll();">
         </p>
         <input type="hidden" id="photo" name="photo" value="" />
         <input type="hidden" id="who" name="who" value="admin" />
         <input type="hidden" id="id" name="id" value="${session.admin.id }" />
         
         <input type="hidden" id="x" name="x" value="" />
         <input type="hidden" id="y" name="y" value="" />
         <input type="hidden" id="w" name="w" value="" />
         <input type="hidden" id="h" name="h" value="" />
         
         <input type="hidden" id="rw" name="rw" value="" />
         <input type="hidden" id="rh" name="rh" value="" />
      </form>
	</div> --%>
	
	
	
    <script type="text/javascript">
    function cut_submit(){ Jcrop_index_cut_submit("iconPreview","icon_val",false); }
        $(document).ready(function () {
        	
            $("#datepicker , #datepicker1").datepicker({
                changeMonth: true,
                changeYear: true, dateFormat: 'yy-mm-dd'
            });//日期修改年份

        });
    </script>
</body>
</html>