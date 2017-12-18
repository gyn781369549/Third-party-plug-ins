<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
        
<!DOCTYPE html>
<html lang="zh"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">

<meta name="keywords" content="${hosInf.name }">
<meta name="description" content="${hosInf.name }">
<meta name="robots" content="">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link href="assets/css/api/beila_style.css" type="text/css" rel="stylesheet">
<link href="assets/css/api/swiper.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="assets/js/api/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/api/slides.min.jquery.js"></script>
<title>${project.name }</title>
</head>

<body>
<div class="box">
	<!--轮播图-->
    <nav class="figure_box">
		<div class="swiper-container f_ifocus_lis swiper-container-horizontal">
			<div class="swiper-wrapper slides_container" style="transform: translate3d(-1520px, 0px, 0px); transition-duration: 0ms;">
                 <c:forEach var="img" items="${fn:split(project.imgs,',') }">
                 	<c:if test="${img!=null&&img!='' }">
                 		<div class="swiper-slide" style="width: 380px;"><img src="upload${img }" alt=""><p class="gallerytitle ftext">${project.name }</p></div>
                 	</c:if>
                 		
                 </c:forEach>
                 
                
            </div>
			<div class="swiper-pagination swiper-pagination-clickable"><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span></div>
		</div>
	</nav>
	
    <!--轮播图end-->
	<article class="shouc_box">
		<cite>官方报价:<i class="f24">¥</i><em class="f34">${project.money }</em></cite>
		<p class="guanf_text">${project.information }</p>
	</article>
	<article class="shouc_box">
		<h3>服务流程</h3>
		<dl class="fuwulc"><dt>Step1</dt><dd>线上付款</dd></dl>
		<dl class="fuwulc"><dt>Step2</dt><dd>到院签到</dd></dl>
		<dl class="fuwulc"><dt>Step3</dt><dd>进行治疗</dd></dl>
		<dl class="fuwulc"><dt>Step4</dt><dd>评价晒单</dd></dl>
	</article>
        
	<article class="shouc_box">
        <p class="top_t">${project.name }小档案</p>
		<table class="shouc_table">
			<tbody>
            </tbody>
		</table>
		<c:forEach var="img" items="${fn:split(project.imgs,',') }">
           <c:if test="${img!=null&&img!='' }">
                <p class="picBox"><img src="upload${img }" alt=""></p>
           </c:if>
                 		
        </c:forEach>
        
   </article> 
</div>
<script type="text/javascript">
var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        //nextButton: '.swiper-button-next',
        //prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 0,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    });
</script>

</body></html>