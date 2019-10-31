<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-3">
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1 blog_main_left_row" style="">
			<div class="row">
				<!-- 첫 영역 시작  -->
				<c:if test="${blog.firstCol eq 'profile' }">
					<%@ include file="../blogchangeform/profile.jsp"%>
				</c:if>
				<c:if test="${blog.firstCol eq 'category' }">
					<%@ include file="../blogchangeform/category.jsp"%>
				</c:if>
				<c:if test="${blog.firstCol eq 'bloginfo' }">
					<%@ include file="../blogchangeform/bloginfo.jsp"%>
				</c:if>
				<!-- 첫 영역 끝  -->
				<div class="col-sm-12">
					<hr style="border-bottom: 1px dashed;" />
				</div>
				<!-- 두번째 영역 시작  -->
				<c:if test="${blog.secondCol eq 'profile' }">
					<%@ include file="../blogchangeform/profile.jsp"%>
				</c:if>
				<c:if test="${blog.secondCol eq 'category' }">
					<%@ include file="../blogchangeform/category.jsp"%>
				</c:if>
				<c:if test="${blog.secondCol eq 'bloginfo' }">
					<%@ include file="../blogchangeform/bloginfo.jsp"%>
				</c:if>
				<!-- 두번째 영역 끝 -->
				<div class="col-sm-12">
					<hr style="border-bottom: 1px dashed;" />
				</div>
				<!-- 세번째 영역 시작  -->
				<c:if test="${blog.thirdCol eq 'profile' }">
					<%@ include file="../blogchangeform/profile.jsp"%>
				</c:if>
				<c:if test="${blog.thirdCol eq 'category' }">
					<%@ include file="../blogchangeform/category.jsp"%>
				</c:if>
				<c:if test="${blog.thirdCol eq 'bloginfo' }">
					<%@ include file="../blogchangeform/bloginfo.jsp"%>
				</c:if>
				<!-- 세번째 영역 시작  -->
			</div>
		</div>
	</div>
</div>