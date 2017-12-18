<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/taglib.jsp" %>
</head>
<body>
        <!--right Start-->
            <form action="${ctx }/console/user_list" id="foodsForm" namespace="/console" method="post">
            <div class="inquire_box">
                    
                    <div class="keyword_box" style="width:177px;">
                        <em class="ico_search"></em>
                        <input type="text" class="w195" placeholder="请输入手机号" name="phone" value="${requestScope.phone }"
                               style="width:140px !important">
                    </div>
                	
                    <input type="submit" class="btn_inquire" value="查询">
               
            </div>
			<s:hidden name="page"></s:hidden>
			<s:hidden name="pagesize"></s:hidden>
            <div class="inquire_list">
                <table class="table">
                    <thead>
                    <tr>
                        <th width="10%">序号</th>
                        <th width="">最后上线时间</th>
                        <th width="">上线手机号</th>
                        <th width="">昵称</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="index" value="0"></c:set>
                    <c:forEach var="record" items="${request.records}" varStatus="status" >
                    	<c:set var="user" value="${record['user'] }"></c:set>
                    	<tr>
                        <td class="account_id">
                        	${status.index }
                        </td>
                        <td class="account_name">
                        	${record['time']}
                        </td>
                        <td>${user.phone }</td>
                        <td>${user.name}</td>
                    	</tr>
                    
                    </c:forEach>
                    
                    </tbody>
                </table>
                <!--page Start-->

                <div class="meidd_page_box">
                    <%@ include file="common/page.jsp"%>
                </div>
                <!--page End-->

            </div>
            </form>
        
</body>
</html>