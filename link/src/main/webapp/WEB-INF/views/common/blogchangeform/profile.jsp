<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-12 blog_detail_left_col_img_col">
	<a target="blank" href="/link/resources/images/${blog.mainImg }"><img class="blog_detail_left_col_img" src="/link/resources/images/${blog.mainImg }" alt=""></a>
</div>
<div class="col-sm-12 blog-detail-left-col-user">
	<div class="row">
		<div class="col-sm-12">
			<a href="profile.do?blogNo=${blog.no }"><strong style="font-size: 15px;">${user.nickName }</strong></a>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12" style="font-size: 12px;">(${user.id})</div>
	</div>
</div>
<div class="col-sm-12 blog_detail_leftcol_contents">
	<span class="blog-detail-contents">${blog.description }</span>
</div>
<!-- 내 블로그면  시작-->
<c:if test="${isMyBlog eq 'others' }">
	<div class="col-sm-12 blog_detail_leftcol_contents2">
		<a href="profile.do?blogNo=${blog.no }">프로필<span class="glyphicon glyphicon-play blog-detail-profile"></span></a> <a href="">쪽지<span class="glyphicon glyphicon-play blog-detail-profile"></span></a>
	</div>
</c:if>
<c:if test="${isMyBlog eq 'mine' }">
	<div class="col-sm-12 blog_detail_leftcol_contents2">
		<a href="write.do?blogNo=${blog.no }&categoryNo=${category.no}"><span class="glyphicon glyphicon-tags blog-detail-function1"></span>&nbsp;글쓰기</a> <a href="beauty.do?blogNo=${blog.no }"><span
			class="glyphicon glyphicon-cog blog-detail-function2"
		></span>&nbsp;관리,통계</a>
	</div>
</c:if>
<c:if test="${isMyBlog eq 'others' }">
	<!-- 이웃이 아니면  -->
	<c:if test="${isNeighbor eq 'N' }">
		<div class="col-sm-8 col-sm-offset-2 blog_detail_neighborplus text-center">
			<a href="addNeighbor.do?blogNo=${blog.no }"><span class="blog_detail_plus">+</span><span class="blog_detail_plus2">이웃추가</span></a>
		</div>
	</c:if>
	<!-- 이웃이면  -->
	<c:if test="${isNeighbor eq 'Y' }">
		<div class="col-sm-8 col-sm-offset-2 blog_detail_neighborplus text-center">
			<a href=""><span class="blog_detail_plus2">이웃</span></a>
		</div>
	</c:if>
	
</c:if>
<!-- 내 블로그면 끝  -->