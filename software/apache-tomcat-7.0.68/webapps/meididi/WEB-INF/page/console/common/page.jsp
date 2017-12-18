<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
    function topage(page){ 
        var form = document.forms[0];   
        form.page.value=page; 
        form.submit();
    } 
    function delClick(){ 
        if(confirm('确定删除吗？')){
            var form = document.forms[0];   
            form.del.value="del"; 
            form.submit();
        }
    } 
    function clearClick(){ 
            var form = document.forms[0];   
            form.clear.value="clear"; 
            form.submit();
    } 
</script>
<div class="page_list">
<span class="text">共<strong>${pageView.totalpage}</strong>页,<strong>${pageView.totalrecord}</strong>条记录</span>
   <c:if test="${pageView.currentpage==1}">
       <span class="disabled">首页</span>
       <span class="disabled">上一页</span>
    </c:if>
    <c:if test="${pageView.currentpage!=1}">
        <a href="javascript:topage('1')" class="a03">首页</a>
        <a href="javascript:topage('${pageView.currentpage-1}')" class="a03">上一页</a>
    </c:if>
    <span class="current">${pageView.currentpage}</span>
    <c:if test="${pageView.currentpage!=pageView.totalpage}">
        <a href="javascript:topage('${pageView.currentpage+1}')" class="a03"> 下一页</a>
        <a href="javascript:topage('${pageView.totalpage}')" class="a03">末页</a>
    </c:if>
    <c:if test="${pageView.currentpage==pageView.totalpage}">
       <span class="disabled">下一页</span>
       <span class="disabled">末页</span>
    </c:if>
</div>
