<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${blog.layout eq 1 }">
	<%@include file="../../common/blog/blogleft.jsp"%>
</c:if>

<c:if test="${blog.layout eq 2 }">
	<%@include file="../../common/blog/blogleft.jsp"%>
</c:if>

<c:if test="${blog.layout eq 3 }">
	<%@include file="../../common/blog/blogLeftFor3and4.jsp"%>
</c:if>

<c:if test="${blog.layout eq 4 }">
	<%@include file="../../common/blog/blogLeftFor3and4.jsp"%>
</c:if>