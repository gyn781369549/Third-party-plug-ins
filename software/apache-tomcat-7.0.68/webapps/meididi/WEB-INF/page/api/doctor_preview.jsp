<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
        
<!DOCTYPE html>
<html lang="zh"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
        <meta name="keywords" content="${hosName }">
        <meta name="description" content="${hosName }">
        <meta name="robots" content="">
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
        <meta http-equiv="Cache-Control" content="no-siteapp">
        <link href="assets/css/api/beila_style.css" type="text/css" rel="stylesheet">
        <title>医师介绍</title>
            </head>
    <body>
        <div class="contentBox">
            <div class="intro_box">
                <h1 class="beila_intro">
                    <p class="nedic_img">
                    <img src="upload${team.photo }" alt=""></p>
                    <p class="nedic_name">${team.name }</p>
                </h1>
                <blockquote>${team.information }</blockquote>
            </div>
        </div>
    
</body>
</html>