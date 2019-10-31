<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-12">
	<h5>
		<strong style="font-size: 15px;">카테고리</strong>
	</h5>
</div>
<div class="col-sm-12 blog-detail-showlist">
	<span class="glyphicon glyphicon-list-alt"></span> <span class="blog-detail-showall">전체보기</span>
</div>
<c:forEach var="subCat" items="${subCategories }">
	<div class="col-sm-12 blog-detail-showlist">
		<span class="glyphicon glyphicon-list-alt"></span> <span class="blog-detail-showall">${subCat.title }</span>
		<c:forEach var="cat" items="${subCat.blogCategory}">
			<div class="col-sm-12">
				<a href="detail.do?blogNo=${blog.no }&categoryNo=${cat.no}"><span class="blog-detail-showall">&nbsp;┗ <span class="${param.categoryNo eq cat.no ? 'blog_board_selected' : ''}">${cat.title }</span></span></a>
			</div>
		</c:forEach>
	</div>
</c:forEach>