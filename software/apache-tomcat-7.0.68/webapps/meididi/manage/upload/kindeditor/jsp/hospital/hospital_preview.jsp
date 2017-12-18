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
        <meta charset="utf-8" />
        <meta name="keywords" content="贝拉国际医学美容机构 整形 贝拉 美容 台湾" />
        <meta name="description" content="贝拉国际医学美容机构 整形 美容 Ada Leo Emily Blanche 林博士 Micheal" />
        <meta name="robots" content="">
        <base href="<%=basePath%>">
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link href="assets/css/beila_style1.css" type="text/css" rel="stylesheet">
        <title>医师介绍</title>
                    <style>
                @media only screen and (max-width: 319px){
                    body {font-size: .6em!important;}
                    .contentBox{padding:0 .325em .333em}
                    .picBox, .beila_jig_pic, .ym_pic{height:auto;line-height:normal}
                    .picBox img, .beila_jig_pic img, .ym_pic img{height:auto;}
                }
                .intro_box{margin-top:0.3em;padding-bottom:.3em}
                .jig_jies{padding-left:0.5em}
                .intro_box blockquote{margin:.3em .2em 0 .4em;line-height:1.8em}
                .beila_title{font-size: 1.2em;}
                .beila_jig_pic{background-color:transparent;}
                .contentBox{min-height: 377px; 
                }
            </style>
            </head>
    <body>
        <div class="contentBox">
            <div class="intro_box">
                <h1 class="beila_title jig_jies">所属医院背景</h1>
                <blockquote>${information.information}</blockquote>
				<c:if test="${information.imgs !=''}">
               		<c:if test="${fn:contains(information.imgs,',')}">
               			<c:forEach var="img" items="${fn:split(information.imgs,',')}">
               	 			<p class="beila_jig_pic">
                       		<img id="iconPreview1" src="upload${img}" width="120px;" height="90px;" onerror="this.src='<%=basePath%>assets/images/figure.png'">
                   			</p>
               			</c:forEach>
               		</c:if>
               		<c:if test="${!fn:contains(information.imgs,',')}">
               			<p class="beila_jig_pic">
                       		<img id="iconPreview1" src="upload${information.imgs}" width="120px;" height="90px;" onerror="this.src='<%=basePath%>assets/images/figure.png'">
                   		</p>
               		</c:if>
               	</c:if>
            </div>
        </div>
    </body>
</html>