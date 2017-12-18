<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
	
</head>
<body style="background:transparent;">
 <!--right Start-->
 	<div class="bwh_crumbs">当前位置：<a href="javascript:void(0);" title="项目管理">项目管理</a><em>&gt;</em>创建项目</div>
    <form  id="enterProForm"  action="${ctx }/hospital/project_input" method="post">
        <div class="tabBox">
            <ul class="tabNav">
                <li class="now">项目介绍信息(必填)</li>
                <li>项目补充信息(选填)</li>
            </ul>
            <!--项目详情start-->

            <div class="proxx_box tabCont">
                <table class="xxMain">
                    <tbody>
                        <tr>
                            <th><em>*</em>项目封面图</th>
                            <td>
                                <div class="cover_pic">
                                    <c:if test="${project.cover=='' }">
                                		<img id="iconPreview0" src="${ctx }/assets/images/p108.png">
                                	</c:if>
                                	<c:if test="${project.cover!='' }">
                                		<img id="iconPreview0" src="${ctx }/upload${project.cover}">
                                	</c:if>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em>*</em>项目标题</th>
                            <td>
                                <div class="cname">${project.name }</div>
                            </td>
                        </tr>
                        <tr>

                            <th><em>*</em>项目标签</th>
                            <td>
                                <ul class="label_box label_list">
                                	<c:set var="tips" value="${fn:split(project.tips,',') }"></c:set>
									<c:if test="${fn:length(tips)>0 }">
										<c:forEach var="tip" items="${tips}">
										<c:if test="${tip!=null||tip!='' }">
											<li p_id="${tip}">
				                    		<input type="hidden" name="tips" value="${tip}">
				                     		<a href="javascript:void(0);">${allTips[tip] }</a>
				                     	</li>
										</c:if>
				                		
				                		</c:forEach>
									</c:if>		
                                    
                                    
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th><em>*</em>项目金额</th>
                            <td>
                                <div class="cname">${project.money }</div>
                            </td>
                        </tr>
                        <tr>

                            <th><em>*</em>项目介绍</th>
                            <td>
                                <div class="cname w700">
                                	${project.information }
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em>*</em>项目图片</th>
                            <td>

                                <div class="cname">
                                    <ul class="cimg">
                                    <c:if test="${project.imgs !=''}">
	                        		<c:if test="${fn:contains(project.imgs,',')}">
	                        			<c:forEach var="img" items="${fn:split(project.imgs,',')}">
	                        	 			<li>
	                                		<img id="iconPreview1" src="${ctx }/upload${img}" onerror="this.src='${ctx }/assets/images/figure.png'">
	                            			</li>
	                        			</c:forEach>
	                        		</c:if>
	                        		<c:if test="${!fn:contains(project.imgs,',')}">
	                        			<li>
	                                		<img  src="${ctx }/upload${project.imgs}" onerror="this.src='${ctx }/assets/images/figure.png'">
	                            		</li>
	                        		</c:if>
                        		</c:if>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--项目详情end-->
            <!--项目补充信息（选填）start-->
            <div class="replenish_infor tabCont">
                <table class="xxMain">
                    <tbody>
                        <tr>
                            <th><em></em>治疗时间</th>
                            <td class="w700">
                            	<c:set value="${project.needTime }" var="v"></c:set>
                            	<c:forEach var="time" items="${needTime }"> 
                            		<c:if test="${time.key == v}">
                            			${time.value}
                            		</c:if>
                            		
                            	</c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>是否住院</th>
                            <td>
                                <c:if test="${project.isIn== '0' }">
                                	不需要
                                </c:if>
                                <c:if test="${project.isIn== '1' }">
                                	需要
                                </c:if>
                                <c:if test="${project.isIn== '-1' }">
                                	未知
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>疼痛指数</th>
                            <td>
                                <div class="start_box">
                                	<img src="${ctx }/assets/images/iss${project.pain }.png" alt="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>风险指数</th>
                            <td>
                                <div class="start_box">
                                	<img src="${ctx }/assets/images/iss${project.danger }.png" alt="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>材料品牌</th>
                            <td>
                                <div class="cname">
                                <span>${project.material}</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>疤痕说明</th>
                            <td>
                                <div class="cname">
                                	<c:if test="${project.scarInf=='' }">无</c:if>
                                	<c:if test="${project.scarInf!='' }">${project.scarInf }</c:if>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><em></em>恢复说明</th>
                            <td>
                                <div class="cname">
                                	<c:if test="${project.recoveryInf=='' }">无</c:if>
                                	<c:if test="${project.recoveryInf!='' }">${project.recoveryInf }</c:if>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!--项目补充信息（选填）end-->
        </div>
        <div class="btn_tab">
            <input type="button" class="input_green mr20" value="修改" onclick="window.location.href = '${ctx}/hospital/project_input?id=${project.id }'">
            <input type="button" class="input_green" value="返回" onclick="window.location.href = '${ctx}/hospital/project_list'">
        </div>
    </form>
    
    
    <script type="text/javascript">
    $(document).ready(function () {
        //danxuan
        $(".repForm span").click(function () {
            $(this).siblings().removeClass("checked");
            $(this).toggleClass("checked");
        });
        //项目切换
        $(".tabBox .tabCont:first").css("display", "block");
        $(".tabBox .tabNav li").click(function () {
            $(this).siblings("li").removeClass("now");
            $(this).addClass("now");
            $(this).parents(".tabBox").find(".tabCont").css("display", "none");
            var i = $(this).parents(".tabNav").find("li").index($(this));
            $(this).parents(".tabBox").find(".tabCont:eq(" + i + ")").css("display", "block");
        });
    });
</script>
</body>
</html>