<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-3">
		<div class="col-sm-11 blog_main_left_row_bottom" style="">
			<div class="row">
				<!-- 첫 영역 시작  -->
				<c:if test="${firstCol eq 'profile' }">
					<%@ include file="../blogchangeform/profile.jsp"%>
				</c:if>
				<c:if test="${firstCol eq 'category' }">
					<%@ include file="../blogchangeform/category.jsp"%>
				</c:if>
				<c:if test="${firstCol eq 'bloginfo' }">
					<%@ include file="../blogchangeform/bloginfo.jsp"%>
				</c:if>
				<!-- 첫 영역 끝  -->
			</div>
		</div>
</div>

<div class="col-sm-3">
		<div class="col-sm-11 blog_main_left_row_bottom" style="">
			<div class="row">
				<!-- 두번째 영역 시작  -->
				<c:if test="${secondCol eq 'profile' }">
					<%@ include file="../blogchangeform/profile.jsp"%>
				</c:if>
				<c:if test="${secondCol eq 'category' }">
					<%@ include file="../blogchangeform/category.jsp"%>
				</c:if>
				<c:if test="${secondCol eq 'bloginfo' }">
					<%@ include file="../blogchangeform/bloginfo.jsp"%>
				</c:if>
				<!-- 두번째 영역 끝 -->
			</div>
		</div>
</div>

<div class="col-sm-3">
		<div class="col-sm-11 blog_main_left_row_bottom" style="">
			<div class="row">
				<!-- 세번째 영역 시작  -->
				<c:if test="${thirdCol eq 'profile' }">
					<%@ include file="../blogchangeform/profile.jsp"%>
				</c:if>
				<c:if test="${thirdCol eq 'category' }">
					<%@ include file="../blogchangeform/category.jsp"%>
				</c:if>
				<c:if test="${thirdCol eq 'bloginfo' }">
					<%@ include file="../blogchangeform/bloginfo.jsp"%>
				</c:if>
				<!-- 세번째 영역 시작  -->
			</div>
		</div>
</div>