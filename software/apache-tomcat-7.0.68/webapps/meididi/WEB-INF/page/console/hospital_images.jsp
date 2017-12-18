<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/assets/css/fsgallery.css">

</head>
<body>
        <!--right Start-->
      <form action="${ctx }/console/hospitalInf_images" method="post">
      	
      	 <div class="inquire_box">
            <div class="keyword_box" style="width:177px;">
                <em class="ico_search"></em>
                <input type="text" placeholder="请输入医院名称" name="keywords" value="${keywords }"
                       style="width:140px !important" id="searchHosAccount">
            </div>
            
            <input type="submit" class="btn_inquire" value="查询">
               
            </div>
      	<s:hidden name="page"></s:hidden>
		<s:hidden name="pagesize"></s:hidden>
        <div class="tabCont" id="basic" style="display: block;">
            
                <ul>
                <c:forEach var="inf" items="${information}">
                    <li>
                        <p>${inf.name }</p>
                        <dl class="uploading_img_dl " style="left: 0px;">
                    	<ul id="gallery">
                        		
                        	<c:forEach var="img" items="${fn:split(inf.imgs,',')}" varStatus="status">
                        	 	<c:if test="${img!=null&&image!='' }">
                        	 	<dd style="margin-right: 30px;">
                        	 	<li>
                        	 		<a href="${ctx }/upload${img}" data-type="image">
                                		<img id="img${inf.id}${status.index}" src="${ctx }/upload${img}" >
                                	</a>
                                	<input url="${img}" class="input_green ml40" 
                                		style="height: 18px;line-height: 18px;" 
                                		onclick="cut_init(this)" type="button" value="编辑" />
                            	</li>
                            	</dd>
                            	</c:if>
                        	</c:forEach>
                        		<%-- <c:if test="${!fn:contains(hospitalInformation.imgs,',')}">
                        			<dd>
                        				
                        				<a href="${ctx }/upload${img}">
                                		<img id="iconPreview1" src="${ctx }/upload${hospitalInformation.imgs}" >
                                		</a>
                                		
                            		</dd>
                        		</c:if> --%>
                        	
                        </ul>
                        </dl>
                    </li>
                    </c:forEach>
                </ul>
                <div class="meidd_page_box">
                    
                    <%@ include file="common/page.jsp"%>
                </div>
        </div>
        </form>
 <script type="text/javascript" src="${ctx}/assets/js/fs_forse.js"></script>
 <script type="text/javascript" src="${ctx}/assets/js/hospital/cutImage.js"></script>
<script>
	var imgId;
	function cut_init(e){
		var imgsrc = $(e);
		imgId = imgsrc.prev().children("img:first").attr("id");
		Jcrop_init_2(imgsrc.attr("url"),null,null);
	}
	function cut_submit(){
		
		Jcrop_cut_submit_no(imgId,false);
	}

	
</script>                <!--right End-->

   
</body></html>