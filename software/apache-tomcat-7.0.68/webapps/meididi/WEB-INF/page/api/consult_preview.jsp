<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
        
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<base href="<%=basePath%>">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="robots" content="">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp">
<link href="assets/css/api/beila_style.css" type="text/css" rel="stylesheet">
<link href="assets/css/api/lrtk.css" type="text/css" rel="stylesheet">
<script src="assets/js/api/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/api/jquery.imgbox.pack.js" type="text/javascript"></script>

<title>我的咨询师-介绍</title>
</head>

<body>
<div class="contentBox">
	<header class="beila_header">
		<article class="beila_intro">
			<p class="ico_head">
               <img class="img_dengj" src="assets/images/icon_head_bg3.png" alt="">
               <a id="icon" href="upload${consultant.photo }">
                   <img src="upload${consultant.photo }">
               </a>
            </p>
			<a href="javascript:;" title="">${consultant.name }<em class="levels">Lv.${consultant.lv}</em></a>
			<a href="javascript:;" title="" class="fs26">${hospital.name }</a>
            <p class="img_grade"><img src="assets/images/iss5.png" alt=""></p>
		</article>
		
	</header>
	<div class="beila_kuang">
		<h1 class="beila_title">
		<img src="${hospital.logo }" alt="" class="beila_logo">所属医院背景</h1>
		<blockquote>
			${hospital.information }
		</blockquote>
	</div>
	<div class="beila_kuang">
		<h1 class="beila_title">整形项目</h1>
		<p class="plastic_item">
			<c:forEach var="tip" items="${tips}">
                <a href="javascript:;" title="">${tip.value}</a>
        	</c:forEach>
          
    </p>
	</div>
	<div class="beila_kuang">
		<h1 class="beila_title">医师团队</h1>
		<ul class="zs_team">
			<c:forEach var="team" items="${teams}">
          	 	<li><a href="javascript:;" title="">
          	 		<img src="upload${team.photo }" alt="">
          	 		<span>${team.name }</span>
          	 		</a>
          	 	</li>
          	 	
        	</c:forEach>
                    			
		</ul>
	</div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#icon').imgbox(
            {
                'speedIn'		: 0,
				'speedOut'		: 0,
				'alignment'		: 'center',
				'overlayShow'	: true,
				'allowMultiple'	: false
            }
        );
    });
</script>


<div id="imgbox-loading"><div style="opacity: 0.4;"></div></div><div id="imgbox-overlay"></div></body></html>