<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>

</head>
<body>
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
<!--right Start-->

    <div class="inquire_list account_infor project_infor">
        <table class="table">
            <thead>
                <tr>
                    <th colspan="2" class="c_error f16">基础信息</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td width="11%"><br/></td>
                </tr>
                <tr>
                    <td width="11%">医院名称</td>
                    <td>${account.name }</td>
                </tr>
                <tr>
                    <td>创建时间</td>
                    <td>${project.createTime }</td>

                </tr>
                
            </tbody>
        </table>
    </div>
    <div class="inquire_list account_infor project_infor">
        <table class="table">
            <thead>
                <tr>
                    <th colspan="2" class="c_error f16">项目详情</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td width="11%"><br/></td>
                </tr>
                <tr>
                    <td width="11%">项目封面图</td>
                    <td>
                        <p class="project_pic">
                        	<c:if test="${empty project.cover||project.cover == ''}">
                               	<img id="iconPreview0" src="${ctx }/assets/images/p108.png"  ></img>
                            </c:if>
                            <c:if test="${!empty project.cover&&project.cover != '' }">
                                <img id="iconPreview0" src="${ctx }/upload${project.cover}"></img>
                            </c:if>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>项目名称</td>
                    <td>${project.name }</td>

                </tr>
                <tr>
                    <td>项目标签</td>
                    <td>
                    	<c:set var="tips" value="${fn:split(project.tips,',') }"></c:set>
							<c:if test="${fn:length(tips)>0 }">
								<c:forEach var="tip" items="${tips}">
									${allTips[tip] }<i class="space_mark">/</i>
				                </c:forEach>
						</c:if>
                        
                    </td>								
                </tr>
                <tr>
                    <td>项目金额</td>
                    <td>￥${project.money }</td>
                </tr>
                <tr>
                    <td>项目介绍</td>
                    <td>
                        <div class="project_intro">
                        	${project.information }
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>项目图片</td>
                    <td>
                        <div class="project_intro project_img">
                        	<c:if test="${project.imgs !=''}">
	                        		<c:if test="${fn:contains(project.imgs,',')}">
	                        			<c:forEach var="img" items="${fn:split(project.imgs,',')}">
	                        	 			<li>
	                                		<img id="iconPreview1" src="${ctx }/upload${img}" >
	                            			</li>
	                        			</c:forEach>
	                        		</c:if>
	                        		<c:if test="${!fn:contains(project.imgs,',')}">
	                        			<li>
	                                		<img  src="${ctx }/upload${project.imgs}" onerror="this.src='${ctx }/assets/images/figure.png'">
	                            		</li>
	                        		</c:if>
                        		</c:if>              
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="inquire_list account_infor project_infor">
        <table class="table">
            <thead>
                <tr>
                    <th colspan="2" class="c_error f16">项目补充信息（选填）</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td width="11%"><br/></td>
                </tr>
                <tr>
                    <td width="11%">治疗时间</td>
                    <td>
                    	<c:forEach var="time" items="${needTime }">
                    		<c:if test="${time.key == project.needTime }">
                    			${time.value }
                    		</c:if>
                    	</c:forEach>
                    	
                    </td>
                </tr>
                <tr>
                    <td>是否住院</td>
                    <td>
                    	<c:if test="${project.isIn==0 }">不需要
                        </c:if>
                        <c:if test="${project.isIn==1 }">需要
                        </c:if>
                        <c:if test="${project.isIn==0 }">未知
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>疼痛指数</td>
                    <td>
                        <div class="start_box"><img src="${ctx }/assets/images/iss${project.pain }.png" alt=""></div>
                    </td>								
                </tr>
                <tr>
                    <td>风险指数</td>
                    <td>
                        <div class="start_box"><img src="${ctx }/assets/images/iss${project.danger }.png" alt=""></div>
                    </td>
                </tr>
                <tr>
                    <td>材料品牌</td>
                    <td>${project.material}</td>
                </tr>
                <tr>
                    <td>疤痕说明</td>
                    <td><c:if test="${project.scarInf=='' }">无</c:if>
                        <c:if test="${project.scarInf!='' }">${project.scarInf }</c:if></td>
                </tr>
                <tr>
                    <td>恢复说明</td>
                    <td>
                        <div class="project_intro">
                        	<c:if test="${project.recoveryInf=='' }">无</c:if>
                            <c:if test="${project.recoveryInf!='' }">${project.recoveryInf }</c:if>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_return"><input type="submit" value="返回" class="input_grey" onclick="window.location.href = 'project_list'"/></div>

</body>
</html>