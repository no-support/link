<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${not empty layout }">
	<c:if test="${layout eq 1 }">
		<div class="col-sm-9">
	</c:if>
	<c:if test="${layout eq 2 }">
		<div class="col-sm-9">
	</c:if>
	
	<c:if test="${layout eq 3 }">
		<div class="col-sm-12">
	</c:if>
	
	<c:if test="${layout eq 4 }">
		<div class="col-sm-12">
	</c:if>
</c:if>
<c:if test="${empty layout }">
	<c:if test="${(blog.layout eq 1)}">
		<div class="col-sm-9">
	</c:if>
	<c:if test="${(blog.layout eq 2)}">
		<div class="col-sm-9">
	</c:if>
	
	<c:if test="${(blog.layout eq 3)}">
		<div class="col-sm-12">
	</c:if>
	<c:if test="${(blog.layout eq 4)}">
		<div class="col-sm-12">
	</c:if>
</c:if>