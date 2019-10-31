<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-sm-12 blog_beauty_mainheader">
		<ul class="blog_beauty_ul">
			<li class="${column eq 'updateProfile' ? 'blog_beauty_selected1' : ''}"><a href="beauty.do">기본 설정</a></li>
			<li class="${column eq 'beautifyblog' ? 'blog_beauty_selected1' : ''}"><a href="beautifyblog.do">꾸미기 설정</a></li>
			<li class="${column eq 'menu' ? 'blog_beauty_selected1' : ''}"><a href="alterCategory.do">메뉴,글 관리</a></li>
		</ul>
	</div>
	<hr class="blog_beauty_hr1">
</div>